<%-- 
    Document   : viewCart
    Created on : 08-Feb-2022, 12:52:03 pm
    Author     : Apu
--%>

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


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        
        <script>
            
            
            function showRestaurants() {
                $.ajax({
                    url: 'showRestaurants',
                    method: 'POST',
                    success: function (resultText) {
                        $('#result').html(resultText);
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!!');
                    }
                });
            }
        </script>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-dark" id="ftco-navbar" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="overlay"></div>
                <a class="navbar-brand" href="index.html">Feliciano</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
                        <!--<li class="nav-item"><a href="showRestaurants" class="nav-link">Restaurants</a></li>-->
                        <li class="nav-item"><a href="showMenu" class="nav-link">Menu</a></li>
                        <li class="nav-item"><a href="orderConfirmation.jsp" class="nav-link">order</a></li>
                            <%--<s:if test="sessionScope.User==null">--%>
                        <li  class="nav-item" id="profile"  ><a   href="profile" class="nav-link">Profile </a></li>
                        <li style="display: block"  class="nav-item" id="login" value="logout" name="login" ><a  href="logout" class="nav-link">Logout</a></li>
                            <%--</s:if>--%>
                        <li class="nav-item cta"><a href="reservationForm" class="nav-link">Book a table</a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        
        
        
        <h2>Items in Cart</h2>
        
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                <th scope="col">Item</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="cart">
                                <tr>
                                <td><h3><s:property value="foodItems"/></h3></td>
                                <td><h3><s:property value="price"/></h3></td>
                                </tr>
                            </s:iterator>

                        </tbody>
                    </table>
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

    </body>
</html>


