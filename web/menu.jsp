<%-- 
    Document   : menu
    Created on : 02-Feb-2022, 12:32:23 pm
    Author     : Apu
--%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
%>
<%
    if (request.getSession().getAttribute("User") == null) {
        String errorMsg = "You are not logged in. Please login first!!";
        request.setAttribute("ErrorMsg", errorMsg);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ExaDine</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!--*******For Icon below link used*******-->
        <link rel="stylesheet" href="css/magnific-popup.css"> 

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <script>

            function showCartValue()
            {
                if ("${sessionScope.Cart.size()}" > 0) {
                    $('#result').html(<s:property value="#session.Cart.size()" />);
                    
                }
                
            }

            function addProductToCart(productId)
            {
                
                $.ajax({
                    url: 'addProductToCart',
                    method: 'POST',
                    data: {productId: productId},
                    success: function (resultText) {
                        $('#result').text(resultText.cart.size());
                        
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!');
                    }
                });
                window.location.reload();
            }
            
            
            

        </script>
    </head>
    <body onload="showCartValue()">
        <div class="py-1 bg-black top">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <a class="navbar-brand" href="index.html">ExaDine</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> Menu
                    </button>

                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
                        <li  class="nav-item" id="profile"  ><a   href="profile" class="nav-link">Profile </a></li>
                        <li style="display: block"  class="nav-item" id="login" value="logout" name="login" ><a  href="logout" class="nav-link">Logout</a></li>
                        <li class="nav-item cta"><a onclick="showCartValue()" id="viewCart" name="viewCart" href="viewCart" class="nav-link"><i  class="fa" style="font-size:28px">&#xf07a; <span id="result"</span></i> <span id="result"></span></a></li>

                    </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->

            <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-end justify-content-center">
                        <div class="col-md-9 ftco-animate text-center mb-4">
                            <h1 class="mb-2 bread"><s:property value="restaurantName"/></h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Menu <i class="ion-ios-arrow-forward"></i></span></p>
                        </div>
                    </div>
                </div>
            </section>


            <section class="ftco-section">
                <div class="container">
                    <div class="ftco-search">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap">
                                <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link ftco-animate active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Breakfast</a>

                                    <a class="nav-link ftco-animate" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Lunch</a>

                                    <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Dinner</a>

                                    <a class="nav-link ftco-animate" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">Drinks</a>

                                    <a class="nav-link ftco-animate" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false">Desserts</a>

                                    <a class="nav-link ftco-animate" id="v-pills-6-tab" data-toggle="pill" href="#v-pills-6" role="tab" aria-controls="v-pills-6" aria-selected="false">Wine</a>

                                </div>
                            </div>
                            <div class="col-md-12 tab-wrap">

                                <div class="tab-content" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <s:if test="noData==false">
                                                <s:iterator value="menuList">

                                                    <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                        <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                            <div class="menu-img img" style="background-image: url(images/breakfast-<s:property value="productId"/>.jpg);"></div>
                                                            <div class="text d-flex align-items-center">
                                                                <div>
                                                                    <div class="d-flex">
                                                                        <div class="one-half">
                                                                            <h3><s:property value="foodItems"/></h3><br>
                                                                        </div>
                                                                        <div class="one-forth">
                                                                            <span class="price"><h3>  ₹<s:property value="price"/></h3></span>
                                                                        </div>
                                                                    </div>
                                                                    <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                                    <!--<p><a href="#" class="btn btn-primary">Order now</a></p>-->
                                                                    <input type="button" value='Add to Cart' onclick="addProductToCart(<s:property value="productId"/>)">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:iterator>
                                            </s:if>
                                            <s:else>
                                                <div style="color: red;">No Data Found.</div>
                                            </s:else>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/lunch-1.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/lunch-2.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/lunch-3.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/lunch-4.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/lunch-5.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/lunch-6.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/lunch-7.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/lunch-8.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dinner-1.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dinner-2.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/dinner-3.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/dinner-4.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dinner-5.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dinner-6.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-day-4-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/drink-1.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/drink-2.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/drink-3.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/drink-4.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/drink-5.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/drink-6.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-day-5-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dessert-1.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dessert-2.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/dessert-3.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/dessert-4.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/dessert-5.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/drink-6.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-day-6-tab">
                                        <div class="row no-gutters d-flex align-items-stretch">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/wine-1.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/wine-2.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/wine-3.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/wine-4.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/wine-5.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url(images/wine-6.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/wine-7.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img order-md-last" style="background-image: url(images/wine-8.jpg);"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>Grilled Mutton with potatoes</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">$29</span>
                                                                </div>
                                                            </div>
                                                            <p><span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span></p>
                                                            <p><a href="#" class="btn btn-primary">Order now</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- loader -->
            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


            <script src="js/jquery.min.js"></script>
            <script src="js/jquery-migrate-3.0.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.easing.1.3.js"></script>
            <script src="js/jquery.waypoints.min.js"></script>
            <script src="js/jquery.stellar.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/aos.js"></script>
            <script src="js/jquery.animateNumber.min.js"></script>
            <script src="js/bootstrap-datepicker.js"></script>
            <script src="js/jquery.timepicker.min.js"></script>
            <script src="js/scrollax.min.js"></script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
            <script src="js/google-map.js"></script>
            <script src="js/main.js"></script>

    </body>
</html>