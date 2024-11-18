<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function user_account(){

        $user = Auth::user();
        return view('user.user_account',compact('user'));
    }



    public function orders()
    {
        $orders = Order::where('user_id',Auth::user()->id)->orderBy('created_at','DESC')->paginate(10);
        return view('user.orders',compact('orders'));
    }


    public function order_details($order_id){
        $order = Order::where('user_id',Auth::user()->id)->where('id',$order_id)->first();
        if($order){
            $orderItems = OrderItem::where('order_id',$order->id)->orderBy('id')->paginate(12);
            $transaction = Transaction::where('order_id',$order->id)->first();
            return view('user.order-details',compact('order','orderItems','transaction'));
        }
        else {

            return redirect()->route('login');
        }

    }


    public function order_cancel(Request $request){
        $order = Order::find($request->order_id);
        $order->status = "canceled";
        $order->canceled_date = Carbon::now();
        $order->save();
        return back()->with('status',"Order has been cancelled successfully");
    }

    public function updateUserAccount(Request $request)
    {
        // Auth ফ্যাসেড ব্যবহার করে ইউজারের আইডি নিয়ে আসা
        $user = User::find(Auth::id());

        // যদি ইউজার না পাওয়া যায়, রিডাইরেক্ট করবেন
        if (!$user) {
            return redirect()->route('login');
        }

        // ইনপুট ভ্যালিডেশন
        $request->validate([
            'name' => 'required|string|max:255',
            'mobile' => 'required|string|max:15',
            'email' => 'required|email|max:255',
            'old_password' => 'nullable|string|min:6',
            'new_password' => 'nullable|string|min:6|confirmed',
        ]);

        // নাম, মোবাইল, এবং ইমেইল আপডেট
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->email = $request->email;

        // পুরানো পাসওয়ার্ড চেক করা এবং নতুন পাসওয়ার্ড আপডেট করা
        if ($request->old_password && Hash::check($request->old_password, $user->password)) {
            $user->password = Hash::make($request->new_password);
        } elseif ($request->old_password) {
            return back()->withErrors(['old_password' => 'Old password does not match.']);
        }

        // ইউজার সেভ করা
        $user->save();

        return back()->with('success', 'Account details updated successfully!');
    }



}
