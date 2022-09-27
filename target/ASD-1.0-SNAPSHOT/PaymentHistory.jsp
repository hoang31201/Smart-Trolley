<%-- 
    Document   : PaymentHistory
    Created on : 7 Oct 2021, 23:07:53
    Author     : casio
    Page use to show the payment history of a customer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Payment History Page</title>
    </head>
    <%
    Customer customer = (Customer) session.getAttribute("customer");
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
        <div class="container-fluid">
        <table class="table table-bordered"><!-- show all the payment history of this customer -->
            <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
            <th>Payment Id</th>
            <th>Payment Method</th>
            <th>Amount</th>
            <th>Card Number</th>
            <th>Name On Card</th>
            <th>Date paid</th>
            <c:forEach items="${history}" var="obj">
                <tr>
                    <td>${obj.paymentId}</td>
                    <td>${obj.paymentMethod}</td>
                    <td>${obj.price}</td>
                    <td>${obj.cardNumber}</td>
                    <td>${obj.nameOnCard}</td>
                    <td>${obj.datePaid}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </body>
</html>
