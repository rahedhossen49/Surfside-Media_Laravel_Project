<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Review;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShopController extends Controller
{

    public function index(Request $request)
    {
        $size = $request->query('size') ? $request->query('size') : 12;
        $o_column = '';
        $o_order = '';
        $order = $request->query('order') ? $request->query('order') : -1;
        $f_brands = $request->query('brands');
        $f_categories = $request->query('categories');
        $min_price = $request->query('min') ? $request->query('min') : 1;
        $max_price = $request->query('max') ? $request->query('max') : 50000;

        switch ($order) {
            case 1:
                $o_column = 'created_at';
                $o_order = 'DESC';
                break;
            case 2:
                $o_column = 'created_at';
                $o_order = 'ASC';
                break;
            case 3:
                $o_column = 'sale_price';
                $o_order = 'ASC';
                break;
            case 4:
                $o_column = 'sale_price';
                $o_order = 'DESC';
                break;
            default:
                $o_column = 'id';
                $o_order = 'DESC';
        }

        $brands = Brand::orderBy('name', 'ASC')->get();
        $categories = Category::orderBy('name', 'ASC')->get();

        $productsQuery = Product::query();

        if ($f_brands) {
            $brandIds = explode(',', $f_brands);
            if (!empty($brandIds)) {
                $productsQuery->whereIn('brand_id', $brandIds);
            }
        }

        if ($f_categories) {
            $categoryIds = explode(',', $f_categories);
            if (!empty($categoryIds)) {
                $productsQuery->whereIn('category_id', $categoryIds);
            }
        }

        $productsQuery->where(function ($query) use ($min_price, $max_price) {
            $query->whereBetween('sale_price', [$min_price, $max_price])
                ->orWhereBetween('regular_price', [$min_price, $max_price]);
        });

        $products = $productsQuery->orderBy($o_column, $o_order)->paginate($size);

        return view('shop', compact('products', 'size', 'order', 'brands', 'f_brands', 'categories', 'f_categories', 'min_price', 'max_price'));
    }





    public function product_details($product_slug)
    {
        $product = Product::where('slug', $product_slug)->first();
        $rproducts = Product::where('slug', '<>', $product_slug)->get()->take(8);
        return view('details', compact('product', 'rproducts'));
    }

    public function reviewStore(Request $request)
    {
        // Validate the incoming request
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'details' => 'nullable|string',
            'rating' => 'required|integer|min:1|max:5',
        ]);

        // Create a new review instance
        $review = new Review();
        $review->product_id = $request->product_id;
        $review->user_id = Auth::id(); // Authenticated user's ID
        $review->details = $request->details;
        $review->rating = $request->rating;
        $review->save();

        dd($review);
        // Redirect back with a success message
        return redirect()->back()->with('success', 'Thank you for your review!');
    }
}
