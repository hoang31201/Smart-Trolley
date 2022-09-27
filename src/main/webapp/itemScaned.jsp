<%-- 
    Document   : itemScaned
    Created on : 2021. 10. 29, 오전 1:24:11
    Author     : 61451
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.asd.model.dao.*"%>
<%@page import="uts.asd.controller.Validator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.asd.model.*"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }  
   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Scan Page</title>
    </head>
    <body>
        <h1>Scaned Item Page</h1>
        
        <div class="topcorner"><a class="tableButton" href="homeScreen.jsp">Go Home</a >
        </div> 
        
    <div class="container-fluid">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Item> scanItems = (ArrayList<Item>)session.getAttribute("scanItems");
                
                        for(Item s: scanItems) {
                    %>
                    tr>
                        <th scope="row"><%= s.getId()%></th>
                        <td><%= s.getName()%></td>
                        <td>$<%= s.getPrice()%></td>
                        <td><%= s.getReceiveDate()%></td>
                        <td><%= s.getRegion()%></td>
                        <td><%= s.getDescription()%></td>
                        <td><a href="add-to-cart?id=<%= s.getId()%>" class="btn btn-primary">Add</a></td>
                    </tr>
                    <%}
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>