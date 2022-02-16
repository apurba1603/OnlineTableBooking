<%-- 
    Document   : reservationForm
    Created on : 31-Jan-2022, 3:23:17 am
    Author     : Apu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Feliciano </title>
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
        <link rel="stylesheet" href="css/profile.css">

        <style>
            .table-responsive {
                display: block;
                width: 120%;
                overflow-x: auto;
            }

        </style>
    </head>
    <body>
        <div class="py-1 bg-black top">

        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Feliciano</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
                        <li style="display: block"  class="nav-item" id="login" value="logout" name="logout" ><a  href="logout" class="nav-link">Logout</a></li>

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
                        <h1 class="mb-2 bread">Profile</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Profile <i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="rt-container">
                <div class="col-rt-12">
                    <div class="Scriptcontent">

                        <!-- Student Profile -->
                        <div class="student-profile py-4">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card shadow-sm">
                                            <div class="card-header bg-transparent text-center">
                                                <img class="profile_img" src="images/profile.jfif" alt="student dp">
                                                <h3><s:property value="firstName" /> <s:property value="lastName" /></h3>
                                            </div>
                                            <div class="card-body">
                                                <p class="mb-0"><strong class="pr-1">Email Id:</strong><s:property value="email" /></p>
                                                <p class="mb-0"><strong class="pr-1">Contact no.</strong><s:property value="phoneNumber" /></p>
                                            </div>
                                            <div class="btn">


                                                <div class="btn" >
                                                    <a href="updateProfileForm"><button class="button-18">Update Profile</button></a>
                                                </div>
                                                <br>
                                                <div class="btn" >
                                                    <a href="logout"><button class="button-18">Logout</button></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card shadow-sm">
                                            <div class="card-header bg-transparent border-0">
                                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
                                            </div>
                                            <div class="card-body pt-0">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th width="30%">Address</th>
                                                        <td width="2%">:</td>
                                                        <td><s:property value="address"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th width="30%">Date of Birth	</th>
                                                        <td width="2%">:</td>
                                                        <td><s:property value="dob"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th width="30%">Gender</th>
                                                        <td width="2%">:</td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div style="height: 26px"></div>
                                        <div class="card shadow-sm">
                                            <div class="card-header bg-transparent border-0">
                                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Your Bookings</h3>
                                            </div>
                                            <div class="card-body pt-0">

                                                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                                                    <s:if test="noData==false">
                                                        <h4>Current Booking</h4>
                                                        <font style="color: #a52834"><c:out value="${requestScope.MSG}"></c:out></font>
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-sm">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">Restaurant Name</th>
                                                                        <th scope="col">Date</th>
                                                                        <th scope="col">Orders</th>
                                                                        <th scope="col">Person</th>
                                                                        <th scope="col"></th>
                                                                    </tr>
                                                                </thead>
                                                                <s:iterator value="reservationList">
                                                                    <tr>
                                                                        <td><s:property value="restaurantName" /></td>
                                                                        <td><s:property value="bookingDate" /></td>
                                                                        <td><a href="showOrders.action?submitType=showOrders&reservationId=<s:property value="reservationId"/>"><button class="button-11" role="button">View Orders</button></a></td>
                                                                        <td><s:property value="person" /></td>
                                                                        <td>
                                                                            <a href="cancelReservation.action?reservationId=<s:property value="reservationId"/>"><button class="button-11" role="button">Cancel</button></a>
                                                                            <!--<button class="button-11" role="button">update</button>-->
                                                                        </td>
                                                                    </tr>
                                                                </s:iterator>
                                                            </table>
                                                        </s:if>
                                                        <s:else>
                                                            <div style="color: red;">No Reservation Found</div>
                                                        </s:else>
                                                    </div>
                                                </main>
                                            </div>
                                        </div>
                                        <s:if test="orderList!=null">
                                        <div style="height: 26px"></div>
                                        <div class="card shadow-sm">
                                            <div class="card-header bg-transparent border-0">
                                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Your Bookings</h3>
                                            </div>
                                            <div class="card-body pt-0">

                                                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                                                    
                                                        <h4>Current Booking</h4>
                                                        <font style="color: #a52834"><c:out value="${requestScope.MSG}"></c:out></font>
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-sm">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">#</th>
                                                                        <th scope="col">Item</th>
                                                                        <th scope="col">Quantity</th>
                                                                        
                                                                    </tr>
                                                                </thead>
                                                                <s:iterator value="orderList">
                                                                    <tr>
                                                                        <td><s:property value="#" /></td>
                                                                        <td><s:property value="foodItems" /></td>
                                                                        <td><s:property value="#" /></td>
                                                                    </tr>
                                                                </s:iterator>
                                                            </table>
                                                    </div>
                                                </main>
                                            </div>
                                        </div>
                                                        
                                                        </s:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- partial -->

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