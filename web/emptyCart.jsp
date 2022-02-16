<%-- 
    Document   : emptyCart
    Created on : 14-Feb-2022, 5:17:10 pm
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
        <title>Feliciano - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="tableResources/css/style.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/emptyCart.css">
        <script>

            function showCartValue()
            {
                if ("${sessionScope.Cart.size()}" > 0) {
                    $('#result').html(<s:property value="#session.Cart.size()" />);

                }
            }

            function addProductToCart(productId)
            {
                window.location.reload();
//                var qty = document.getElementById("Quantity_" + pid).value;
                $.ajax({
                    url: 'addProductToCart',
                    method: 'POST',
                    data: {productId: productId},
                    success: function (resultText) {
//                        alert(resultText);
                        $('#result').html(resultText);
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!');
                    }
                });
            }


        </script>
    </head>
    <body onload="showCartValue()">
        <div class="py-1 bg-black top">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <a class="navbar-brand" href="index.html">Feliciano</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> Menu
                    </button>

                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
                            <li  class="nav-item" id="profile"  ><a   href="profile" class="nav-link">Profile </a></li>
                            <li style="display: block"  class="nav-item" id="login" value="logout" name="login" ><a  href="logout" class="nav-link">Logout</a></li>
                            <li class="nav-item cta"><a onclick="showCartValue()" id="viewCart" name="viewCart" href="viewCart" class="nav-link"><i  class="fa" style="font-size:28px">&#xf07a; <span id="result"</span></i></span></a></li>

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
                            <h1 class="mb-2 bread">Cart</h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cart <i class="ion-ios-arrow-forward"></i></span></p>
                        </div>
                    </div>
                </div>
            </section>


            <div class="container-fluid mt-100">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Cart</h5>
                            </div>
                            <div class="card-body cart">
                                <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                    <h3><strong>Your Cart is Empty</strong></h3>
                                    <h4>Add items to cart :)</h4> <a href="showMenu" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Add Foods</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





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
            <script src="tableResources/js/jquery.min.js"></script>
            <script src="tableResources/js/popper.js"></script>
            <script src="tableResources/js/bootstrap.min.js"></script>
            <script src="tableResources/js/main.js"></script>

    </body>
</html>
