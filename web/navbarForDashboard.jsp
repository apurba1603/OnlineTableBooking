<%-- 
    Document   : navbarForDashboard
    Created on : 02-Feb-2022, 4:15:09 pm
    Author     : Apu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Startmin - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="adminResources/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="adminResources/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="adminResources/css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="adminResources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">Admin</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                        <li><a href="logout">Logout <i class="fa fa-sign-out fa-fw"></i></a></li>
                        
                        
                    
                </ul>



                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="#"><i class="fa fa-dashboard fa-fw"></i> Dashboard<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="reservations">Reservations</a>
                                    </li>
                                    <li>
                                        <a href="showUsers">Users</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li> 
                            <li>
                                <a href="#"><i class="fa fa-edit fa-fw"></i> Services<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="addRestaurant.jsp">Add Restaurant</a>
                                    </li>
                                    <li>
                                        <a href="addItem">Add Menu</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li> 
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            

        <!-- jQuery -->
        <script src="adminResources/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="adminResources/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="adminResources/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="adminResources/js/startmin.js"></script>

    </body>
</html>