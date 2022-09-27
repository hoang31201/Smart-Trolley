<%-- 
    Document   : index
    Created on : 2021. 9. 9, 오후 7:22:02
    Author     : 61451
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.controller.Validator"%>
<%@page import="uts.asd.model.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="uts.asd.model.dao.ProductDao"%>
<%@page import="uts.asd.model.dao.DBManager"%>
<%@page import="uts.asd.model.dao.DbCon"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }
%>

<%
    Validator validate = new Validator();
    validate.clear(session);
    Customer user = (Customer) session.getAttribute("user");
%>

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Smart Trolly DashBoard Page</title>
    </head>
    
    <%
      System.out.println("1");
      String existErr = (String) session.getAttribute("existErr");
      System.out.println("2");
      DBManager manager = (DBManager) session.getAttribute("manager");
      System.out.println("3");
      ArrayList<Item> items = (ArrayList<Item>) manager.GetItems();
      System.out.println("4");
      System.out.println("!!!!!!! items is: " + items);
      
      
      
    %>
    <body>
        <header>
            <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <h1>Welcome to the Smart Trolly DashBoard Page</h1>  
        <main>
            <span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <div class="productList">
                <h2>Product list</h2>
                <table class="table">
                    <tr>
                        <th>
                            <b>Product ID</b>
                        </th>
                        <th>
                            <b>Product Name</b>
                        </th>
                        <th>
                            <b>Price</b>
                        </th>     
                        <th>
                            <b>Quantity</b>
                        </th>
                        <th>
                            <b>Received date</b>
                        </th>
                        <th>
                            <b>Region</b>
                        </th>
                        <th>
                            <b>Item description</b>
                        </th>
                    </tr>
                            
                            
                    <% if (items != null) {
                        for (Item i : items) {%>
                            
                        <tr>
                            <td value="<%= i.getId()%>" /><%= i.getId() %></td>
                            <td value="<%= i.getName()%>" /><%= i.getName() %></td>
                            <td value="<%= i.getPrice()%>" /><%= i.getPrice() %></td>
                            <td value="<%= i.getQuantity()%>" /><%= i.getQuantity() %></td>
                            <td value="<%= i.getReceiveDate()%>" /><%= i.getReceiveDate() %></td>
                            <td value="<%= i.getRegion()%>" /><%= i.getRegion() %></td>
                            <td value="<%= i.getDescription()%>" /><%= i.getDescription() %></td>
                        </tr>
                                <%}
                                    }
                            %>
                            
                    </table>
                </div>
        </main>
        <div class="container-fluid">
            <h1 class="main_title">Cart Summary</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (cart_list != null) {
                            for (Cart c : cartProduct) {%>
                    <tr>
                        <th scope="row"><%= c.getId()%></th>
                        <td><%= c.getName()%></td>
                        <td>$<%= dcf.format(c.getPrice())%></td>
                        <td>
                            <form action="" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
                                    <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>                                     
                                </div>                                
                            </form>
                        </td>
                    </tr>
                    <%}
                        }
                    %>

                </tbody>
            </table>
        </div>
        <h2>Select a function to use</h2>
        <div>
            <a href="scanItem.jsp">Scan Item</a>
        </div>
         <%@include file="./footer.jsp"%>
    </body>
</html>