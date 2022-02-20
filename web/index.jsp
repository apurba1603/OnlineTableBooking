<%-- 
    Document   : index
    Created on : 31-Jan-2022, 2:06:44 am
    Author     : Apu
--%>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0);
%>
<%
    if (request.getSession().getAttribute("User") == null) {
        String errorMsg = "You are not logged in. Please login first!!";
        request.setAttribute("ErrorMsg", errorMsg);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
            }
            .modal-confirm {
                color: #434e65;
                width: 525px;
            }
            .modal-confirm .modal-content {
                padding: 20px;
                font-size: 16px;
                border-radius: 5px;
                border: none;
            }
            .modal-confirm .modal-header {
                background: #47c9a2;
                border-bottom: none;
                position: relative;
                text-align: center;
                margin: -20px -20px 0;
                border-radius: 5px 5px 0 0;
                padding: 35px;
            }
            .modal-confirm h4 {
                text-align: center;
                font-size: 36px;
                margin: 10px 0;
            }
            .modal-confirm .form-control, .modal-confirm .btn {
                min-height: 40px;
                border-radius: 3px;
            }
            .modal-confirm .close {
                position: absolute;
                top: 15px;
                right: 15px;
                color: #fff;
                text-shadow: none;
                opacity: 0.5;
            }
            .modal-confirm .close:hover {
                opacity: 0.8;
            }
            .modal-confirm .icon-box {
                color: #fff;
                width: 95px;
                height: 95px;
                display: inline-block;
                border-radius: 50%;
                z-index: 9;
                border: 5px solid #fff;
                padding: 15px;
                text-align: center;
            }
            .modal-confirm .icon-box i {
                font-size: 64px;
                margin: -4px 0 0 -4px;
            }
            .modal-confirm.modal-dialog {
                margin-top: 80px;
            }
            .modal-confirm .btn, .modal-confirm .btn:active {
                color: #fff;
                border-radius: 4px;
                background: #eeb711 !important;
                text-decoration: none;
                transition: all 0.4s;
                line-height: normal;
                border-radius: 30px;
                margin-top: 10px;
                padding: 6px 20px;
                border: none;
            }
            .modal-confirm .btn:hover, .modal-confirm .btn:focus {
                background: #eda645 !important;
                outline: none;
            }
            .modal-confirm .btn span {
                margin: 1px 3px 0;
                float: left;
            }
            .modal-confirm .btn i {
                margin-left: 1px;
                font-size: 20px;
                float: right;
            }
            .trigger-btn {
                display: inline-block;
                margin: 100px auto;
            }
        </style>
        <title>ExaDine</title>


        <meta name="google-signin-client_id" content="712965236037-igrai07uhkr7505kguf3sper1ae6h5u1.apps.googleusercontent.com">
        <meta name="google-signin-scope" content="profile email">
        <script src="https://apis.google.com/js/platform.js" async defer></script>

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                // Handler for .ready() called.
                $('html, body').animate({
                    scrollTop: $('#showRestaurants').offset().top
                }, 800);
            });

        </script>

        <script>

            function makeReservation() {
                $.ajax({
                    url: 'reservation',
                    method: 'POST',
                    data: {},
                    success: function (resultText) {
//                        $('#myModal').modal('show');
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!');
                    }
                });

            }

            function notLoggedIn() {
                alert("you are not logged in");
            }

            function fetchRestaurantId(restaurantId) {
                $.ajax({
                    url: 'bookTable',
                    method: 'POST',
                    data: {restaurantId: restaurantId},
                    success: function (resultText) {
                        $('#result').html(resultText);
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!');
                    }
                });
            }

        </script>
    </head>
    <body>
        <script>
            function signOut() {
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                });
                auth2.disconnect();
            }
        </script>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">ExaDine</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <%
                            if (request.getSession().getAttribute("User") != null) {%> 

                        <li  class="nav-item" id="profile"  ><a   href="profile" class="nav-link">Profile </a></li>
                        <li style="display: block"  class="nav-item" id="login" value="logout" name="login" ><a href="#" onclick="signOut();"   class="nav-link">Logout</a></li>

                        <% } %>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel js-fullheight">


            <div class="slider-item js-fullheight" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-12 col-sm-12 text-center ftco-animate">
                            <span class="subheading">ExaDine</span>
                            <h1 class="mb-4">Convenient &amp; Time Saving</h1>
                        </div>

                    </div>
                </div>
            </div>

        </section>


        <section id="showRestaurants" class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-12 text-center heading-section ftco-animate">
                        <span class="subheading">Top</span>
                        <h2 class="mb-4">Resturants</h2>
                    </div>
                </div>	
                <div class="row">


                    <s:if test="noData==false">
                        <s:iterator value="restaurantList">
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="staff">
                                    <div class="img" style="background-image: url(images/restaurant<s:property value="restaurantId"/>.jpg);"></div>
                                    <div class="text pt-4">
                                        <h3><s:property value="restaurantName" /></h3>
                                        <span class="position mb-2"><s:property value="location" /></span>
                                        <span class="position mb-2">Cost For Two <s:property value="approxCost" /></span>
                                        <!--<p><a type="button" href="bookTable.action?restaurantId=<s:property value="restaurantId"/>" data-toggle="modal" data-target="#exampleModalCenter"  class="btn btn-primary">Book a table</a></p>-->
                                        <!--<a id="restaurant" onclick"fetchRestaurantId(<s:property value="restaurantId"/>)" ><button data-toggle="modal" data-target="#exampleModalCenter"  class="btn btn-primary">Book a table</button> </a>-->



                                        <%
                                            if (request.getSession().getAttribute("User") != null) {%> 
                                        <button id="restaurantId" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDiscount" onclick="fetchRestaurantId(<s:property value="restaurantId"/>)" >Book a table</button><br><br>


                                        <% } else {%>
                                        <input  data-toggle="modal" type="button" data-target="#loginModal"   value="Book a table" class="btn btn-primary"><br><br>
                                        <%}%>

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
        </section>

        <section  id="reservationForm" class="ftco-section img" style="background-image: url(images/bg_3.jpg)" data-stellar-background-ratio="0.5">
            <div class="container">

                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content rounded-0">
                            <div class="modal-body py-0">


                                <div class="d-flex main-content">



                                    <div class="row d-flex">
                                        <div class="col-md-7 ftco-animate makereservation p-4 px-md-5 pb-md-5">
                                            <div class="heading-section ftco-animate mb-5 text-center">
                                                <!--                                                <span class="subheading">Book a table</span>
                                                                                                <h2 class="mb-4">Make Reservation</h2>-->
                                            </div>
                                            <form action="reservation" method="post">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="">Name</label>
                                                            <input autocomplete="off" name="customerName" type="text" class="form-control" placeholder="Full Name" value="<s:property value="firstName"></s:property>" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">Email</label>
                                                                <input name="email" type="text" class="form-control" placeholder="Your Email" value="<s:property value="email"></s:property>">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">Phone</label>
                                                                <input name="phoneNumber" type="text" class="form-control" placeholder="Phone Number" value="<s:property value="phoneNumber"></s:property>">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">Date</label>
                                                                <input name="bookingDate" type="datetime-local" class="form-control" id="bookdate" placeholder="Date">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">No. of Table</label>
                                                                <div class="select-wrap one-third">
                                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                                    <select name="bookedTable" id="" class="form-control">
                                                                        <option  value="" name="bookedTable" selected hidden>No. of Table</option>
                                                                        <!--<option value="">Person</option>-->
                                                                        <option >1</option>
                                                                        <option >2</option>
                                                                        <option >3</option>
                                                                        <option >4</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">Person</label>
                                                                <div class="select-wrap one-third">
                                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                                    <select name="person" id="" class="form-control">
                                                                        <option  value="" name="person" selected hidden>No of Person</option>
                                                                        <!--<option value="">Person</option>-->
                                                                        <option >1</option>
                                                                        <option >2</option>
                                                                        <option >3</option>
                                                                        <option >4</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mt-3">
                                                            <div class="form-group text-center">
                                                                <button  type="submit" class="btn btn-primary"   >Book a table</button>
                                                                <!--<input  type="submit" data-toggle="modal" data-target="#myModal"  class="btn btn-primary"  onclick="makeReservation()"   value="Make a Reservation">-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>


            <!-- Modal HTML -->
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                        <div class="modal-header justify-content-center">
                            <div class="icon-box">
                                <i class="material-icons">&#xE876;</i>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center">
                            <h4>Great!!!</h4> 
                            <p><s:property value="msg"></s:property></p>
                        <button class="btn btn-success" data-dismiss="modal"><span>Thank you!!!</span> </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- LOGIN Modal HTML -->
        <div id="loginModal" class="modal fade">
            <div class="modal-dialog modal-confirm">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h4>Oops!</h4> 
                        <p>Your are not logged in</p>
                        <a href="login" class="btn btn-success" ><span>Login to continue</span></a> 
                    </div>
                </div>
            </div>
        </div>   


        <!--        Modal: modalDiscount-->
        <div class="modal fade right" id="modalDiscount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true" data-backdrop="true">
            <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-danger" role="document">
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <p class="heading">Discount offer:
                            <strong>10% off</strong>
                        </p>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="white-text">&times;</span>
                        </button>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-3">
                                <p></p>
                                <p class="text-center">
                                <ion-icon name="fast-food-outline"></ion-icon>
                                </p>
                            </div>

                            <div class="col-9">
                                <p>Now you can order food along with the reservation and you will get additional 10% discount on food ordered online</p>
                                <p>
                                    <strong>
                                        <u>Do you want to order food?</u>.</strong>
                                </p>

                            </div>
                        </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer flex-center">
                        <a href="showMenu" class="btn btn-danger">Order Food
                            <i class="far fa-gem ml-1 white-text"></i>
                        </a>
                        <a type="button" class="btn btn-outline-danger waves-effect" type="button" data-toggle="modal" data-target="#exampleModalCenter" data-dismiss="modal">No, thanks</a>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!--Modal: modalDiscount-->


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
