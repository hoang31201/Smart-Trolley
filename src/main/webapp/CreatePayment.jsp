<%-- 
    Document   : Create Payment
    Created on : 10 Sep 2021, 12:33:43
    Author     : casio
    Page use to create payment detail to make payment faster next time
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Payment"%>
<%@page import="uts.asd.model.dao.PaymentManager"%>
<!DOCTYPE html>
<html>
    <!-- Get the error message and object need from the session -->
    <%
        Customer customer = (Customer) session.getAttribute("customer");
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Payment payment = paymentManager.searchPaymentDetail(customer.getCustomerID());
        String cardNoErr = (String) session.getAttribute("cardNoErr");
        String cvvErr = (String) session.getAttribute("cvvErr");
        String expErr = (String) session.getAttribute("expErr");
    %>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Create Payment Page</title>
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
        </nav>
        <% if (payment != null ) {%> <!-- if the customer already have payment detail out put the warning and link to go back-->
        <h3>Sorry, you already have a payment detail.</h3>
        <h3>Each customer only have one payment detail</h3>
        <p>Click <a href="AccountScreen.jsp" > here </a> to go back to account page.</p>

    <%}  else { %>
        
        <form action="CreatePaymentServlet" method="post">
            <table class="table table-responsive">
                
                <tr><td>Customer Id:#</td><td>${customer.customerID}</td></tr>
                
                <tr>
                    <td>
                        <select class="select" type="text" name="paymentMethod"><!-- get payment method input -->
                            <option value="empty">Payment Method</option>
                            <option value="card">Credit Card</option>
                            <option value="cash">Cash</option>
                            <option value="other">Other</option>                                                                
                        </select>                                   
                    </td>
                </tr><!-- output error message if the format not correct -->
                <%if (cardNoErr.equals("cardNoErr")) {%>
                <tr><td>Card Number</td><td><input class="errorField" type="text" name="cardNumber" required=""/></td><td class="error">Invalid format!</td></tr>
                <%} else {%><!-- get the card number input -->
                <tr><td>Card Number</td><td><input type="text" name="cardNumber" required=""/></td></tr><!-- get card number input -->
                <%}%><!-- get the expiry date input -->
                <tr><td>Expiry Date</td><td><input type="text" name="expiryDate" required=""/></td></tr>
                <%if (cvvErr.equals("cvvErr")) {%><!-- output error message if the format not correct -->
                <tr><td>CVV</td><td><input class="errorField" type="password" name="cvv"/></td><td class="error">Invalid format!</td></tr>
                <%} else {%><!-- get the cvv input -->
                <tr><td>CVV</td><td><input type="password" name="cvv"/></td></tr>
                <%}%>
                <tr><td>Name On Card</td><td><input type="text" name="nameOnCard" required=""/></td></tr>
                <tr><td>Agree to Terms of Service</td><td><input type="checkbox" name="tos" id="tos"/></td></tr>
                <tr><td>
                        <input type="submit" value="Save" class="button" name = "submit" id="submit" disabled>
                    </td></tr>
            </table>
        </form>
        <script><!-- must to aggree to term of services to enable the pay button -->
            var checker = document.getElementById("tos");
            var send = document.getElementById("submit");
            this.onchange = function () {
                if (checker.checked) {
                    send.disabled = false;
                } else {
                    send.disabled = true;
                }
            };
        </script>
        <jsp:include page="/ConnServlet" flush="true"/>
        <% } %>
    </body>
</html>

