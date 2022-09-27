<%-- 
    Document   : Cart
    Created on : 06/10/2021, 9:54:33 PM
    Author     : clint
--%>

<%@page import="uts.asd.controller.Validator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="uts.asd.model.dao.DbCon"%>
<%@page import="uts.asd.model.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="uts.asd.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        request.setAttribute("total", dcf.format(total));
    }
%>

<%
    Validator validate = new Validator();
    validate.clear(session);
    Customer user = (Customer) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="./header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title        
    </head>
    <body>
        <%@include file="./navBar2.jsp"%>

        <div class="container-fluid">
            <div class="d-flex py-3"><h3>Total Price: $ ${total} </h3> <a class="mx-3 btn btn-primary" href="Payment.jsp">Check Out</a></div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" width="3%">ID</th>
                        <th scope="col" width="15%">Name</th>
                        <th scope="col" width="5%">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col" width="7%">Remove</th>
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
                        <td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>">Remove</td>
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
