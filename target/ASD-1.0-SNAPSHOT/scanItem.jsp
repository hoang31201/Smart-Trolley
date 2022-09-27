<%-- 
    Document   : scanItem
    Created on : 2021. 9. 9, 오후 7:45:18
    Author     : 61451
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Smart Trolly Scan Item Page</title>
    </head>
    </head>
    <body>
        <header>
            <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <div class="header">
            <div class="header-content">
                <div class="logo">
                    <h3>Item Scan Page</h3>
                </div>
            </div>
        </div>
        <%
            String existItemErr = (String) session.getAttribute("existItemErr");
        %>
        <div class="container">
            <h1>Scan Item <span id="message"> <%=(existItemErr != null ? existItemErr : "")%> </span></h1>
            <form action="ScanItemServlet" method="get">
            <table class="tablecenter">
                <tr><td>Code (ID):</td><td><input type="text" placeholder="Enter Code (id)" name="id" required></td></tr>
                    <td>
                        <a href="homeScreen.jsp" class="tableButton">Cancel</a>
                        <input class="tableButton" type="submit" value="Search">
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>
