<%-- 
    Document   : PaymentSuccess
    Created on : 9 Sep 2021, 01:47:05
    Author     : casio
    Page to confirm that the payment is successful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.controller.Validator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="uts.asd.model.dao.DbCon"%>
<%@page import="uts.asd.model.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="uts.asd.model.*"%>
<%@page import="java.util.ArrayList"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }
%>

<%
    Validator validate = new Validator();
    validate.clear(session);
    Customer customer = (Customer) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Payment Success Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="navBar.jsp">Smart Trolley</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto topnav">
                    <li class="nav-item">
                        <a class="nav-link" href="navBar.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link btn btn-primary text-white" type="button" href="AccountScreen.jsp" data-toggle="modal" data-target="#myModal">${customer.customerFName}'s Account<span class="sr-only">(current)</a>                  
                    </li>
                </ul>
            </div>
        </nav><!-- tell the user payment success -->
        <h3>Your Payment is Successful!</h3>
        <h4 align="center">Receipt</h4>
        <div class="container-fluid">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (cart_list != null) {
                            for (Cart c : cartProduct) {%>
                    <tr>
                        <th scope="row"><%= c.getId()%></th>
                        <td><%= c.getName()%></td>
                        <td>$<%= dcf.format(c.getPrice())%></td>
                        <td><%=c.getQuantity()%></td>
                    </tr>
                    <%}
                        }
                    %>
                    
                </tbody>
            </table>
        </div>
        <h4 align="right">Total Price: $ ${(total>0)?dcf.format(total):0} </h4>
    </body>
</html>
