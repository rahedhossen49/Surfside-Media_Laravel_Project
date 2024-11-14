<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Surfsidemedia\Shoppingcart\Facades\Cart;

class WishlistController extends Controller
{

        public function index(){

            $items = Cart::instance('wishlist')->content();
            return view('wishlist', compact('items'));
        }

    public function add_to_wishlist(Request $request){

        Cart::instance('wishlist')->add($request->id, $request->name, $request->quantity, $request->price)->associate('App\Models\Product');
        return redirect()->back();
    }

    public function remove_item($rowId){
        Cart::instance('wishlist')->remove($rowId);
        return redirect()->back();
    }

    public function empty_wishlist(){
        Cart::instance('wishlist')->destroy();
        return redirect()->back();
    }

    public function move_to_cart($rowId){

        $item = Cart::instance('wishlist')->get($rowId);
        Cart::instance('wishlist')->remove($rowId);
        Cart::instance('cart')->add($item->id, $item->name, $item->qty,$item->price)->associate('App\Models\Product');
        return redirect()->back();
    }

//     public function move_to_cart($rowId)
// {
//     // প্রথমে চেক করি যে 'wishlist' কার্টে ঐ আইটেমটি আছে কি না
//     $item = Cart::instance('wishlist')->get($rowId);

//     // যদি আইটেমটি পাওয়া না যায়
//     if (!$item) {
//         return redirect()->back()->with('error', 'Item not found in the wishlist.');
//     }

//     // 'wishlist' থেকে আইটেমটি সরিয়ে ফেলুন
//     Cart::instance('wishlist')->remove($rowId);

//     // 'cart' (শপিং কার্ট) এ আইটেমটি যোগ করুন
//     Cart::instance('cart')->add([
//         'id' => $item->id, // পণ্যের আইডি
//         'name' => $item->name, // পণ্যের নাম
//         'quantity' => $item->qty, // পরিমাণ
//         'price' => $item->price, // দাম
//         'attributes' => $item->attributes, // অতিরিক্ত বৈশিষ্ট্য (যদি থাকে)
//     ])->associate('App\Models\Product'); // পণ্যের মডেল অ্যাসোসিয়েট করা

//     // পুনরায় ব্যবহারকারীকে আগের পৃষ্ঠায় নিয়ে আসুন, সফল বার্তা সহ
//     return redirect()->back()->with('success', 'Item successfully moved to the cart.');
// }

}
