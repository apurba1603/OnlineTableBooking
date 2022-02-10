<%-- 
    Document   : adminPanel
    Created on : 02-Feb-2022, 2:19:03 pm
    Author     : Apu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Dashboard</title>
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="./css/dashboard.css" rel="stylesheet">
        <!--adding javascript here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script>
            function showCartValue()
            {
                if ("${sessionScope.Cart.size()}" > 0) {
                    $('#result').html('<c:out value="${sessionScope.Cart.size()}" />');

                } else {
                    document.getElementById("viewCart").style.pointerEvents = "none";
                    document.getElementById("viewCart").style.cursor = "default";
                }
            }
        </script>
    </head>
    <body onload="showCartValue()">

        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="http://www.exavalu.com">
                Exavalu<br>
                Welcome <c:out value='${sessionScope.validUser.getFirstName()}'/>
            </a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-nav">
                <div class="nav-item text-nowrap">
                    <a class="nav-link px-3" href="Logout">Sign out</a>
                </div>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="position-sticky pt-3">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="reservations">
                                    <span data-feather="home"></span>
                                    Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ShowOrders">
                                    <span data-feather="file"></span>
                                    Orders
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ShowProducts">
                                    <span data-feather="shopping-cart"></span>
                                    Products
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ShowCustomers">
                                    <span data-feather="users"></span>
                                    Customers
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="bar-chart-2"></span>
                                    Reports
                                </a>
                            </li>
                        </ul>

                        
                    </div>
                </nav>
                
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="text-center"><span style="color: red;"><h5><s:property value="msg" /></h5></span></div>
                    <h2>Reservations</h2>
                    <font style="color: #a52834"><c:out value="${requestScope.MSG}"></c:out></font>
                    <div class="fixTableHead">
                        <s:if test="noData==false">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                    <th scope="col">Customer Id</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Restaurant Name</th>
                                    <th scope="col">Booking Date</th>
                                    <th scope="col">Booked Table</th>
                                    <th scope="col">Persons</th>
                                    <th scope="col">Order Id</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <s:iterator value="reservationList">
                                    <tr>
                                    <td><s:property value="customerId" /></td>
                                    <td><s:property value="customerName" /></td>
                                    <td><s:property value="restaurantName" /></td>
                                    <td><s:property value="bookingDate" /></td>
                                    <td><s:property value="bookedTable" /></td>
                                    <td><s:property value="person" /></td>
                                    <td><s:property value="orderId" /></td>
                                    <td><s:property value="email" /></td>
                                    <td><s:property value="status" /></td>
                                    </tr>
                                </s:iterator>
                            </table>
                        </s:if>
                        <s:else>
                            <div style="color: red;">No Data Found.</div>
                        </s:else>
                    </div>
                </main>  
            </div>
        </div>


        <script src="./js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="./js/feather.min.js" crossorigin="anonymous"></script>
        <script src="./js/Chart.min.js" crossorigin="anonymous"></script>
        <script src="./js/dashboard.js"></script>
    </body>
</html>

