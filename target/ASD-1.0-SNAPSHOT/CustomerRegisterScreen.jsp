<%-- 
    Document   : RegisterScreen
    Created on : 09/09/2021, 12:08:11 PM
    Author     : quyda
--%>

<%@page import="uts.asd.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Register screen to create customer screen-->
    <head>
        <title>Customer Register</title>
        <link rel="stylesheet" href="./css/warning.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>
     <!-- Get all the error message if have -->
    <%
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String nameErr = (String) session.getAttribute("nameErr");
        String phoneErr = (String) session.getAttribute("phoneErr");
        String addressErr = (String) session.getAttribute("addressErr");
        String dateErr = (String) session.getAttribute("dateErr");
        Validator validate = new Validator();
        validate.clear(session);

    %>
    <h1>Sign Up</h1>
    <div style="padding-left:10px;">
        <form action="AccountCreateServlet" method="post">
            <table class="table.table-borderless"> 
                <%if (nameErr.equals("nameErr")) {%>                            
                <tr><td>First Name:</td><td><input class="errorField" type="text"name="FName"></td><td class="error">Invalid format!</td></tr>
                <tr><td>Last Name:</td><td><input class="errorField" type="text"name="LName" ></td><td class="error">Invalid format!</td></tr>
                        <%} else if (nameErr.equals("empty")) {%>
                <tr><td>First Name:</td><td><input class="errorField" type="text"name="FName"></td><td class="error">Name can not be empty!</td></tr>
                <tr><td>Last Name:</td><td><input class="errorField" type="text"name="LName" ></td></tr>
                        <%} else {%>
                <tr><td>First Name:</td><td><input type="text"name="FName"></td></tr>
                <tr><td>Last Name:</td><td><input type="text"name="LName" ></td></tr>

                <%}%>
                <%if (emailErr.equals("emailErr")) {%>
                <tr><td>Email:</td><td><input class="errorField" type="text" name="Email" required></td><td class="error">Invalid format!</td></tr>
                        <%} else if (emailErr.equals("empty")) {%>
                <tr><td>Email:</td><td><input type="text" name="Email" required></td><td class="error">Email can not be empty!</td></tr>
                        <%} else if (emailErr.equals("existed")) {%>
                <tr><td>Email:</td><td><input type="text" name="Email" required></td><td class="error">Email existed! Please choose a different Email</td></tr>
                        <%} else {%>              
                <tr><td>Email:</td><td><input type="text" name="Email" required></td></tr>
                        <%}%>

                <%if (passErr.equals("passErr")) {%>
                <tr><td>Password:</td><td><input class="errorField" type="password" name="Password" required></td><td class="error">Invalid Format!</td></tr>
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td></tr>
                        <%} else if (passErr.equals("noMatch")) {%>
                <tr><td>Password:</td><td><input class="errorField" type="password" name="Password" required></td></tr>
                <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error">Password is not matched</td></tr>    
                        <%} else {%>
                <tr><td>Password:</td><td><input type="password" name="Password" required></td></tr>
                <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>
                        <%}%>

                <%if (phoneErr.equals("phoneErr")) {%>               
                  <tr><td>Phone Number:</td><td><input class="errorField" type="text" name="PhoneNum"></td><td class="error">Invalid format!</td></tr>
                        <%} else {%>                        
                <tr><td>Phone Number:</td><td><input type="text" name="PhoneNum"></td></tr> 
                        <%}%>

                <%if (addressErr.equals("addressErr")) {%>               
                <tr><td>Address:</td><td><input class="errorField" type="text" name="Address"></td><td class="error">Invalid format!</td></tr>
                        <%} else {%>  
                <tr><td>Address:</td><td><input type="text" name="Address"></td></tr>

                <%}%>
                <%if (dateErr.equals("dateErr")) {%>               
                <tr><td>DOB:</td><td><input class="errorField" type="date" name="DOB"></td><td class="error">Invalid format!</td></tr>
                        <%} else {%>  
                <tr><td>DOB:</td><td><input type="date" name="DOB"></td><td> If null, current date will be assumed</td></tr>
                        <%}%> 
                <tr><td><a href="index.jsp" class="btn btn-secondary">Cancel</a></td><td><button type="submit" name="register" class="btn btn-success">Sign Up</button></td></tr>
            </table> 
                 <!-- indicate the account type is customer -->
                <%
                session.setAttribute("customerCreate","true");
                session.setAttribute("staffCreate","");
                %>
        </form>
        <jsp:include page="/ConnServlet" flush="true"/> 
    </div>        
</html>
