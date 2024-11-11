<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ShopController extends Controller
{
           public function index(Request $request){

            $size = $request->query('size') ? $request->query('size') : 12;
            $o_column = "";
            $o_order = "";
            $order = $request->query('order') ? $request->query('order') : -1;
            $f_brands =$request->query('brands');
            Switch($order)
            {
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
            $brands = Brand::orderBy('name','ASC')->get();
            // $categories = Category::orderBy('name','ASC')->get();
            $products = Product::where(function($query) use($f_brands){
                $query->whereIn('brand_id',explode(',',$f_brands))->orWhereRaw("'".$f_brands."'='");
            })->orderBy($o_column,$o_order)->paginate($size);
            return view('shop', compact('products','size','order','brands','f_brands'));
           }



          public function product_details($product_slug){


            $product = Product::where('slug',$product_slug)->first();
            $rproducts = Product::where('slug','<>',$product_slug)->get()->take(8);
            return view('details',compact('product','rproducts'));

          }



}

// public function index(Request $request)
// {
//     $size = $request->query('size', 12); // Default to 12 if 'size' is not set
//     $order = $request->query('order', -1); // Default to -1 if 'order' is not set
//     $f_brands = $request->query('brands', ''); // Get 'brands' query param, default to empty string

//     // Set default ordering logic
//     $o_column = 'id';
//     $o_order = 'DESC';

//     // Determine ordering column and direction based on 'order' value
//     switch ($order) {
//         case 1:
//             $o_column = 'created_at';
//             $o_order = 'DESC';
//             break;
//         case 2:
//             $o_column = 'created_at';
//             $o_order = 'ASC';
//             break;
//         case 3:
//             $o_column = 'sale_price';
//             $o_order = 'ASC';
//             break;
//         case 4:
//             $o_column = 'sale_price';
//             $o_order = 'DESC';
//             break;
//     }

//     // Get all brands for filtering
//     $brands = Brand::orderBy('name', 'ASC')->get();

//     // Initialize the query to fetch products
//     $productsQuery = Product::query();

//     // Only apply the filter if $f_brands is not empty
//     if (!empty($f_brands)) {
//         $brandsArray = explode(',', $f_brands); // Convert the comma-separated string to an array
//         if (count($brandsArray) > 0) {
//             $productsQuery->whereIn('brand_id', $brandsArray); // Filter products by brand ID
//         }
//     }

//     // Apply ordering
//     $productsQuery->orderBy($o_column, $o_order);

//     // Paginate products
//     $products = $productsQuery->paginate($size);

//     // Return the view with the products and necessary data
//     return view('shop', compact('products', 'size', 'order', 'brands', 'f_brands'));
// }
