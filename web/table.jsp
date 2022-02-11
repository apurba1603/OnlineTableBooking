<%-- 
    Document   : table
    Created on : 10-Feb-2022, 11:23:05 pm
    Author     : Apu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="tableResources/css/style.css">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>total</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="alert" role="alert">
                                        <td>
                                            <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox" checked>
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <div class="img" style="background-image: url(tableResources/images/product-1.png);"></div>
                                        </td>
                                        <td>
                                            <div class="email">
                                                <span>Sneakers Shoes 2020 For Men </span>
                                                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>
                                            </div>
                                        </td>
                                        <td>$44.99</td>
                                        <td class="quantity">
                                            <div class="input-group">
                                                <input type="text" name="quantity" class="quantity form-control input-number" value="2" min="1" max="100">
                                            </div>
                                        </td>
                                        <td>$89.98</td>
                                        <td>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </td>
                                    </tr>

                                    <tr class="alert" role="alert">
                                        <td>
                                            <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <div class="img" style="background-image: url(tableResources/images/product-2.png);"></div>
                                        </td>
                                        <td>
                                            <div class="email">
                                                <span>Sneakers Shoes 2020 For Men </span>
                                                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>
                                            </div>
                                        </td>
                                        <td>$30.99</td>
                                        <td class="quantity">
                                            <div class="input-group">
                                                <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                            </div>
                                        </td>
                                        <td>$30.99</td>
                                        <td>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </td>
                                    </tr>

                                    <tr class="alert" role="alert">
                                        <td>
                                            <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <div class="img" style="background-image: url(tableResources/images/product-3.png);"></div>
                                        </td>
                                        <td>
                                            <div class="email">
                                                <span>Sneakers Shoes 2020 For Men </span>
                                                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>
                                            </div>
                                        </td>
                                        <td>$35.50</td>
                                        <td class="quantity">
                                            <div class="input-group">
                                                <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                            </div>
                                        </td>
                                        <td>$35.50</td>
                                        <td>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </td>
                                    </tr>

                                    <tr class="alert" role="alert">
                                        <td>
                                            <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <div class="img" style="background-image: url(tableResources/images/product-4.png);"></div>
                                        </td>
                                        <td>
                                            <div class="email">
                                                <span>Sneakers Shoes 2020 For Men </span>
                                                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>
                                            </div>
                                        </td>
                                        <td>$76.99</td>
                                        <td class="quantity">
                                            <div class="input-group">
                                                <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                            </div>
                                        </td>
                                        <td>$76.99</td>
                                        <td>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </td>
                                    </tr>

                                    <tr class="alert" role="alert">
                                        <td class="border-bottom-0">
                                            <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox">
                                                <span class="checkmark"></span>
                                            </label>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="img" style="background-image: url(tableResources/images/product-1.png);"></div>
                                        </td>
                                        <td class="border-bottom-0">
                                            <div class="email">
                                                <span>Sneakers Shoes 2020 For Men </span>
                                                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">$40.00</td>
                                        <td class="quantity border-bottom-0">
                                            <div class="input-group">
                                                <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                            </div>
                                        </td>
                                        <td class="border-bottom-0">$40.00</td>
                                        <td class="border-bottom-0">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="tableResources/js/jquery.min.js"></script>
        <script src="tableResources/js/popper.js"></script>
        <script src="tableResources/js/bootstrap.min.js"></script>
        <script src="tableResources/js/main.js"></script>
    </body>
</html>
