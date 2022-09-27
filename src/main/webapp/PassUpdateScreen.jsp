<%-- 
    Document   : PassUpdateScreen
    Created on : 01/10/2021, 8:33:29 PM
    Author     : quyda
--%>


<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Passsword update screen to change the password for staff or customer-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link rel="stylesheet" href="./css/warning.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Update</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <%
        Staff staff = (Staff) session.getAttribute("staff");
        Customer customer = (Customer) session.getAttribute("customer");
        String passErr = (String) session.getAttribute("passErr");
    %>
    <body>
        <div style="padding-left:40%; padding-top: 20%">
            <form action="AccountUpdateServlet" method="post">
                <%if (passErr.equals("passErr")) {%>              
                <table>
                    <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                    <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td> <td class="error">Invalid password format!</td> </tr>             
                    <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error"></tr>
                </table> 
                <label class="error">Minimum six characters, at least one uppercase letter, one lowercase letter, one number and one special character(@$!%*?&)</label>
                <p>
                <%} else if (passErr.equals("wrongPass")) {%>
                <table>
                    <tr><td>Current Password:</td> <td><input class="errorField" type="password" name="Password0" required> </td> <td class="error">Current password is not corrected!</td> </tr>
                    <tr><td>Password:</td> <td><input type="password" name="Password" required ></td></tr> 
                    <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>
                </table>
                <%} else if (passErr.equals("noMatch")) {%>
                <table>
                    <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                    <tr><td>Password:</td> <td><input type="password" name="Password" class="errorField" required ></td></tr> 
                    <tr><td>Re-type Password:</td><td><input class="errorField" type="password" name="Password2" required></td><td class="error">Not matched!</td></tr>
                </table>
                <%} else {%>
                <table>

                    <tr><td>Current Password:</td> <td><input type="password" name="Password0" required> </td> </tr>
                    <tr><td>New Password:</td> <td><input type="password" name="Password" required> </td> </tr>
                    <tr><td>Re-type Password:</td><td><input type="password" name="Password2" required></td></tr>        
                </table>
                <%}%>
                <%session.setAttribute("passUpdate", "true");
                    session.setAttribute("customer", customer);
                    session.setAttribute("staff", staff);
                %>
                <button type="submit" class="btn btn-success" >Save</button>
            </form>
        </div>
        <div class=" position-fixed start-0 top-0">
            <form method="post" action="AccountScreen.jsp"  >       
                <button type="submit" class="btn btn-secondary">Cancel</button>
            </form>
        </div>
    </body>
</html>
