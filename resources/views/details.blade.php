@extends('layouts.app')


@section('content')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .filled-heart {
            color: orange;
        }

        .star-rating {
            margin: 5px 0px 0px 0px;
            direction: rtl;
            display: inline-block;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: gray;
            font-size: 20px;
            padding: 0;
            cursor: pointer;
        }

        .star-rating input:checked~label {
            color: gold;
        }

        .star-rating input:hover~label {
            color: gold;
        }

        .star-rating input:checked+label:hover,
        .star-rating input:checked+label:hover~label {
            color: gold;
        }

        .star-rating label:hover,
        .star-rating label:hover~label {
            color: gold;
        }
    </style>
    <main class="pt-90">
        <div class="mb-md-1 pb-md-3"></div>
        <section class="product-single container mt-5">
            <div class="row">
                <div class="col-lg-7">
                    <div class="product-single__media" data-media-type="vertical-thumbnail">
                        <div class="product-single__image">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide product-single__image-item">
                                        <img loading="lazy" class="h-auto"
                                            src="{{ asset('uploads/products') }}/{{ $product->image }}" width="674"
                                            height="674" alt="" />
                                        <a data-fancybox="gallery"
                                            href="{{ asset('uploads/products') }}/{{ $product->image }}"
                                            data-bs-toggle="tooltip" data-bs-placement="left" title="Zoom">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <use href="#icon_zoom" />
                                            </svg>
                                        </a>
                                    </div>

                                    @foreach (explode(',', $product->images) as $gimg)
                                        @if (!empty($gimg) && file_exists(public_path('uploads/products/' . $gimg)))
                                            <div class="swiper-slide product-single__image-item">
                                                <img loading="lazy" class="h-auto"
                                                    src="{{ asset('uploads/products') }}/{{ $gimg }}" width="674"
                                                    height="674" alt="" />
                                                <a data-fancybox="gallery"
                                                    href="{{ asset('uploads/products') }}/{{ $gimg }}"
                                                    data-bs-toggle="tooltip" data-bs-placement="left" title="Zoom">
                                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <use href="#icon_zoom" />
                                                    </svg>
                                                </a>
                                            </div>
                                        @endif
                                    @endforeach


                                </div>
                                <div class="swiper-button-prev"><svg width="7" height="11" viewBox="0 0 7 11"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_prev_sm" />
                                    </svg></div>
                                <div class="swiper-button-next"><svg width="7" height="11" viewBox="0 0 7 11"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_next_sm" />
                                    </svg></div>
                            </div>
                        </div>
                        <div class="product-single__thumbnail">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide product-single__image-item"><img loading="lazy" class="h-auto"
                                            src="{{ asset('uploads/products/thumbnails') }}/{{ $product->image }}"
                                            width="104" height="104" alt="" /></div>
                                    @foreach (explode(',', $product->images) as $gimg)
                                        @if (!empty($gimg) && file_exists(public_path('uploads/products/thumbnails/' . $gimg)))
                                            <div class="swiper-slide product-single__image-item">
                                                <img loading="lazy" class="h-auto"
                                                    src="{{ asset('uploads/products/thumbnails') }}/{{ $gimg }}"
                                                    width="104" height="104" alt="" />
                                            </div>
                                        @endif
                                    @endforeach

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    {{-- <div class="d-flex justify-content-between mb-4 pb-md-2">
                         <div class="breadcrumb mb-0 d-none d-md-block flex-grow-1">
                            <a href="{{ route('home.index') }}"
                                class="menu-link menu-link_us-s text-uppercase fw-medium">Home</a>
                            <span class="breadcrumb-separator menu-link fw-medium ps-1 pe-1">/</span>
                            <a href="#" class="menu-link menu-link_us-s text-uppercase fw-medium">The Shop</a>
                        </div><!-- /.breadcrumb -->

                        <div
                            class="product-single__prev-next d-flex align-items-center justify-content-between justify-content-md-end flex-grow-1">
                            <a href="#" class="text-uppercase fw-medium"><svg width="10" height="10"
                                    viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
                                    <use href="#icon_prev_md" />
                                </svg><span class="menu-link menu-link_us-s">Prev</span></a>
                            <a href="#" class="text-uppercase fw-medium"><span
                                    class="menu-link menu-link_us-s">Next</span><svg width="10" height="10"
                                    viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
                                    <use href="#icon_next_md" />
                                </svg></a>
                        </div><!-- /.shop-acs --> -
                    </div> --}}
                    <h1 class="product-single__name">{{ $product->name }}</h1>

                    <div class="product-single__rating">
                        <div class="reviews-group d-flex">
                            @for ($i = 1; $i <= 5; $i++)
                                @if ($i <= floor($product->averageRating))
                                    <svg class="review-star" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_star" />
                                    </svg>
                                @elseif ($i == ceil($product->averageRating) && $product->averageRating - floor($product->averageRating) >= 0.5)
                                    <!-- Half star -->
                                    <svg class="review-star" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_half_star" />
                                    </svg>
                                @else
                                    <svg class="review-star" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_empty_star" />
                                    </svg>
                                @endif
                            @endfor
                        </div>

                        @if ($product->averageRating > 0)
                            <span class="reviews-note text-lowercase text-secondary ms-1">
                                {{ number_format($product->averageRating, 1) }} / 5
                            </span>

                            <span class="reviews-count ms-2">
                                ({{ count($reviews) }} reviews)
                            </span>
                        @else
                            <span class="reviews-note text-lowercase text-secondary ms-1"></span>
                            No reviews yet
                            </span>
                        @endif
                    </div>

                    <div class="product-single__price">
                        <span class="current-price">
                            @if ($product->sale_price)
                                Tk {{ $product->sale_price }}
                                @if ($product->regular_price)
                                    <s>Tk {{ $product->regular_price }}</s>
                                @endif
                            @else
                                Tk {{ $product->regular_price }}
                            @endif

                        </span>
                    </div>
                    <div class="product-single__short-desc">
                        <p>{{ $product->short_description }}</p>
                    </div>
                    @if (Cart::instance('cart')->content()->where('id', $product->id)->count() > 0)
                        <a href="{{ route('cart.index') }}" class="btn btn-warning mb-3">Go to Cart</a>
                    @else
                        <form name="addtocart-form" method="post" action="{{ route('cart.add') }}">
                            @csrf
                            <div class="product-single__addtocart">
                                <div class="qty-control position-relative">
                                    <input type="number" name="quantity" value="1" min="1"
                                        class="qty-control__number text-center">
                                    <div class="qty-control__reduce">-</div>
                                    <div class="qty-control__increase">+</div>
                                </div><!-- .qty-control -->
                                <button type="submit" class="btn btn-primary btn-addtocart " data-aside="cartDrawer">Add
                                    to Cart</button>
                                <input type="hidden" name="id" value="{{ $product->id }}">
                                <input type="hidden" name="name" value="{{ $product->name }}">
                                <input type="hidden" name="price"
                                    value="{{ $product->sale_price == '' ? $product->regular_price : $product->sale_price }}">

                            </div>
                        </form>
                    @endif
                    <div class="product-single__addtolinks">

                        @if (Cart::instance('wishlist')->content()->where('id', $product->id)->count() > 0)
                            <form
                                action="{{ route('wishlist.item.remove', ['rowId' => Cart::instance('wishlist')->content()->where('id', $product->id)->first()->rowId]) }}"
                                method="POST" id="frm-remove-item">
                                @csrf
                                @method('DELETE')
                                <a href="javascript:void(0)" class="menu-link menu-link_us-s add-to-wishlist filled-heart"
                                    onclick="document.getElementById('frm-remove-item').submit();"><svg width="16"
                                        height="16" viewBox="0 0 20 20" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_heart" />
                                    </svg><span> Remove from Wishlist</span></a>
                            </form>
                        @else
                            <form action="{{ route('wishlist.add') }}" method="POST" id="wishlist-form">
                                @csrf
                                <input type="hidden" name="id" value="{{ $product->id }}">
                                <input type="hidden" name="name" value="{{ $product->name }}">
                                <input type="hidden" name="price"
                                    value="{{ $product->sale_price == '' ? $product->regular_price : $product->sale_price }}" />
                                <input type="hidden" name="quantity" value="1">
                                <a href="javascript:void(0)" class="menu-link menu-link_us-s add-to-wishlist"
                                    onclick="document.getElementById('wishlist-form').submit()"><svg width="16"
                                        height="16" viewBox="0 0 20 20" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <use href="#icon_heart" />
                                    </svg><span> Add to Wishlist</span></a>
                            </form>
                        @endif



                        <share-button class="share-button">
                            <button
                                class="menu-link menu-link_us-s to-share border-0 bg-transparent d-flex align-items-center">
                                <svg width="16" height="19" viewBox="0 0 16 19" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <use href="#icon_sharing" />
                                </svg>
                                <span>Share</span>
                            </button>
                            <details id="Details-share-template__main" class="m-1 xl:m-1.5" hidden="">
                                <summary class="btn-solid m-1 xl:m-1.5 pt-3.5 pb-3 px-5">+</summary>
                                <div id="Article-share-template__main"
                                    class="share-button__fallback flex items-center absolute top-full left-0 w-full px-2 py-4 bg-container shadow-theme border-t z-10">
                                    <div class="field grow mr-4">
                                        <label class="field__label sr-only" for="url">Link</label>
                                        <input type="text" class="field__input w-full" id="url"
                                            value="https://uomo-crystal.myshopify.com/blogs/news/go-to-wellness-tips-for-mental-health"
                                            placeholder="Link" onclick="this.select();" readonly="">
                                    </div>
                                    <button class="share-button__copy no-js-hidden">
                                        <svg class="icon icon-clipboard inline-block mr-1" width="11" height="13"
                                            fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                                            focusable="false" viewBox="0 0 11 13">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M2 1a1 1 0 011-1h7a1 1 0 011 1v9a1 1 0 01-1 1V1H2zM1 2a1 1 0 00-1 1v9a1 1 0 001 1h7a1 1 0 001-1V3a1 1 0 00-1-1H1zm0 10V3h7v9H1z"
                                                fill="currentColor"></path>
                                        </svg>
                                        <span class="sr-only">Copy link</span>
                                    </button>
                                </div>
                            </details>
                        </share-button>
                        <script src="js/details-disclosure.html" defer="defer"></script>
                        <script src="js/share.html" defer="defer"></script>
                    </div>
                    <div class="product-single__meta-info">
                        <div class="meta-item">
                            <label>SKU:</label>
                            <span>{{ $product->SKU }}</span>
                        </div>
                        <div class="meta-item">
                            <label>Categories:</label>
                            <span>{{ $product->category->name }}</span>
                        </div>
                        <div class="meta-item">
                            <label>Tags:</label>
                            <span>NA</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-single__details-tab">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link nav-link_underscore active" id="tab-description-tab" data-bs-toggle="tab"
                            href="#tab-description" role="tab" aria-controls="tab-description"
                            aria-selected="true">Description</a>
                    </li>
                    {{-- <li class="nav-item" role="presentation">
                        <a class="nav-link nav-link_underscore" id="tab-additional-info-tab" data-bs-toggle="tab"
                            href="#tab-additional-info" role="tab" aria-controls="tab-additional-info"
                            aria-selected="false">Additional Information</a>
                    </li> --}}
                    <li class="nav-item" role="presentation">
                        <a class="nav-link nav-link_underscore" id="tab-reviews-tab" data-bs-toggle="tab"
                            href="#tab-reviews" role="tab" aria-controls="tab-reviews" aria-selected="false">Reviews
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-description" role="tabpanel"
                        aria-labelledby="tab-description-tab">
                        <div class="product-single__description">
                            {{ $product->description }}
                        </div>
                    </div>
                    {{-- <div class="tab-pane fade" id="tab-additional-info" role="tabpanel"
                        aria-labelledby="tab-additional-info-tab">
                        <div class="product-single__addtional-info">
                            <div class="item">
                                <label class="h6">Weight</label>
                                <span>1.25 kg</span>
                            </div>
                            <div class="item">
                                <label class="h6">Dimensions</label>
                                <span>90 x 60 x 90 cm</span>
                            </div>
                            <div class="item">
                                <label class="h6">Size</label>
                                <span>XS, S, M, L, XL</span>
                            </div>
                            <div class="item">
                                <label class="h6">Color</label>
                                <span>Black, Orange, White</span>
                            </div>
                            <div class="item">
                                <label class="h6">Storage</label>
                                <span>Relaxed fit shirt-style dress with a rugged</span>
                            </div>
                        </div>
                    </div> --}}
                    <div class="tab-pane fade" id="tab-reviews" role="tabpanel" aria-labelledby="tab-reviews-tab">
                        <h2 class="product-single__reviews-title">Reviews</h2>
                        <div class="product-single__reviews-list">

                            <div class="product-single__reviews-item">
                                {{-- <div class="customer-avatar">
                                    <img loading="lazy" src="assets/images/avatar.jpg" alt="" />
                                </div> --}}
                                <div class="customer-review">
                                    @foreach ($reviews as $review)
                                        <div class="customer-name">
                                            <h6>{{ $review->user->name }}</h6>
                                            <div class="reviews-group d-flex">
                                                @for ($i = 1; $i <= $review->rating; $i++)
                                                    <svg class="review-star" viewBox="0 0 9 9"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <use href="#icon_star" />
                                                    </svg>
                                                @endfor
                                            </div>
                                        </div>
                                        <div class="review-date">
                                            {{ (new \DateTime($review->created_at))->format('F j, Y') }}</div>
                                        <div class="review-text">
                                            <p>{{ $review->details }}</p>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="product-single__review-form">
                            @if (Auth::check())
                                <form name="customer-review-form" action="{{ route('details.review.store') }}"
                                    method="POST">
                                    @csrf
                                    <h5>Please Review This Product</h5>

                                    <div class="select-star-rating">

                                        <label>Your rating* </label>

                                        <div class="star-rating">
                                            <input type="radio" name="rating" id="star5" value="5" />
                                            <label for="star5">&#9733;</label>
                                            <input type="radio" name="rating" id="star4" value="4" />
                                            <label for="star4">&#9733;</label>
                                            <input type="radio" name="rating" id="star3" value="3" />
                                            <label for="star3">&#9733;</label>
                                            <input type="radio" name="rating" id="star2" value="2" />
                                            <label for="star2">&#9733;</label>
                                            <input type="radio" name="rating" id="star1" value="1" />
                                            <label for="star1">&#9733;</label>
                                        </div>
                                    </div>


                                    <div class="mb-4">
                                        <textarea id="form-input-review" name="details" class="form-control form-control_gray" placeholder="Your Review"
                                            cols="30" rows="8"></textarea>
                                    </div>

                                    <div>
                                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                                        <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                                    </div>

                                    <div class="form-action">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            @else
                                <p>You need to <a href="{{ route('login') }}">log in</a> to submit a review. Don't have an
                                    account? <a href="{{ route('register') }}">Register here</a>.</p>
                            @endif
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <section class="products-carousel container">
            <h2 class="h3 text-uppercase mb-4 pb-xl-2 mb-xl-4">Related <strong>Products</strong></h2>

            <div id="related_products" class="position-relative">
                <div class="swiper-container js-swiper-slider"
                    data-settings='{
            "autoplay": false,
            "slidesPerView": 4,
            "slidesPerGroup": 4,
            "effect": "none",
            "loop": true,
            "pagination": {
              "el": "#related_products .products-pagination",
              "type": "bullets",
              "clickable": true
            },
            "navigation": {
              "nextEl": "#related_products .products-carousel__next",
              "prevEl": "#related_products .products-carousel__prev"
            },
            "breakpoints": {
              "320": {
                "slidesPerView": 2,
                "slidesPerGroup": 2,
                "spaceBetween": 14
              },
              "768": {
                "slidesPerView": 3,
                "slidesPerGroup": 3,
                "spaceBetween": 24
              },
              "992": {
                "slidesPerView": 4,
                "slidesPerGroup": 4,
                "spaceBetween": 30
              }
            }
          }'>
                    <div class="swiper-wrapper">
                        @foreach ($rproducts as $rproduct)
                            <div class="swiper-slide product-card">
                                <div class="pc__img-wrapper">
                                    <a href="{{ route('shop.product.details', ['product_slug' => $rproduct->slug]) }}">
                                        <img loading="lazy" src="{{ asset('uploads/products') }}/{{ $rproduct->image }}"
                                            width="330" height="400" alt="{{ $rproduct->name }}" class="pc__img">

                                        @foreach (explode(',', $rproduct->images) as $gimg)
                                            @if (!empty($gimg) && file_exists(public_path('uploads/products/thumbnails/' . $gimg)))
                                                <img loading="lazy"
                                                    src="{{ asset('uploads/products/thumbnails') }}/{{ $gimg }}"
                                                    width="330" height="400" alt="{{ $rproduct->name }}"
                                                    class="pc__img pc__img-second">
                                            @endif
                                        @endforeach
                                    </a>
                                    @if (Cart::instance('cart')->content()->where('id', $product->id)->count() > 0)
                                        <a href="{{ route('cart.index') }}"
                                            class="pc__atc btn anim_appear-bottom btn position-absolute border-0 text-uppercase fw-medium js-add-cart btn btn-warning mb-3">Go
                                            to Cart</a>
                                    @else
                                        <form name="addtocart-form" method="post" action="{{ route('cart.add') }}">
                                            @csrf
                                            <input type="hidden" name="id" value="{{ $rproduct->id }}">
                                            <input type="hidden" name="quantity" value="1">
                                            <input type="hidden" name="name" value="{{ $rproduct->name }}">
                                            <input type="hidden" name="price"
                                                value="{{ $rproduct->sale_price == '' ? $rproduct->regular_price : $rproduct->sale_price }}">
                                            <button type="submit"
                                                class="pc__atc btn anim_appear-bottom btn position-absolute border-0 text-uppercase fw-medium js-add-cart"
                                                data-aside="cartDrawer" title="Add To Cart">Add To Cart</button>
                                        </form>
                                    @endif
                                </div>

                                <div class="pc__info position-relative">
                                    <p class="pc__category">{{ $rproduct->category->name }}</p>
                                    <h6 class="pc__title"><a
                                            href="{{ route('shop.product.details', ['product_slug' => $rproduct->slug]) }}">{{ $rproduct->name }}</a>
                                    </h6>
                                    <div class="product-card__price d-flex">
                                        <span class="money price">
                                            @if ($product->sale_price)
                                                <s>Tk {{ $rproduct->regular_price }}</s> Tk {{ $rproduct->sale_price }}
                                            @else
                                                Tk {{ $product->regular_price }}
                                            @endif
                                        </span>
                                    </div>

                                    <button
                                        class="pc__btn-wl position-absolute top-0 end-0 bg-transparent border-0 js-add-wishlist"
                                        title="Add To Wishlist">
                                        <svg width="16" height="16" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <use href="#icon_heart" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        @endforeach

                    </div><!-- /.swiper-wrapper -->



                </div><!-- /.swiper-container js-swiper-slider -->

                <div
                    class="products-carousel__prev position-absolute top-50 d-flex align-items-center justify-content-center">
                    <svg width="25" height="25" viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
                        <use href="#icon_prev_md" />
                    </svg>
                </div><!-- /.products-carousel__prev -->
                <div
                    class="products-carousel__next position-absolute top-50 d-flex align-items-center justify-content-center">
                    <svg width="25" height="25" viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
                        <use href="#icon_next_md" />
                    </svg>
                </div><!-- /.products-carousel__next -->

                <div class="products-pagination mt-4 mb-5 d-flex align-items-center justify-content-center"></div>
                <!-- /.products-pagination -->
            </div><!-- /.position-relative -->

        </section><!-- /.products-carousel container -->
    </main>
@endsection
