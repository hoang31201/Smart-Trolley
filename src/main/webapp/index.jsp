<%-- 
    Document   : index
    Created on : 06/10/2021, 11:06:51 PM
    Author     : clint
--%>

<%@page import="uts.asd.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="uts.asd.model.Product"%>
<%@page import="uts.asd.model.dao.ProductDao"%>
<%@page import="uts.asd.model.dao.DbCon"%>
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
        <%@include file="./header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to smart trolley</title>       
    </head>
    <body>
        <%@include file="./navBar2.jsp"%>

        <div class="container-fluid">
            <div class="card-header my-3">All Products</div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Product name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Received date</th>
                        <th scope="col">Region</th>
                        <th scope="col">Description</th>
                        <th scope="col">Add to Cart</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (!products.isEmpty()) {
                            for (Product p : products) {%>
                    <tr>
                        <th scope="row" width="3%"><%= p.getId()%></th>
                        <td width="15%"><%= p.getName()%></td>
                        <td width="5%">$<%= p.getPrice()%></td>
                        <td width="10%"><%= p.getReceivedDate()%></td>
                        <td width="5%"><%= p.getRegion()%></td>
                        <td><%= p.getDescription()%></td>
                        <td width="7%"><a href="add-to-cart?id=<%= p.getId()%>" class="btn btn-primary">Add</a></td>
                    </tr>
                    <%}
                        }
                    %>
                </tbody>
            </table>
        </div>

        <%@include file="./footer.jsp"%>
    </body>
</html>
