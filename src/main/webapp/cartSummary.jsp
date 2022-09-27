<%-- 
    Document   : cartSummary
    Created on : 2021. 9. 9, 오후 7:45:55
    Author     : 61451
--%>
<%@page import="uts.asd.model.ScanCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <body>
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
        if (id == null) {  
        %>
        <h1> Sorry, There is no items added.</h1>
        <a href="homeScreen.jsp">Click here to go back</a>
            
        <%} else {%>
        <table>
            <tr>
                <td>id</td>
                <td>name</td>
                <td>price</td>
            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=price%></td>
            </tr>
        </table>
        
        <div clas="panel_div">
            <a class="button" href="index.jsp">Back to DashBoard/ Home Screen</a>
        </div>
        <% 
            ScanCart scart = new ScanCart (id, name, price);
            session.setAttribute("scart", scart);
        %>
        <%}%>
    </body>
</html>