<%-- 
    Document   : login
    Created on : 23/09/2021, 1:41:49 PM
    Author     : quyda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <title>Welcome</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/warning.css">
        <link rel="stylesheet" href="./css/button.css">
    </head>
    <body>
        <%String validate = (String) session.getAttribute("authentication");%>
        <h1>Login page</h1>
        <div class="position-absolute top-50 start-50 translate-middle">
            <form action="AccountLoginServlet" method="post">
                <table class="table.table-borderless">
                    <tr><td>Email:</td><td><input type="text" name="Email" required></td></tr>
                    <tr><td>Password:</td><td><input type="password" name="Password" required></td></tr>
                    <tr><td><input class="btn btn-success" name="login" type="submit" value="Sign In"></td></tr>
                </table>            
            </form>
        </div>
        <div class="position-absolute top-0 end-0">
            <form action="index.jsp" method="post">
                    <input class="btn btn-warning" name="login" type="submit" value="Log in as guest">
            </form>
        </div>
        <%
            if (validate != null) {
                if (validate.equals("invalid")) {
        %>
        <div>
        <div style="padding-left:5px">
            <label class="error" >Illegal character(s) detected! Please recheck the input</label>
        </div>
        <%} else if (validate.equals("unknow")) {%>
        <div style="padding-left:5px">
            <label class="error" >Wrong email or password!</label>
        </div>
        </div>
        <%}
            }%>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>

</html>
