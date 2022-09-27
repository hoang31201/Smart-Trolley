<%-- 
    Document   : item management
    Created on : 10/09/2021, 5:28:34 AM
    Author     : Jack Hennessy
--%>

<%@page import="uts.asd.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Sales management</title>
    </head>
    <%
      String existErr = (String) session.getAttribute("existErr");
      DBManager manager = (DBManager) session.getAttribute("manager");
      ArrayList<Payment> payments = (ArrayList<Payment>) manager.GetPayments();
      
    %>

    <header>
            <%@include file="./header.jsp"%>
            <jsp:include page="./navBar2.jsp" flush="true"/>
    </header>

    <body>
        <div class="title">
            <h1 style="position: relative; left: 40%; padding-bottom: 2%;">Sales Management</h1>
        </div>

        <div class="container">
            <!-- main content div -->
            <div class="row">

                <div class="col-sm">
                    <div class="productList">
                        <h2>Payment list</h2>
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control mr-sm-2" placeholder="Search for card name..">
                        <table id="myTable" class="table">
                            <tr>
                                <th>
                                    <b>Payment ID</b>
                                </th>
                                <th>
                                    <b>Order ID</b>
                                </th>
                                <th>
                                    <b>Payment Method</b>
                                </th>     
                                <th>
                                    <b>Price</b>
                                </th>
                                <th>
                                    <b>CVV</b>
                                </th>
                                <th>
                                    <b>Card Name</b>
                                </th>
                                <th>
                                    <b>Expiry Date</b>
                                </th>
                                <th>
                                    <b>Date Paid</b>
                                </th>
                            </tr>
                            
                            
                            <% if (payments != null) {
                                for (Payment i : payments) {%>
                            
                                <tr>
                                    <td><%= i.getPaymentId() %></td>
                                    <td><%= i.getOrderId() %></td>
                                    <td><%= i.getPaymentMethod() %></td>
                                    <td><%= i.getPrice() %></td>
                                    <td><%= i.getCvv() %></td>
                                    <td><%= i.getNameOnCard() %></td>
                                    <td><%= i.getExpiryDate() %></td>
                                    <td><%= i.getDatePaid() %></td>
                                    
                                    
                                </tr>
                                <%}
                                    }
                            %>
                            
                        </table>
                        
                        <script>
                            function myFunction() {
                              // Declare variables
                              var input, filter, table, tr, td, i, txtValue;
                              input = document.getElementById("myInput");
                              filter = input.value.toUpperCase();
                              table = document.getElementById("myTable");
                              tr = table.getElementsByTagName("tr");

                              // Loop through all table rows, and hide those who don't match the search query
                              for (i = 0; i < tr.length; i++) {
                                td = tr[i].getElementsByTagName("td")[5];
                                if (td) {
                                  txtValue = td.textContent || td.innerText;
                                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                    tr[i].style.display = "";
                                  } else {
                                    tr[i].style.display = "none";
                                  }
                                }
                              }
                            }
                        </script>
                            
                    </div>
                </div>

                
                
                
                
                <jsp:include page="/ConnServlet" flush="true"/>
            </div>

        </div>
       
    </body>
</html>
