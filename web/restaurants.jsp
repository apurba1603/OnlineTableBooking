<%-- 
    Document   : restaurants
    Created on : 31-Jan-2022, 4:36:20 am
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
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Feliciano</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
                        <!--<li class="nav-item"><a href="showRestaurants" class="nav-link">Restaurants</a></li>-->
                        <li class="nav-item"><a href="showMenu" class="nav-link">Menu</a></li>
                            <%--<s:if test="sessionScope.User==null">--%>
                        <li  class="nav-item" id="profile"  ><a   href="profile" class="nav-link">Profile </a></li>
                        <li style="display: block"  class="nav-item" id="login" value="logout" name="login" ><a  href="login" class="nav-link">Logout</a></li>
                            <%--</s:if>--%>
                        <li class="nav-item cta"><a href="reservationForm" class="nav-link">Book a table</a></li>

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
                        <h1 class="mb-2 bread">About</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About <i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>






        <section class="ftco-section">
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
                            <div class="img" style="background-image: url(images/restaurant2.jfif);"></div>
                            <div class="text pt-4">
                                <h3><s:property value="restaurantName" /></h3>
                                <span class="position mb-2"><s:property value="location" /></span>
                                <p><a href="bookTable.action?restaurantId =<s:property value="restaurantId"/>" class="btn btn-primary">Book a table</a></p>
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

        <section id="reservationForm" class="ftco-section img" style="background-image: url(images/bg_3.jpg)" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-md-7 ftco-animate makereservation p-4 px-md-5 pb-md-5">
                        <div class="heading-section ftco-animate mb-5 text-center">
                            <span class="subheading">Book a table</span>
                            <h2 class="mb-4">Make Reservation</h2>
                        </div>
                        <form action="reservation" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Name</label>
                                        <input name="customerName" type="text" class="form-control" placeholder="Your Name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Email</label>
                                        <input name="email" type="text" class="form-control" placeholder="Your Email">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Phone</label>
                                        <input name="phoneNumber" type="text" class="form-control" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Date</label>
                                        <input name="bookingDate" type="text" class="form-control" id="book_date" placeholder="Date">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Time</label>
                                        <input name="time" type="text" class="form-control" id="book_time" placeholder="Time">
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
                                        <input name="submitType" value="Reserve" type="submit" value="Make a Reservation" class="btn btn-primary py-3 px-5">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-6 col-lg-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Feliciano</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Open Hours</h2>
                            <ul class="list-unstyled open-hours">
                                <li class="d-flex"><span>Monday</span><span>9:00 - 24:00</span></li>
                                <li class="d-flex"><span>Tuesday</span><span>9:00 - 24:00</span></li>
                                <li class="d-flex"><span>Wednesday</span><span>9:00 - 24:00</span></li>
                                <li class="d-flex"><span>Thursday</span><span>9:00 - 24:00</span></li>
                                <li class="d-flex"><span>Friday</span><span>9:00 - 02:00</span></li>
                                <li class="d-flex"><span>Saturday</span><span>9:00 - 02:00</span></li>
                                <li class="d-flex"><span>Sunday</span><span> 9:00 - 02:00</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Instagram</h2>
                            <div class="thumb d-sm-flex">
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-1.jpg);">
                                </a>
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-2.jpg);">
                                </a>
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-3.jpg);">
                                </a>
                            </div>
                            <div class="thumb d-flex">
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-4.jpg);">
                                </a>
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-5.jpg);">
                                </a>
                                <a href="#" class="thumb-menu img" style="background-image: url(images/insta-6.jpg);">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Newsletter</h2>
                            <p>Far far away, behind the word mountains, far from the countries.</p>
                            <form action="#" class="subscribe-form">
                                <div class="form-group">
                                    <input type="text" class="form-control mb-2 text-center" placeholder="Enter email address">
                                    <input type="submit" value="Subscribe" class="form-control submit px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>


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
