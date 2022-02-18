<%-- 
    Document   : addItem
    Created on : 15-Feb-2022, 2:23:30 am
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
<jsp:include page="navbarForDashboard.jsp" ></jsp:include>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>ExaDine Admin</title>

        <!-- Bootstrap Core CSS -->
        <link href="adminResources/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="adminResources/css/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="adminResources/css/dataTables/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="adminResources/css/dataTables/dataTables.responsive.css" rel="stylesheet">

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

        <style>
            .btn-circle {
                width: 20px;
                height: 20px;
                padding: 0px 0;
                border-radius: 15px;
                text-align: center;
                font-size: 12px;
                line-height: 1.428571429;
            }
            .btn-info {
                color: #fff;
                background-color: green;
                border-color: green;
            }
            .btn-warning {
                color: #212529;
                background-color: red;
                border-color: red;
            }
            .row {
                margin-right: 227px;
                margin-left: 31px;
            }
        </style>

    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->


            <div id="page-wrapper" style="min-height: 231px;">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Reservations</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                <s:property value="msg"/>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <form action="addItem">
                                                <div class="form-group">
                                                
                                                    <label>Select Restaurant</label>
                                                    <select class="form-control" name="restaurantId">
                                                        <s:iterator value="restaurantList">
                                                            <option value="<s:property value="restaurantId"/>" ><s:property value="restaurantName" /></option>
                                                        </s:iterator>
                                                    </select>
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <label>foodItems</label>
                                                    <input name="foodItems" class="form-control" placeholder="foodItems">
                                                </div>
                                                <div class="form-group">
                                                    <label>Price</label>
                                                    <input name="price" type="number" min="0" class="form-control" placeholder="Price">
                                                </div>
                                                <button type="submit" class="btn btn-default">Submit Button</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->



                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="adminResources/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="adminResources/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="adminResources/js/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="adminResources/js/dataTables/jquery.dataTables.min.js"></script>
        <script src="adminResources/js/dataTables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="adminResources/js/startmin.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
        </script>



    </body></html>
