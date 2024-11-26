<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Brand;
use App\Models\Order;
use App\Models\Slide;
use App\Models\Coupon;
use App\Models\Contact;
use App\Models\Product;
use App\Models\Category;
use App\Models\OrderItem;
use App\Models\Transaction;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Intervention\Image\Laravel\Facades\Image;
use App\Models\User;

class AdminController extends Controller
{
    public function index()
    {

        $admins = User::where('utype', 'ADM')->get();

        $orders = Order::orderBy('created_at', 'DESC')->get()->take(10);
        $dashboardDatas = DB::select("Select sum(total) As TotalAmount,
        sum(if(status='ordered',total,0)) As TotalOrderedAmount,
        sum(if(status='delivered',total,0)) As TotalDeliveredAmount,
        sum(if(status='canceled',total,0)) As TotalCanceledAmount,
        Count(*) As Total,
        sum(if(status='ordered',1,0)) As TotalOrdered,
        sum(if(status='delivered',1,0)) As TotalDelivered,
        sum(if(status='canceled',1,0)) As TotalCanceled
        From Orders
        ");


        $monthlyDatas = DB::select("SELECT
    M.id AS MonthNo,
    M.name AS MonthName,
    IFNULL(D.TotalAmount, 0) AS TotalAmount,
    IFNULL(D.TotalOrderedAmount, 0) AS TotalOrderedAmount,
    IFNULL(D.TotalDeliveredAmount, 0) AS TotalDeliveredAmount,
    IFNULL(D.TotalCanceledAmount, 0) AS TotalCanceledAmount
    FROM
    month_names M
    LEFT JOIN (
     SELECT
        MONTH(created_at) AS MonthNo,
        SUM(total) AS TotalAmount,
        SUM(IF(status = 'ordered', total, 0)) AS TotalOrderedAmount,
        SUM(IF(status = 'delivered', total, 0)) AS TotalDeliveredAmount,
        SUM(IF(status = 'canceled', total, 0)) AS TotalCanceledAmount
        FROM Orders WHERE YEAR(created_at) = YEAR(NOW()) GROUP BY
        MONTH(created_at) ORDER BY MONTH(created_at)) D ON D.MonthNo = M.id
      ORDER BY M.id");

        $AmountM = implode(',', collect($monthlyDatas)->pluck('TotalAmount')->toArray());
        $OrderedAmountM = implode(',', collect($monthlyDatas)->pluck('TotalOrderedAmount')->toArray());
        $DeliveredAmountM = implode(',', collect($monthlyDatas)->pluck('TotalDeliveredAmount')->toArray());
        $CanceledAmountM = implode(',', collect($monthlyDatas)->pluck('TotalCanceledAmount')->toArray());

        $totalAmount = collect($monthlyDatas)->sum('TotalAmount');
        $totalOrderedAmount = collect($monthlyDatas)->sum('TotalOrderedAmount');
        $totalDeliveredAmount = collect($monthlyDatas)->sum('TotalDeliveredAmount');
        $totalCanceledAmount = collect($monthlyDatas)->sum('TotalCanceledAmount');


        return view('admin.index', compact(
            'orders',
            'dashboardDatas',
            'AmountM',
            'OrderedAmountM',
            'DeliveredAmountM',
            'CanceledAmountM',
            'totalAmount',
            'totalOrderedAmount',
            'totalDeliveredAmount',
            'totalCanceledAmount',
            'admins',
        ));
    }





    public function brands()
    {

        $brands = Brand::orderBy('id', 'DESC')->latest()->paginate(3);
        return view('admin.brands', compact('brands'));
    }

    public function add_brand()
    {
        return view('admin.brand-add');
    }


    public function brand_store(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:brands,slug',
            'image' => 'mimes:png,jpg,jpeg,webp|max:2048'
        ]);

        $brand = new Brand();
        $brand->name = $request->name;
        $brand->slug = Str::slug($request->slug);
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $fileExtension = $request->file('image')->extension();
            $fileName = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateBrandThumbnailsImage($image, $fileName);
            $brand->image = $fileName;
        }
        $brand->save();
        return redirect()->route('admin.brands')->with('status', 'Brand has been added successfully');
    }

    public function GenerateBrandThumbnailsImage($image, $imageName)
    {
        $destinationPath = public_path('uploads/brands');
        $img = Image::read($image->path());
        $img->resize(124, 124, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPath . '/' . $imageName);
    }


    public function brand_edit($id)
    {

        $brand = Brand::findOrFail($id);
        return view('admin.brand-edit', compact('brand'));
    }


    public function brand_update(Request $request)
    {
        $brand = Brand::findOrFail($request->id);

        $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:brands,slug,' . $brand->id,
            'image' => 'mimes:png,jpg,jpeg|max:2048'
        ]);

        $brand->name = $request->name;
        $brand->slug = $request->slug;
        if ($request->hasFile('image')) {
            if (File::exists(public_path('uploads/brands') . '/' . $brand->image)) {
                File::delete(public_path('uploads/brands') . '/' . $brand->image);
            }
            $image = $request->file('image');
            $fileExtension = $request->file('image')->extension();
            $fileName = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateBrandThumbnailsImage($image, $fileName);
            $brand->image = $fileName;
        }
        if ($brand->isDirty()) {
            $brand->save();
            return redirect()->route('admin.brands')->with('status', 'Brand has been updated successfully');
        }

        return redirect()->route('admin.brands')->with('fail', 'No changes made to the brand');
    }



    public function brand_delete($id)
    {

        $brand = Brand::findOrFail($id);
        if (File::exists(public_path('uploads/brands') . '/' . $brand->image)) {

            if (File::delete(public_path('uploads/brands') . '/' . $brand->image));
        }

        $brand->delete();
        return redirect()->route('admin.brands')->with('status', 'Brand has been deleted successfully');
    }


    public function categories()
    {
        $categories = Category::orderBy('id', 'DESC')->paginate(5);
        return view('admin.categories', compact('categories'));
    }


    public function category_add()
    {
        return view('admin.category_add');
    }


    public function category_store(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:categories,slug',
            'image' => 'mimes:png,jpg,jpeg,webp|max:2048'
        ]);

        $category = new Category();
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $fileExtension = $request->file('image')->extension();
            $fileName = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateCategoryThumbnailsImage($image, $fileName);
            $category->image = $fileName;
        }
        $category->save();
        return redirect()->route('admin.categories')->with('status', 'Category has been added successfully');
    }

    public function GenerateCategoryThumbnailsImage($image, $imageName)
    {
        $destinationPath = public_path('uploads/categories');
        $img = Image::read($image->path());
        $img->cover(124, 124, "top");
        $img->resize(124, 124, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPath . '/' . $imageName);
    }

    public function category_edit($id)
    {

        $category = Category::find($id);
        return view('admin.category_edit', compact('category'));
    }


    public function category_update(Request $request)
    {

        $category = Category::find($request->id);
        $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:categories,slug,' . $category->id,
            'image' => 'mimes:png,jpg,jpeg,webp|max:2048'
        ]);

        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        if ($request->hasFile('image')) {
            if (File::exists(public_path('uploads/categories') . '/' . $category->image)) {

                File::delete(public_path('uploads/brands') . '/' . $category->image);
            }
            $image = $request->file('image');
            $fileExtension = $request->file('image')->extension();
            $fileName = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateCategoryThumbnailsImage($image, $fileName);
            $category->image = $fileName;
        }
        if ($category->isDirty()) {

            $category->save();
            return redirect()->route('admin.categories')->with('status', 'Category has been updated successfully');
        }
        return redirect()->route('admin.categories')->with('fail', 'No changes made to the categories');
    }



    public function category_delete($id)
    {
        $category = Category::find($id);
        if (File::exists(public_path('uploads/categories') . '/' . $category->image)) {
            File::delete(public_path('uploads/categories') . '/' . $category->image);
        }
        $category->delete();
        return redirect()->route('admin.categories')->with('status', 'Category has been deleted successfully');
    }


    public function products()
    {

        $products = Product::orderBy('created_at', 'DESC')->paginate(10);
        return view('admin.products', compact('products'));
    }


    public function product_add()
    {

        $categories = Category::select('id', 'name')->orderBy('name')->get();
        $brands = Brand::select('id', 'name')->orderBy('name')->get();
        return view('admin.product-add', compact('categories', 'brands'));
    }



    public function product_store(Request $request)
    {

        $this->validate(
            $request,
            [
                'name' => 'required',
                'slug' => 'required|unique:products,slug',
                'short_description' => 'required',
                'description' => 'required',
                'regular_price' => 'required|numeric',
                'sale_price' => 'required|numeric',
                'SKU' => 'required',
                'stock_status' => 'required',
                'featured' => 'required',
                'quantity' => 'required',
                'image' => 'required | mimes:png,jpg,jpeg,webp|max:2048',
                'category_id' => 'required|exists:categories,id',
                'brand_id' => 'required|exists:brands,id',

            ],
            [
                'category_id.required' => 'Please choose a category.',
                'category_id.exists' => 'The selected category is invalid.',
                'brand_id.required' => 'Please choose a brand.',
                'brand_id.exists' => 'The selected brand is invalid.',
            ]
        );

        $product = new Product();

        $product->name = $request->name;
        $product->slug = Str::slug($request->name);
        $product->short_description = $request->short_description;
        $product->description = $request->description;
        $product->regular_price = floatval(str_replace(',', '', $request->regular_price)); // Ensure it's a float
        $product->sale_price = floatval(str_replace(',', '', $request->sale_price));     // Ensure it's a floatsplay with 2 decimal places
        $product->SKU = $request->SKU;
        $product->stock_status = $request->stock_status;
        $product->featured = $request->featured;
        $product->quantity = $request->quantity;
        $product->category_id = $request->category_id;
        $product->brand_id = $request->brand_id;

        $current_timestamp = Carbon::now()->timestamp;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = $current_timestamp . '.' . $image->extension();
            $this->GenarateProductThumbnailImage($image, $imageName);
            $product->image = $imageName;
        }


        $gallery_arr = array();
        $gallery_image = "";
        $counter = 1;

        if ($request->hasFile('images')) {
            $allowedfileExtension = ['jpg', 'png', 'jpeg', 'webp'];
            $files = $request->file('images');
            foreach ($files as  $file) {
                $gextension = $file->getClientOriginalExtension();
                $gcheck = in_array($gextension, $allowedfileExtension);
                if ($gcheck) {
                    $gfileName = $current_timestamp . "-" . $counter . "." . $gextension;
                    $this->GenarateProductThumbnailImage($file, $gfileName);
                    array_push($gallery_arr, $gfileName);
                    $counter = $counter + 1;
                }
            }

            $gallery_image = implode(',', $gallery_arr);
        }
        $product->images = $gallery_image;
        $product->save();
        return redirect()->route('admin.products')->with('status', 'Product has been added success');
    }

    public function GenarateProductThumbnailImage($image, $imageName)

    {

        $destinationPathThumbnail = public_path('uploads/products/thumbnails');
        $destinationPath = public_path('uploads/products');
        $img = Image::read($image->path());
        $img->cover(540, 689, 'top');
        $img->resize(540, 689, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPath . '/' . $imageName);
        $img->resize(104, 104, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPathThumbnail . '/' . $imageName);
    }



    public function product_edit($id)
    {


        $product = Product::find($id);
        $categories = Category::select('id', 'name')->orderBy('name')->get();
        $brands = Brand::select('id', 'name')->orderBy('name')->get();
        return view('admin.product-edit', compact('product', 'categories', 'brands'));
    }



    public function product_update(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => 'required',
                'slug' => 'required|unique:products,slug,' . $request->id,
                'short_description' => 'required',
                'description' => 'required',
                'regular_price' => 'required|numeric',
                'sale_price' => 'required|numeric',
                'SKU' => 'required',
                'stock_status' => 'required',
                'featured' => 'required',
                'quantity' => 'required',
                'image' => 'mimes:png,jpg,jpeg,webp|max:2048',
                'category_id' => 'required|exists:categories,id',
                'brand_id' => 'required|exists:brands,id',

            ],
            [
                'category_id.required' => 'Please choose a category.',
                'category_id.exists' => 'The selected category is invalid.',
                'brand_id.required' => 'Please choose a brand.',
                'brand_id.exists' => 'The selected brand is invalid.',
            ]
        );



        $product = Product::find($request->id);
        $product->name = $request->name;
        $product->slug = Str::slug($request->name);
        $product->short_description = $request->short_description;
        $product->description = $request->description;
        $product->regular_price = floatval(str_replace(',', '', $request->regular_price)); // Ensure it's a float
        $product->sale_price = floatval(str_replace(',', '', $request->sale_price));     // Ensure it's a float
        $product->SKU = $request->SKU;
        $product->stock_status = $request->stock_status;
        $product->featured = $request->featured;
        $product->quantity = $request->quantity;
        $product->category_id = $request->category_id;
        $product->brand_id = $request->brand_id;
        $current_timestamp = Carbon::now()->timestamp;

        if ($request->hasFile('image')) {

            if (File::exists(public_path('uploads/products') . '/' . $product->image)) {
                File::delete(public_path('uploads/products') . '/' . $product->image);
            }
            if (File::exists(public_path('uploads/products/thumbnails') . '/' . $product->image)) {
                File::delete(public_path('uploads/products/thumbnails') . '/' . $product->image);
            }
            $image = $request->file('image');
            $imageName = $current_timestamp . '.' . $image->extension();
            $this->GenarateProductThumbnailImage($image, $imageName);
            $product->image = $imageName;
        }

        $gallery_arr = array();
        $gallery_image = "";
        $counter = 1;

        if ($request->hasFile('images')) {

            foreach (explode(',', $product->images) as $ofile) {

                if (File::exists(public_path('uploads/products') . '/' . $ofile)) {
                    File::delete(public_path('uploads/products') . '/' . $ofile);
                }
                if (File::exists(public_path('uploads/products/thumbnails') . '/' . $ofile)) {
                    File::delete(public_path('uploads/products/thumbnails') . '/' . $ofile);
                }
            }
            $allowedfileExtension = ['jpg', 'png', 'jpeg', 'webp'];
            $files = $request->file('images');
            foreach ($files as $file) {
                $gextension = $file->getClientOriginalExtension();
                $gcheck = in_array($gextension, $allowedfileExtension);
                if ($gcheck) {
                    $gfileName = $current_timestamp . '-' . $counter . '.' . $gextension;
                    $this->GenarateProductThumbnailImage($file, $gfileName);
                    array_push($gallery_arr, $gfileName);
                    $counter = $counter + 1;
                }
            }

            $gallery_image = implode(',', $gallery_arr);
            $product->images = $gallery_image;
        }

        if ($product->isDirty('images', 'image', 'name', 'slug', 'short_description', 'description', 'regular_price', '
        sale_price', 'SKU', 'stock_status', 'featured', 'quantity', 'category_id', 'brand_id')) {
            $product->save();
            return redirect()->route('admin.products')->with('status', 'Product Updated Successfully');
        }

        return redirect()->route('admin.products')->with('error', 'No changes made to the product');
    }


    public function product_delete($id)
    {

        $product = Product::find($id);
        if (File::exists(public_path('uploads/products') . '/' . $product->image)) {
            File::delete(public_path('uploads/products')) . '/' . $product->image;
        }

        if (File::exists(public_path('uploads/products/thumnails') . '/' . $product->image)) {
            File::delete(public_path('uploads/products/thumbnails')) . '/' . $product->image;
        }

        foreach (explode(',', $product->images) as  $ofile) {
            if (File::exists(public_path('uploads/products') . '/' . $product->image)) {
                File::delete(public_path('uploads/products')) . '/' . $product->image;
            }

            if (File::exists(public_path('uploads/products/thumnails') . '/' . $ofile)) {
                File::delete(public_path('uploads/products/thumbnails')) . '/' . $ofile;
            }
        }
        $product->delete();
        return redirect()->route('admin.products')->with('status', 'Product Deleted Successfully');
    }


    public function coupons()
    {
        $coupons = Coupon::orderBy('expiry_date', 'DESC')->paginate(12);
        return view('admin.coupons', compact('coupons'));
    }


    public function coupon_add()
    {

        return view('admin.coupon-add');
    }


    public function coupon_store(Request $request)
    {

        $request->validate([
            'code' => 'required',
            'type' => 'required',
            'value' => 'required | numeric',
            'cart_value' => 'required | numeric',
            'expiry_date' => 'required | date',
        ]);

        $coupon = new Coupon();
        $coupon->code = $request->code;
        $coupon->type = $request->type;
        $coupon->value = $request->value;
        $coupon->cart_value = $request->cart_value;
        $coupon->expiry_date = $request->expiry_date;
        $coupon->save();
        return redirect()->route('admin.coupons')->with('status', 'Coupon Added Successfully');
    }


    public function coupon_edit($id)
    {
        $coupon = Coupon::find($id);
        return view('admin.coupon-edit', compact('coupon'));
    }


    public function coupon_update(Request $request)
    {

        $request->validate([
            'code' => 'required',
            'type' => 'required',
            'value' => 'required | numeric',
            'cart_value' => 'required | numeric',
            'expiry_date' => 'required | date',
        ]);

        $coupon =  Coupon::find($request->id);
        $coupon->code = $request->code;
        $coupon->type = $request->type;
        $coupon->value = $request->value;
        $coupon->cart_value = $request->cart_value;
        $coupon->expiry_date = $request->expiry_date;
        $coupon->save();
        return redirect()->route('admin.coupons')->with('status', 'Coupon Updated Successfully');
    }


    public function coupon_delete($id)
    {
        $coupon = Coupon::find($id);
        $coupon->delete();
        return redirect()->route('admin.coupons')->with('status', 'Coupon Deleted Successfully');
    }

    public function orders()
    {
        $orders = Order::orderBy('created_at', 'DESC')->paginate(12);
        return view('admin.orders', compact('orders'));
    }

    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        $order->delete();
        return redirect()->route('admin.orders')->with('success', 'Order deleted successfully');
    }


    public function order_details($order_id)
    {

        $order = Order::find($order_id);
        $orderItems = OrderItem::where('order_id', $order_id)->orderBy('id')->paginate(12);
        $transaction = Transaction::where('order_id', $order_id)->first();
        return view('admin.order-details', compact('order', 'orderItems', 'transaction'));
    }
    public function update_order_status(Request $request)
    {
        $order = Order::find($request->order_id);
        $order->status = $request->order_status;


        if ($request->order_status == 'delivered') {

            $order->delivered_date = Carbon::now();
        } else if ($request->order_status == 'canceled') {

            $order->canceled_date = Carbon::now();
        }

        $order->save();

        if ($request->order_status == 'delivered') {
            $transaction = Transaction::where('order_id', $request->order_id)->first();
            if ($transaction) {
                $transaction->status = 'approved';
                $transaction->save();
            }
        }

        return back()->with('status', "Status changed successfully!");
    }


    public function slides()
    {
        $slides = Slide::orderBy('id', 'DESC')->paginate(12);
        return view('admin.slides', compact('slides'));
    }

    public function slide_add()
    {

        return view('admin.slide-add');
    }

    public function slide_store(Request $request)
    {

        $request->validate([

            'tagline' => 'required',
            'title' => 'required',
            'subtitle' => 'required',
            'link' => 'required',
            'status' => 'required',
            'image' => 'required|mimes:png,jpg,jpeg,webp|max:2048'
        ]);


        $slide = new Slide();
        $slide->tagline = $request->tagline;
        $slide->title = $request->title;
        $slide->subtitle = $request->subtitle;
        $slide->link = $request->link;
        $slide->status = $request->status;
        $image = $request->file('image');
        $file_extension = $request->file('image')->extension();
        $file_name = Carbon::now()->timestamp . '.' . $file_extension;
        $this->GenarateSlideThumbnailImage($image, $file_name);
        $slide->image = $file_name;
        $slide->save();
        return redirect()->route('admin.slides')->with('status', 'Slide added successfully!');
    }

    public function GenarateSlideThumbnailImage($image, $imageName)
    {
        $destinationPath = public_path('uploads/slides');
        $img = Image::read($image->path());
        $img->cover(1920, 1080, 'top');
        $img->resize(1920, 1080, function ($constraint) {
            $constraint->aspecRatio();
        })->save($destinationPath . '/' . $imageName);
    }


    public function slide_edit($id)
    {

        $slide = Slide::find($id);
        return view('admin.slide-edit', compact('slide'));
    }


    public function slide_update(Request $request)
    {
        $request->validate([

            'tagline' => 'required',
            'title' => 'required',
            'subtitle' => 'required',
            'link' => 'required',
            'status' => 'required',
            'image' => 'required|mimes:png,jpg,jpeg,webp|max:2048'
        ]);


        $slide =  Slide::find($request->id);
        $slide->tagline = $request->tagline;
        $slide->title = $request->title;
        $slide->subtitle = $request->subtitle;
        $slide->link = $request->link;
        $slide->status = $request->status;
        if ($request->has('image')) {
            if (file::exists(public_path('uploads/slides') . '/' . $slide->image)) {
                File::delete(public_path('uploads/slides') . '/' . $slide->image);
            }
            $image = $request->file('image');
            $file_extension = $request->file('image')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $file_extension;
            $this->GenarateSlideThumbnailImage($image, $file_name);
            $slide->image = $file_name;
        }
        $slide->save();
        return redirect()->route('admin.slides')->with('status', 'Slide updated successfully!');
    }


    public function slide_delete($id)
    {

        $slide = Slide::find($id);
        if (file::exists(public_path('uploads/slides') . '/' . $slide->image)) {
            File::delete(public_path('uploads/slides') . '/' . $slide->image);
        }
        $slide->delete();
        return redirect()->route('admin.slides')->with('status', 'Slide deleted successfully!');
    }


    public function contacts()
    {

        $contacts = Contact::orderBy('created_at', 'DESC')->paginate(10);
        return view('admin.contacts', compact('contacts'));
    }

    public function contact_delete($id)
    {

        $contact = Contact::find($id);
        $contact->delete();
        return redirect()->route('admin.contacts')->with('status', 'Contact deleted successfully!');
    }

    public function search(Request $request)
    {

        $query = $request->input('query');
        $result = Product::where('name', 'LIKE', "%$query%")->get()->take(8);
        return response()->json($result);
    }


    public function showCustomers()
    {
        $users = User::with('orders')->where('utype', 'USR')->get();

        return view('admin.user', compact('users'));
    }

    public function deleteCustomer($id)
    {
        $user = User::findOrFail($id);

        $user->delete();

        return redirect()->route('admin.user')->with('success', 'Customer deleted successfully!');
    }
}
