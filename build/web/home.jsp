<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home - Storee</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css"> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet"> 
        <style>
            #next-section-2 h1 {
                margin-top: 200px; /* Adjust the value to your preference */
            }

            @import url("https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap");
            /* Hero Section */
            body {
                margin: 0; /* Loại bỏ margin mặc định của body */
            }

            .jumbotron {
                margin-bottom: 0; /* Loại bỏ margin dưới của jumbotron (hero section) */
            }

            .py-5 {
                padding-top: 0; /* Loại bỏ padding trên của các phần có lớp py-5 */
            }

            #meo {
                background-image: url('images/background.jpg'); 
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                padding: 300px 0px;
                height: 800px;
            }


            #meo::before { 
                transition: opacity 1s ease-in-out; /* Add this line */
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 800px;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1; /* Lower z-index than the content */
            }

            .hero-content {
                position: relative; /* Allows setting z-index on the content */
                z-index: 2;  /* Higher z-index than the overlay */
            }
            .featured-products {
                background: linear-gradient(to bottom, #141414, #141414), url('images/background.jpg'); /* Màu của header là màu của ảnh nền */
                background-size: cover;
                background-position: center;
            }

            svg {
                font-family: "Playfair Display", sans-serif;
                width: 100%; 
                height: 100%;
                color: white;
            }
            svg text {
                animation: stroke 7s infinite;
                stroke-width: 2;
                stroke: #552F0C;
                font-size: 90px;
                color: white;
            }
            @keyframes stroke {
                0% {
                    fill: rgba(255, 255, 255, 0);
                    stroke: rgba(255, 255, 255, 1);
                    stroke-dashoffset: -25%;
                    stroke-dasharray: 50% 0;
                    stroke-width: 2;
                }
                20% {
                    fill: rgba(255, 255, 255, 0);
                    stroke: rgba(255, 255, 255, 1);
                    stroke-dashoffset: 25%;
                    stroke-dasharray: 0 50%;
                    stroke-width: 2;
                }
                50% {
                    fill: rgba(255, 255, 255, 1);
                    stroke: rgba(255, 255, 255, 0);
                    stroke-width: 0;
                }
                70% {
                    fill: rgba(255, 255, 255, 0);
                    stroke: rgba(255, 255, 255, 1);
                    stroke-dashoffset: 25%;
                    stroke-dasharray: 0 50%;
                    stroke-width: 2;
                }
                80% {
                    fill: rgba(255, 255, 255, 1);
                    stroke: rgba(255, 255, 255, 0);
                    stroke-width: 0;
                }
                100% {
                    fill: rgba(255, 255, 255, 0);
                    stroke: rgba(255, 255, 255, 1);
                    stroke-dashoffset: -25%;
                    stroke-dasharray: 50% 0;
                    stroke-width: 2;
                }
            }
            .product-card {
                background-color: #F8F4EA; /* A warm off-white */
                border-radius: 8px;        /* Rounded corners */
                overflow: hidden;         /* Hide overflowing content (like shadows) */
                border: none; /* A subtle white border */ /* Remove default bootstrap border */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Adjust values as needed */ /* Subtle shadow for depth */
                transition: transform 0.3s ease; /* Smooth hover effect */
            }
            .product-card:hover .product-overlay {
                opacity: 0.8; /* Slightly more transparent */
            }
            .product-card:hover {
                transform: translateY(-5px); /* Slight lift on hover */
            }

            .product-image-container {
                aspect-ratio: 4/3;
                position: relative;
                overflow: hidden; /* Hide overlay when not hovered */
            }

            .product-image {
                width: 100%;
                height: auto;
                transition: transform 0.3s ease; /* Image zoom effect */
            }

            .product-card:hover .product-image {
                transform: scale(1.1);
            }

            .product-overlay {
                background: linear-gradient(45deg, rgba(255,255,255,0.3), rgba(255,255,255,0)); /* Subtle gradient */
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6); /* Dark overlay */
                display: flex;
                justify-content: center;
                align-items: center;
                opacity: 0; /* Hidden by default */
                transition: opacity 0.3s ease; /* Smooth fade-in */
            }

            .product-card:hover .product-overlay {
                opacity: 1;
            }

            .product-info {
                padding: 15px;
            }

            .product-name {
                font-family: 'Playfair Display', serif; /* Use your elegant font */
                margin-bottom: 5px;
            }

            .product-price {
                font-weight: 500;
            }.best-sellers {
                background: linear-gradient(to bottom, #141414, #282828); /* Darker at top, lighter at bottom */
            }
            .special-offers .card {
                border-radius: 10px; /* Rounded card corners */
                box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow */
                transition: transform 0.3s ease; /* Smooth hover effect */
            }
            .special-offers .card:hover {
                transform: translateY(-5px); 
            }

        </style>
    </head>

    <body>
        <%@include file="header.jsp" %> 

        <section class="hero jumbotron jumbotron-fluid" id="meo" > 
            <div class="container text-center hero-content" style="z-index: 2;" > 
                <h1 class="display-1 text-white" style="font-family: 'Playfair Display', serif;">Elevate Your Style</h1>
                <p class="lead text-white">Discover curated collections for the modern fashionista.</p>
                <a href="#main-home" class="btn btn-outline-light btn-lg">Shop Now</a>
            </div>
        </section>

        <section class="featured-products py-5">
            <div class="container-fluid" id="main-home">
                <svg>
                <text x="50%" y="50%" dy=".35em" text-anchor="middle" style="color: white;">
                Curated Essentials
                </text>
                </svg>
                <p class="text-white" style="text-align: justify; font-size: 25px; margin: 50px; margin-bottom: 0!important;">
    Immerse yourself in our thoughtfully curated collection, a treasure trove of unique and timeless pieces that transcend fleeting trends. 
    Discover wardrobe staples that form the foundation of your personal style, alongside statement pieces that ignite your individuality and allow you to express yourself with confidence. 
    Each item is meticulously handpicked for its exceptional quality, unparalleled versatility, and the power to inspire your fashion journey. 
</p>
                <iframe src="home.html" frameborder="0" style="width: 100%; height: 110vh; overflow: hidden"></iframe>
                
                
            </div>
        </section>
        <div style="background: #141414;">
            <section class="promo-banner py-5"> 
                <div class="container-fluid text-center promo-content"> 
                    <h1 class="text-white display-1" style="font-family: 'Playfair Display', serif;">Exclusive Access</h1>
                    <p class="text-white">Unlock special offers and early access to new arrivals.</p>
                </div>
            </section>
            <div class="container-fluid text-center">
                <iframe src="lib.html" frameborder="0" style="width: 100%; height: 120vh; overflow: hidden; margin: 0 auto;"></iframe>
            </div>
            <section class="quote py-5">
                <div class="container text-center">
                    <h4 class="display-1 text-white" style="font-family: 'Playfair Display', serif;">"Fashion is the armor to survive the reality of everyday life."</h4>
                    <p class="text-white lead">- Bill Cunningham</p>
                </div>
            </section>
            <br>
            <%-- // add one fixed attachment image and text show best seller --%>

            <div id="next-section-2" style="background-image: url('img/background2.jpg'); background-size: cover; background-position: center;background-attachment: fixed; padding: 300px 50   px; height: 600px; opacity: 0.85;">
                <div class="container text-center hero-content row align-items-end" style="z-index: 2; padding-top: 120px;">
                    <div class="col-md-6 col-lg-6">
                        <h1 class="display-1 text-white" style="font-family: 'Playfair Display', serif;">Best Sellers</h1>
                        <p class="lead text-white">Discover our most popular items.</p>
                    </div>
                </div>
            </div>

            <section class="best-sellers py-5">
                <div class="container">
                    <div class="row">

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product1">
                                <div class="product-image-container">
                                    <img src="productImage/1.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 1">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Varsity Jacket</h5>
                                    <p class="product-price">$129.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="product1" tabindex="-1" role="dialog" aria-labelledby="productModal1Label" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document"> 
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="productImage/1.jpg" class="img-fluid" alt="Product 1">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

    <div class="modal fade" id="product2" tabindex="-1" role="dialog" aria-labelledby="productModal2Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/2.jpg" class="img-fluid" alt="Product 2">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product3" tabindex="-1" role="dialog" aria-labelledby="productModal3Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/3.jpg" class="img-fluid" alt="Product 3">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product4" tabindex="-1" role="dialog" aria-labelledby="productModal4Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/4.jpg" class="img-fluid" alt="Product 4">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product5" tabindex="-1" role="dialog" aria-labelledby="productModal5Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/5.jpg" class="img-fluid" alt="Product 5">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product6" tabindex="-1" role="dialog" aria-labelledby="productModal6Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/6.jpg" class="img-fluid" alt="Product 6">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product7" tabindex="-1" role="dialog" aria-labelledby="productModal7Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/7.jpg" class="img-fluid" alt="Product 7">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product8" tabindex="-1" role="dialog" aria-labelledby="productModal8Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/8.jpg" class="img-fluid" alt="Product 8">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product9" tabindex="-1" role="dialog" aria-labelledby="productModal9Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/9.jpg" class="img-fluid" alt="Product 9">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product10" tabindex="-1" role="dialog" aria-labelledby="productModal10Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/10.jpg" class="img-fluid" alt="Product 10">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product11" tabindex="-1" role="dialog" aria-labelledby="productModal11Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/11.jpg" class="img-fluid" alt="Product 11">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="product12" tabindex="-1" role="dialog" aria-labelledby="productModal12Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="productImage/12.jpg" class="img-fluid" alt="Product 12">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product2">
                                <div class="product-image-container">
                                    <img src="productImage/2.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 2">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Oversized Hoodie</h5>
                                    <p class="product-price">$89.99</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product3">
                                <div class="product-image-container">
                                    <img src="productImage/3.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 3">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Cardigan</h5>
                                    <p class="product-price">$119.99</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product4">
                                <div class="product-image-container">
                                    <img src="productImage/4.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 4">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Plaid Shirt</h5>
                                    <p class="product-price">$74.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product5">
                                <div class="product-image-container">
                                    <img src="productImage/5.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 5">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Striped Polo</h5>
                                    <p class="product-price">$59.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product6">
                                <div class="product-image-container">
                                    <img src="productImage/6.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 6">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Denim Jacket</h5>
                                    <p class="product-price">$139.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product7">
                                <div class="product-image-container">
                                    <img src="productImage/7.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 7">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Track Pants</h5>
                                    <p class="product-price">$69.99</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product8">
                                <div class="product-image-container">
                                    <img src="productImage/8.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 8">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Graphic Tee</h5>
                                    <p class="product-price">$44.99</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product9">
                                <div class="product-image-container">
                                    <img src="productImage/9.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 9">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Flannel Shirt</h5>
                                    <p class="product-price">$79.99</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product10">
                                <div class="product-image-container">
                                    <img src="productImage/10.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 10">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Bomber Jacket</h5>
                                    <p class="product-price">$169.99</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product11">
                                <div class="product-image-container">
                                    <img src="productImage/11.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 11">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Turtleneck Sweater</h5>
                                    <p class="product-price">$99.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#product12">
                                <div class="product-image-container">
                                    <img src="productImage/12.jpg" class="img-fluid product-image" alt="Jangwoung Outfit 12">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5 class="product-name">Leather Jacket</h5>
                                    <p class="product-price">$299.99</p>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </section>

            <section class="special-offers py-5" style="background-color: #F8F4EA;"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2 class="display-4" style="font-family: 'Playfair Display', serif; color: #552F0C;">Special Offers</h2>
                            <p class="lead">Don't miss out on our hottest deals!</p>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-4 mb-4">
                            <div class="card h-100" style="border: 2px solid #552F0C;">
                                <div class="card-body text-center">
                                    <h5 class="card-title" style="font-family: 'Playfair Display', serif;">Free Shipping Nationwide</h5>
                                    <p class="card-text">Enjoy free shipping on orders over $50.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100" style="border: 2px solid #552F0C;">
                                <div class="card-body text-center">
                                    <h5 class="card-title" style="font-family: 'Playfair Display', serif;">20% Off Your First Purchase</h5>
                                    <p class="card-text">Use code NEW20 to get 20% off your first order.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100" style="border: 2px solid #552F0C;">
                                <div class="card-body text-center">
                                    <h5 class="card-title" style="font-family: 'Playfair Display', serif;">Buy 2 Get 1 Free</h5>
                                    <p class="card-text">Choose 3 items, the lowest priced item is free.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="trending-now-and-inspiration py-5" style="background: linear-gradient(to bottom, #282828, #141414);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center mb-4">
                            <h2 class="display-4 text-white" style="font-family: 'Playfair Display', serif;">Trending Now</h2>
                            <p class="lead text-white">Discover the latest styles making waves this season.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#productModal1">
                                <div class="product-image-container">
                                    <img src="images/trending1.jpg" class="img-fluid" alt="Trending Product 1">
                                    <div class="product-overlay">
                                        <a class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5>Luxe Leather Tote</h5>
                                    <p class="product-price">$299.99</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#productModal2">
                                <div class="product-image-container">
                                    <img src="images/trending2.jpg" class="img-fluid" alt="Trending Product 2">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5>White Skirt</h5>
                                    <p class="product-price">$49.99</p> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="product-card" data-toggle="modal" data-target="#productModal3">
                                <div class="product-image-container">
                                    <img src="images/trending3.jpg" class="img-fluid" alt="Trending Product 3">
                                    <div class="product-overlay">
                                        <a  class="btn btn-outline-light btn-sm">Click Here</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h5>Coquette Aesthetic Tote Bag</h5>
                                    <p class="product-price">$89.99</p>
                                </div>
                            </div>
                        </div>
                    </div> 

                    <div class="row mt-5"> 
                        <div class="col-md-6 ">
                            <div class="product-image-container">
                                <img src="images/inspiration.jpg" class="img-fluid rounded" alt="Style Inspiration">
                            </div>
                        </div>
                        <div class="col-md-6 d-flex align-items-center">
                            <div>
                                <h3 class="text-white" style="font-family: 'Playfair Display', serif;">Your Style, Your Story</h3>
                                <p class="text-white lead">Express yourself with our curated collection of fashion-forward pieces. From casual chic to elegant evening wear, find your perfect look.</p>
                                <a  class="btn btn-outline-light">Explore More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>






<div class="modal fade" id="productModal1" tabindex="-1" role="dialog" aria-labelledby="productModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document"> 
        <div class="modal-content">
            <div class="modal-body">
                <img src="images/trending1.jpg" class="img-fluid" alt="Trending Product 1">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="productModal2" tabindex="-1" role="dialog" aria-labelledby="productModal2Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document"> 
        <div class="modal-content">
            <div class="modal-body">
                <img src="images/trending2.jpg" class="img-fluid" alt="Trending Product 2">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="productModal3" tabindex="-1" role="dialog" aria-labelledby="productModal3Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document"> 
        <div class="modal-content">
            <div class="modal-body">
                <img src="images/trending3.jpg" class="img-fluid" alt="Trending Product 3">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
        <%@include file="footer.jsp" %>




        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script >
            // Image Zoom Effect (Smooth)
            const productImages = document.querySelectorAll('.product-image');
            productImages.forEach(image => {
                image.addEventListener('mousemove', (e) => {
                    const x = e.clientX - e.target.offsetLeft;
                    const y = e.clientY - e.target.offsetTop;
                    const xPercent = x / e.target.offsetWidth * 100;
                    const yPercent = y / e.target.offsetHeight * 100;

                    image.style.transformOrigin = `${xPercent}% ${yPercent}%`;
                    image.style.transform = 'scale(1.1)';
                });

                image.addEventListener('mouseleave', () => {
                    image.style.transformOrigin = 'center center';
                    image.style.transform = 'scale(1)';
                });
            });




// Image Zoom Effect (Smooth)
            const productImages = document.querySelectorAll('.product-image');
            productImages.forEach(image => {
                // ... (Rest of the zoom effect code remains the same)
            });

// Array of background images (Make sure these image paths are correct!)
            const backgrounds = [
                'images/background.jpg',
                'images/background1.jpg',
                'images/background2.jpg'
                        // ... Add more backgrounds here 
            ];
            let currentBackgroundIndex = 0;

// Select the correct element for the background change
            const heroSection = document.querySelector('#meo');

            function changeBackground() {
                heroSection.style.opacity = 0.5; // Bắt đầu làm mờ nhẹ

                // Tải ảnh mới trước khi thay đổi nền
                const newBackgroundIndex = (currentBackgroundIndex + 1) % backgrounds.length;
                const img = new Image();
                img.src = backgrounds[newBackgroundIndex];

                img.onload = () => {
                    // Khi ảnh đã tải xong, mới thay đổi nền và làm mờ dần
                    currentBackgroundIndex = newBackgroundIndex;
                    heroSection.style.backgroundImage = `url(${backgrounds[currentBackgroundIndex]})`;
                    heroSection.style.opacity = 1;
                };
            }

// Add transition to CSS for smooth effect
            heroSection.style.transition = 'opacity 1s ease-in-out';

// Initial background change
            changeBackground();

// Set the interval to change background every 4 seconds
            setInterval(changeBackground, 2000);

            
        </script>
    </body>
// backup from minthep 
</html>
