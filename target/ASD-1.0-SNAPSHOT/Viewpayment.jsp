<%-- 
    Document   : Viewpayment
    Created on : 5 Oct 2021, 16:51:00
    Author     : casio
    Page that display the payment detail of customer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Payment"%>
<%@page import="uts.asd.model.dao.PaymentManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <title>Payment Details</title>
</head>
<%
        Customer customer = (Customer) session.getAttribute("customer");
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Payment payment = paymentManager.searchPaymentDetail(customer.getCustomerID());
    %>
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
        </nav>
    
    <% if (payment == null ) {%>
        <p>Sorry, you don't have a payment detail.</p>
        <p>Click <a href="AccountScreen.jsp" > here </a> to go back to account page.</p>

    <%}  else { %>
    <%    
        String paymentMethod = payment.getPaymentMethod();
        String cardNumber = payment.getCardNumber();
        String cvv = payment.getCvv();
        String nameOnCard = payment.getNameOnCard();
        String expiryDate = payment.getExpiryDate();   
    %>
    <div class="container-fluid">
        <form action="UpdatePayment.jsp" method="post">
            <table class="table table-responsive" id="users">
                <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
                <tr><td>Payment Method:</td><td><%= paymentMethod%></td></tr>
                <tr><td>Card Number:</td><td><%= cardNumber%></td></tr>
                <tr><td>Expiry Date:</td><td><%= expiryDate%></td></tr>
                <tr><td>CVV:</td><td><%= cvv%></td></tr>
                <tr><td>Name On Card:</td><td><%= nameOnCard%></td></tr>
                <tr><td>
                        <input type="submit" value="Update" class="button" name = "submit" id="submit">
                    </td></tr>
            </table>
        </form>
        <form action="DeletePaymentServlet" method="post">
            <input type="submit" value="Delete" />
        </form>
    </div>
    <% } %>
</body>
</html>

