<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Surfsidemedia\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
          public function index(){

            $items = Cart::instance('cart')->content();
            return view('cart',compact('items'));
          }

          public function add_to_cart(Request $request){

            Cart::instance('cart')->add($request->id,$request->name,$request->quantity,$request->price)->associate('App\Models\Product');
            return redirect()->back();
          }


          public function increase_cart_quantity($rowId){

            $product = Cart::instance('cart')->get($rowId);
            $qty = $product->qty + 1;
            cart::instance('cart')->update($rowId,$qty);
            return redirect()->back();
          }

          public function decrease_cart_quantity($rowId){
            $product = Cart::instance('cart')->get($rowId);
            $qty = $product->qty - 1;
            Cart::instance('cart')->update($rowId,$qty);
            return redirect()->back();
          }

          public function remove_item($rowId){

            Cart::instance('cart')->remove($rowId);
            return redirect()->back();
          }


          public function empty_cart(){

            Cart::instance('cart')->destroy();
            return redirect()->back();
          }

          public function apply_coupon_code(Request $request) {
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



          public function calculateDiscount() {
            $discount = 0;
            if(Session::has('coupon')) {
                if(Session::get('coupon')['type'] == 'fixed') {  // Corrected typo here
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



         public function remove_coupon_code(){

            Session::forget('coupon');
            Session::forget('discounts');
            return back()->with('success','Coupon has been removed');
         }

}
