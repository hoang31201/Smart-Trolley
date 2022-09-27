<%-- 
    Document   : newjsp
    Created on : 30/09/2021, 3:46:57 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/warning.css">
    </head>
    <%String emailErr="Warning invalid";%>
    <body>
        <table class="table"> 
                
                <tr><td>First Name:</td><td><input class="errorField" type="text"name="customerFName"></td><td class="error"> <%=emailErr%></td></tr>
                <tr><td>First Name:</td><td><input type="text"name="customerFName"></td></tr>
         </table>
    </body>
</html>
