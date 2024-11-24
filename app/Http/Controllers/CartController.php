<?php

namespace App\Http\Controllers;

use App\Library\SslCommerz\SslCommerzNotification;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\Address;
use App\Models\OrderItem;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Surfsidemedia\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
    public function index()
    {

        $items = Cart::instance('cart')->content();
        return view('cart', compact('items'));
    }

    public function add_to_cart(Request $request)
    {

        Cart::instance('cart')->add($request->id, $request->name, $request->quantity, $request->price)->associate('App\Models\Product');
        return redirect()->back();
    }


    public function increase_cart_quantity($rowId)
    {

        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty + 1;
        cart::instance('cart')->update($rowId, $qty);
        return redirect()->back();
    }

    public function decrease_cart_quantity($rowId)
    {
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty - 1;
        Cart::instance('cart')->update($rowId, $qty);
        return redirect()->back();
    }

    public function remove_item($rowId)
    {

        Cart::instance('cart')->remove($rowId);
        return redirect()->back();
    }


    public function empty_cart()
    {

        Cart::instance('cart')->destroy();
        return redirect()->back();
    }

    public function apply_coupon_code(Request $request)
    {
        $coupon_code = $request->coupon_code;
        if (isset($coupon_code)) {
            // Fetch coupon details
            $coupon = Coupon::where('code', $coupon_code)
                ->where('expiry_date', '>=', Carbon::today())
                ->where('cart_value', '<=', Cart::instance('cart')->subtotal())  // Check if cart value is sufficient
                ->first();

            if (!$coupon) {
                // Log or return more specific error messages for debugging
                return redirect()->back()->with('error', 'Invalid Coupon Code or Conditions Not Met');
            } else {
                Session::put('coupon', [
                    'code' => $coupon_code,
                    'type' => $coupon->type,
                    'value' => $coupon->value,
                    'cart_value' => $coupon->cart_value,
                ]);

                $this->calculateDiscount();
                return redirect()->back()->with('success', 'Coupon has been applied');
            }
        } else {
            return redirect()->back()->with('error', 'Coupon code is required');
        }
    }



    public function calculateDiscount()
    {
        $discount = 0;
        if (Session::has('coupon')) {
            if (Session::get('coupon')['type'] == 'fixed') {  // Corrected typo here
                $discount = Session::get('coupon')['value'];
            } else {
                $discount = (Cart::instance('cart')->subtotal() * Session::get('coupon')['value']) / 100;
            }

            $subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $discount;
            $taxAfterDiscount = ($subtotalAfterDiscount * config('cart.tax')) / 100;
            $totalAfterDiscount = $subtotalAfterDiscount + $taxAfterDiscount;

            Session::put('discounts', [
                'discount' => number_format(floatval($discount), 2, '.', ''),
                'subtotal' => number_format(floatval($subtotalAfterDiscount), 2, '.', ''),
                'tax' => number_format(floatval($taxAfterDiscount), 2, '.', ''),
                'total' => number_format(floatval($totalAfterDiscount), 2, '.', ''),
            ]);
        }
    }



    public function remove_coupon_code()
    {

        Session::forget('coupon');
        Session::forget('discounts');
        return back()->with('success', 'Coupon has been removed');
    }


    public function checkout()
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        $address = Address::where('user_id', Auth::user()->id)->where('isdefault', 1)->first();
        return view('checkout', compact('address'));
    }

    public function place_an_order(Request $request)
    {
        $user_id = Auth::user()->id;
        $address = Address::where('user_id', $user_id)->where('isdefault', true)->first();

        if (!$address) {

            $request->validate([
                'name' => 'required|max:100',
                'phone' => 'required|numeric|digits:11',
                'country' => 'required',
                'state' => 'required',
                'zip' => 'required|numeric',
                'address' => 'required',
            ]);


            $address = new Address();
            $address->name = $request->name;
            $address->phone = $request->phone;
            $address->country = $request->country;
            $address->state = $request->state;
            $address->zip = $request->zip;
            $address->address = $request->address;
            $address->user_id = $user_id;
            $address->isdefault = true;
            $address->save();
        }
        $this->setAmountforCheckout();

        $order = new Order();
        $order->user_id = $user_id;
        $order->subtotal = (float) str_replace(',', '', Session::get('checkout')['subtotal']);
        $order->discount = (float) str_replace(',', '', Session::get('checkout')['discount']);
        $order->tax = (float) str_replace(',', '', Session::get('checkout')['tax']);
        $order->total = (float) str_replace(',', '', Session::get('checkout')['total']);
        $order->name = $address->name;
        $order->phone = $address->phone;
        $order->locality = $address->state;
        $order->address = $address->address;
        $order->city = $address->state;
        $order->state = $address->state;
        $order->country = $address->country;
        $order->landmark = $address->address;
        $order->zip = $address->zip;
        $order->save();

        foreach (Cart::instance('cart')->content() as $item) {


            $orderItem = new OrderItem();
            $orderItem->product_id = $item->id;
            $orderItem->order_id = $order->id;
            $orderItem->price = $item->price;
            $orderItem->quantity = $item->qty;
            $orderItem->save();
        }


        if ($request->mode == "cod") {
            $transaction = new Transaction();
            $transaction->user_id = $user_id;
            $transaction->order_id = $order->id;
            $transaction->mode = $request->mode;
            $transaction->status = 'pending';
            $transaction->trans_id = uniqid();
            $transaction->save();
        } elseif ($request->mode == "online") {

            $transaction = new Transaction();
            $transaction->user_id = $user_id;
            $transaction->order_id = $order->id;
            $transaction->mode = $request->mode;
            $transaction->status = 'pending';

            $post_data = array();
            $post_data['total_amount'] = $order->total;
            $post_data['currency'] = "BDT";
            $post_data['tran_id'] = uniqid(); // tran_id must be unique

            # CUSTOMER INFORMATION
            $post_data['cus_name'] =  $request->name;
            $post_data['cus_email'] = $request->email;
            $post_data['cus_add1'] = $request->address;
            $post_data['cus_add2'] = $request->address2 ? $request->address2 : "N/A";
            $post_data['cus_city'] =  $request->state;
            $post_data['cus_state'] = $request->state;
            $post_data['cus_postcode'] = $request->zip;
            $post_data['cus_country'] = $request->country;
            $post_data['cus_phone'] = $request->phone;
            $post_data['cus_fax'] =  $request->fax ? $request->fax : "N/A";

            # SHIPMENT INFORMATION
            $post_data['ship_name'] = "Store Test";
            $post_data['ship_add1'] = "Dhaka";
            $post_data['ship_add2'] = "Dhaka";
            $post_data['ship_city'] = "Dhaka";
            $post_data['ship_state'] = "Dhaka";
            $post_data['ship_postcode'] = "1000";
            $post_data['ship_phone'] = "";
            $post_data['ship_country'] = "Bangladesh";

            $post_data['shipping_method'] = "NO";
            $post_data['product_name'] = "Computer";
            $post_data['product_category'] = "Goods";
            $post_data['product_profile'] = "physical-goods";

            # OPTIONAL PARAMETERS
            $post_data['value_a'] = "ref001";
            $post_data['value_b'] = "ref002";
            $post_data['value_c'] = "ref003";
            $post_data['value_d'] = "ref004";


            // #Before  going to initiate the payment order status need to insert or update as Pending.
            // $update_product = DB::table('orders')
            //   ->where('transaction_id', $post_data['tran_id'])
            //   ->updateOrInsert([
            //     'name' => $post_data['cus_name'],
            //     'discount' => $post_data['cus_name'],
            //     'tax' => $post_data['cus_name'],
            //     'total' => $post_data['cus_name'],
            //     'locality' => $post_data['cus_name'],
            //     'subtotal' => $post_data['cus_name'],
            //     'city' => $post_data['cus_name'],
            //     'state' => $post_data['cus_name'],
            //     'country' => $post_data['cus_name'],
            //     'landmark' => $post_data['cus_name'],
            //     'zip' => $post_data['cus_name'],
            //     'phone' => $post_data['cus_phone'],
            //     'amount' => $post_data['total_amount'],
            //     'status' => 'Pending',
            //     'address' => $post_data['cus_add1'],
            //     'transaction_id' => $post_data['tran_id'],
            //     'currency' => $post_data['currency']
            //   ]);

            $transaction->trans_id = $post_data['tran_id'];
            $transaction->save();

            $sslc = new SslCommerzNotification();
            # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
            $payment_options = $sslc->makePayment($post_data, 'hosted');

            if (!is_array($payment_options)) {
                print_r($payment_options);
                $payment_options = array();
            }
        }

        Cart::instance('cart')->destroy();
        Session::forget('checkout');
        Session::forget('coupon');
        Session::forget('discounts');
        Session::put('order_id', $order->id);
        return redirect()->route('cart.order.confirmation');
    }

    public function setAmountforCheckout()
    {

        if (!Cart::instance('cart')->content()->count() > 0) {

            Session::forget('checkout');
            return;
        }

        if (Session::has('coupon')) {

            Session::put('checkout', [

                'discount' => Session::get('discounts')['discount'],
                'subtotal' => Session::get('discounts')['subtotal'],
                'tax' => Session::get('discounts')['tax'],
                'total' => Session::get('discounts')['total'],
            ]);
        } else {

            Session::put('checkout', [

                'discount' => 0,
                'subtotal' => Cart::instance('cart')->subtotal(),
                'tax' => Cart::instance('cart')->tax(),
                'total' => Cart::instance('cart')->total(),
            ]);
        }
    }


    public function order_confirmation()
    {
        if (Session::has('order_id')) {
            $order = Order::find(Session::get('order_id'));
            return view('order-confirmation', compact('order'));
        }
        return redirect()->route('cart.index');
    }
}
