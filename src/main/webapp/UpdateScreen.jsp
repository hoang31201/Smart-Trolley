<%-- 
    Document   : CustomerUpdateScreen
    Created on : 25/09/2021, 4:31:29 PM
    Author     : quyda
--%>

<%@page import="uts.asd.model.Staff"%>
<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Update screen to update customer or staff 's details beside from password-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/warning.css">
        <link rel="stylesheet" href="./css/button.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Update</title>       
    </head>

    <body>
        <div class="header">
            <div class="header-right">
            </div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="AccountScreen.jsp"><h3>My Account</h3></a>
                        </li>                      
                    </ul>
                </div>
            </nav>
        </div>
        <h3>Update Profile</h3>
        <!-- Get all the error message. -->
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");

            String emailErr = (String) session.getAttribute("emailErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
            String addressErr = (String) session.getAttribute("addressErr");
            String dateErr = (String) session.getAttribute("dateErr");
        %>
        <%if (customer != null) {%>
        <div>
            <form action="AccountUpdateServlet" method="post">
                <table class="table.table-borderless"> 
                    <tr><td>Customer ID: </td><td>${customer.customerID}</td></tr>
                    <%if (nameErr.equals("nameErr")) {%>                 
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Invalid name format!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td><td class="error">Invalid name format!</td></tr>
                            <%} else if (nameErr.equals("empty")) {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Name can not be empty!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td><td class="error"></td></tr>
                            <%} else {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=customer.getCustomerFName()%>"></td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=customer.getCustomerLName()%>"></td></tr>
                            <%}%>

                    <%if (emailErr.equals("emailErr")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class="errorField"></td><td class="error">Invalid email format!</td></tr>
                            <%} else if (emailErr.equals("existed")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email existed! Please choose a different Email</td></tr>
                            <%} else {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" value="${customer.customerEmail}"></td></tr>      
                            <%}%>

                    <%if (phoneErr.equals("phoneErr")) {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum" class="errorField"></td><td class="error">Invalid Phone Number format!</td></tr>
                            <%} else {%>                   
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${customer.customerPhoneNum}"></td></tr> 
                            <%}%>

                    <%if (addressErr.equals("addressErr")) {%>
                    <tr><td>Address:</td><td><input type="text" name="Address" class="errorField"></td><td class="error">Invalid Address format!</td></tr>
                            <%} else {%>
                    <tr><td>Address:</td><td><input type="text" name="Address"value="<%=customer.getCustomerAddress()%>"></td></tr>                  
                            <%}%>

                    <%if (dateErr.equals("dateErr")) {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB" class="errorField"><td class="error">Invalid DOB format!</td></td> 
                            <%} else {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB"value="${customer.customerDOB}"></td>
                            <%}%>
                    </tr> 
                    <tr><td><a href="AccountScreen.jsp" class="btn btn-secondary">Cancel</a></td><td><button type="submit" name="update" class="btn btn-success">Save</button></td></tr>
                </table>
            </form>          
        </div>
        <%} else if (staff != null) {%>
        <div>
            <form action="AccountUpdateServlet" method="post">
                <table class="table.table-borderless">               
                    <tr><td>Staff ID: </td><td>${staff.staffID}</td></tr>
                    <%if (nameErr.equals("nameErr")) {%>                 
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Invalid name format!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td><td class="error">Invalid name format!</td></tr>
                            <%} else if (nameErr.equals("empty")) {%> 
                    <tr><td>FIRST NAME: </td><td><input type="text" class="errorField" name="FName"></td><td class="error">Name can not leave empty!</td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" class="errorField" name="LName"></td></tr>
                            <%} else {%>
                    <tr><td>FIRST NAME: </td><td><input type="text" name="FName" value="<%=staff.getStaffFName()%>"></td></tr>
                    <tr><td>LAST NAME: </td><td><input type="text" name="LName" value="<%=staff.getStaffLName()%>"></td></tr>
                            <%}%>

                    <%if (emailErr.equals("emailErr")) {%>                  
                    <tr><td>Email:</td><td><input type="text" name="Email" class="errorField"></td><td class="error">Invalid email format!</td></tr>
                            <%} else if (emailErr.equals("existed")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email existed! Please choose a different Email</td></tr>
                            <%} else if (emailErr.equals("empty")) {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" class ="errorField"></td><td class="error">Email can not leave empty!</td></tr>        
                            <%} else {%>
                    <tr><td>Email:</td><td><input type="text" name="Email" value="${staff.staffEmail}"></td></tr>
                            <%}%>

                    <%if (phoneErr.equals("phoneErr")) {%>                      
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum" class="errorField"></td><td class="error">Invalid Phone Number format!</td></tr> 
                            <%} else {%>
                    <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"value="${staff.staffPhoneNum}"></td></tr>
                            <%}%>

                    <%if (addressErr.equals("addressErr")) {%>                  
                    <tr><td>Address:</td><td><input type="text" name="Address" class="errorField"></td><td class="error">Invalid Address format!</td></tr>
                            <%} else {%>
                    <tr><td>Address:</td><td><input type="text" name="Address"value="<%=staff.getStaffAddress()%>"></td></tr> 
                            <%}%>

                    <%if (dateErr.equals("dateErr")) {%>                    
                    <tr><td>DOB:</td><td><input type="date" name="DOB" class="errorField"><td class="error">Invalid DOB format!</td></td> 
                            <%} else {%>
                    <tr><td>DOB:</td><td><input type="date" name="DOB"value="${staff.staffDOB}"></td> 
                            <%}%>
                    </tr>                      
                    <tr><td><a href="AccountScreen.jsp" class="btn btn-secondary">Cancel</a></td><td><button type="submit" name="update" class="btn btn-success">Save</button></td></tr>
                </table>                       
            </form>
        </div> 
        <%}%>
        <%session.setAttribute("passUpdate", "");%>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
