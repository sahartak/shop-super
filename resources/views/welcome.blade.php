<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ShopTop -make online shop </title>

    <!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Poppins:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="/promo/vendors/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/promo/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
    <link href="/promo/vendors/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="/promo/vendors/owl-carousel/assets/owl.carousel.css" rel="stylesheet">
    <link href="/promo/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/promo/css/plugins/font-awesome.min.css" rel="stylesheet">
    <link href="/promo/css/plugins/lineicons.css" rel="stylesheet">
    <link href="/promo/css/plugins/animate.css" rel="stylesheet">
    <link href="/promo/css/style.css?<?php echo date('l jS \of F Y h:i:s A'); ?>" rel="stylesheet">
    <link href="/promo/css/themes/blue-orange.css" rel="stylesheet">

</head>
<body class="home" data-scroll-animation="true" data-spy="scroll" data-target="#main-navbar">
<header class="row" id="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">

            <div class="navbar-header">
                <a class="navbar-brand" href="#header"><img src="/promo/images/logo.png" alt=""></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar"
                        aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="main-navbar">
                <div class="pull-right languages">
                    <a href="/" class="active">En</a>
                    <a href="/ru">Рус </a>
                </div>
                @if (Route::has('login'))
                    <div class="top-right links">
                        @auth
                        <a href="{{ url('/home') }}" class="btn btn-warning pull-right  hidden-sm hidden-xs">Home</a>
                        <a class="dropdown-item btn btn-warning pull-right  hidden-sm hidden-xs" href="{{ route('logout') }}"
                           onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                            {{ __('Logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>

                        @else

                            @if (Route::has('register'))
                                <a href="{{ route('register') }}"
                                   class=" btn btn-warning pull-right  hidden-sm hidden-xs">Register</a>
                            @endif
                            <a href="{{ route('login') }}" class=" btn btn-warning pull-right  hidden-sm hidden-xs">Sign
                                In</a>

                            @endauth
                    </div>
                @endif


                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#product">View Demo</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>

        </div>

    </nav>
    <div class="top-banner row m0 text-center">
        <div class="container">
            <h2>Esiest way to transition your store online</h2>
            <p>Our cutting edge technology allows you to take your brick-and-mortar store into an online ecommerce shop
                keeping your unique store layout. Just take pictures of your existing shelves, upload, mark the goods
                and fill in product details. We'll take care of the rest.
            </p>

            <br>

        </div>
    </div>
</header>

<section class="row" id="product">
    <div class="container">
        <div class="row m0  wow fadeIn">
            <div class="col-sm-12 image texts">
                <div class="texts-inner text-center">
                    <h2>Image gallery</h2>
                </div>

                <div class="owl-carousel imagegallery">
                    <div><img src="/promo/images/split-1.jpg" class="img-responsive"></div>
                    <div><img src="/promo/images/split-2.jpg" class="img-responsive"></div>
                    <div><img src="/promo/images/split-1.jpg" class="img-responsive"></div>
                    <div><img src="/promo/images/split-2.jpg" class="img-responsive"></div>
                </div>

            </div>

            <div class="col-sm-12 image texts">
                <div class="texts-inner text-center">
                    <h2>Demo Video</h2>
                </div>
                <a data-fancybox="" href="https://www.youtube.com/watch?v=UdJeIj4S2ks" class="demovideo hovereffect">
                    <img src="/promo/images/split-2.jpg" class="img-responsive">
                    <div class="middle">
                        <div class="mtext"><img src="/promo/images/videoicon.png"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="row the-benefits" id="features">
    <div class="container">
        <div class="row section-header wow fadeInUp">
            <h2>FEATURES</h2>
        </div>
        <div class="row benefit-notes">

            <div class="col-sm-6 col-md-4 benefit wow fadeInUp">
                <div class="media">
                    <div class="media-left">
                        <span><i class="li_location"></i></span>
                    </div>
                    <div class="media-body">
                        <h4>Navigate and shop</h4>
                        <p>Navigate and shop easily using natural process of picking the goods straight from the
                            shelves.</p>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 benefit wow fadeInUp" data-wow-delay="0.3s">
                <div class="media">
                    <div class="media-left">
                        <span><i class="li_heart"></i></span>
                    </div>
                    <div class="media-body">
                        <h4>Familiar environment</h4>
                        <p>Let your existing customers to shop online in an already familiar environment. <br><br></p>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 benefit wow fadeInUp" data-wow-delay="0.3s">
                <div class="media">
                    <div class="media-left">
                        <span><i class="li_heart"></i></span>
                    </div>
                    <div class="media-body">
                        <h4>Impulse buys</h4>
                        <p>Motivate impulse buys by displaying multiple products on the same page. <br><br></p>
                    </div>
                </div>
            </div>


        </div>
    </div>
</section>

<footer class="row">
    <div class="container">
        <div class="row m0 social-links">
            <ul class="nav">
                <li class="wow fadeInUp"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="wow fadeInUp" data-wow-delay="0.1s"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="wow fadeInUp" data-wow-delay="0.2s"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li class="wow fadeInUp" data-wow-delay="0.3s"><a href="#"><i class="fa fa-youtube"></i></a></li>
                <li class="wow fadeInUp" data-wow-delay="0.4s"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                <li class="wow fadeInUp" data-wow-delay="0.5s"><a href="#"><i class="fa fa-pinterest"></i></a></li>
            </ul>
        </div>
        <div class="row m0 menu-rights">
            <ul class="nav footer-menu">
                <li><a href="#">View Demo</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Sign In</a></li>

            </ul>
            <p>Copyright © 2020. Shoptop.am.
                <br class="small-divide"> All rights reserved</p>
        </div>
    </div>
</footer>

<div class="row product-box mfp-hide" id="product-choose">
    <button class="mfp-close custom_close" title="Close (Esc)" type="button">&#215;</button>

    <div class="product-desc">
        <form action="" id="preorderform" class="choose-form row m0" method="get" data-redirect="none">

            <div class="personal-info" id="js-personal-info" tabindex="-1">

                <div class="row">
                    <div class="form-group col-sm-6">
                        <input type="text" name="First_Name" class="form-control" placeholder="First Name" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <input type="text" name="Last_Name" class="form-control" placeholder="Last Name" required>
                    </div>
                </div>
                <div class="form-group">
                    <input type="email" name="Email" class="form-control" placeholder="Email Address" required>
                </div>
                <div class="form-group">
                    <input type="text" name="Address_Line_1" class="form-control" placeholder="Address Line 1" required>
                </div>
                <div class="form-group">
                    <input type="text" name="Address_Line_2" class="form-control" placeholder="Address Line 2" required>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <input type="text" name="State" class="form-control" placeholder="State" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <input type="text" name="Zip_Code" class="form-control" placeholder="Zip Code" required>
                    </div>
                </div>
                <div class="form-group">
                    <select class="form-control" name="Country" required>
                        <option selected value="">Choose a country</option>
                        <option value="United States">United States</option>
                        <option value="United Kingdom">United Kingdom</option>
                        <option value="Australia">Australia</option>
                        <option value="India">India</option>
                    </select>
                </div>
                <div class="submit-area-2 row m0">
                    <button type="submit" class="btn btn-rounded js-preorder-btn btn-block"><span>Sign In</span>
                    </button>
                </div>
            </div>

        </form>
    </div>
</div>

<a href="#header" class="back_to_top"><img src="/promo/images/back_to_top.png" alt="back to top"></a>

<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="/promo/js/lib/bootstrap.min.js"></script>
<script src="/promo/vendors/owl-carousel/owl.carousel.js"></script>
<script src="/promo/vendors/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="/promo/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="/promo/vendors/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="/promo/js/plugins/wow.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css"/>
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>


<script src="/promo/js/main.js"></script>
</body>
{{--   <body>
       <div class="flex-center position-ref full-height">
           @if (Route::has('login'))
               <div class="top-right links">
                   @auth
                       <a href="{{ url('/home') }}">Home</a>
                   <a class="dropdown-item" href="{{ route('logout') }}"
                      onclick="event.preventDefault();
                                                    document.getElementById('logout-form').submit();">
                       {{ __('Logout') }}
                   </a>
                   <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                       @csrf
                   </form>

               @else
                       <a href="{{ route('login') }}">Login</a>

                       @if (Route::has('register'))
                           <a href="{{ route('register') }}">Register</a>
                       @endif
                   @endauth
               </div>
           @endif

           <div class="content">
               <div class="title m-b-md">
                   {{env('APP_NAME')}}
               </div>
           </div>
       </div>
   </body>--}}
</html>
