<%-- 
    Document   : item management
    Created on : 10/09/2021, 5:28:34 AM
    Author     : Jack Hennessy
--%>

<%@page import="uts.asd.controller.Validator"%>
<%@page import="uts.asd.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.asd.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Item management</title>
    </head>
    <%   
      DBManager manager = (DBManager) session.getAttribute("manager");
      ArrayList<Item> items = (ArrayList<Item>) manager.GetItems();
      String itemError = (String) session.getAttribute("itemError");
      String deleteError = (String) session.getAttribute("deleteError");
      Validator validate = new Validator();
      validate.clear(session);
    %>

    <header>
        <%@include file="./header.jsp"%>    
        <jsp:include page="./navBar2.jsp" flush="true"/>
    </header>

    <body>
       

        <div class="title">
            <h1 style="position: relative; left: 40%; padding-bottom: 2%;">Item management</h1>
        </div>

        <div class="container">
            
            <!-- main content div -->
            <div class="row">

                <div class="col-sm">
                    <div class="productList">
                        <h2>Product list</h2>
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control mr-sm-2" placeholder="Search for item name..">
                        <table id="myTable" class="table">
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
                            
                        <script>
                            function myFunction() {
                              // Declare variables
                              var input, filter, table, tr, td, i, txtValue;
                              input = document.getElementById("myInput");
                              filter = input.value.toUpperCase();
                              table = document.getElementById("myTable");
                              tr = table.getElementsByTagName("tr");

                              // Loop through all table rows, and hide those who don't match the search query
                              for (i = 0; i < tr.length; i++) {
                                td = tr[i].getElementsByTagName("td")[1];
                                if (td) {
                                  txtValue = td.textContent || td.innerText;
                                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                    tr[i].style.display = "";
                                  } else {
                                    tr[i].style.display = "none";
                                  }
                                }
                              }
                            }
                        </script>
                    </div>
                </div>
                            
                           
                            

                <div class="col-sm">
                    <form action="ItemServlet" method="post">
                     <%if (itemError.equals("itemError")) {%> 
                     <div class="alert alert-danger fade show" role="alert">
                        <strong>An error has occurred!</strong> Please check you have filled in all fields correctly.
                      </div>     
                    <%}%>
                    <h2>Add/update product</h2>
                    <div class="mb-3">  
                        <label for="exampleFormControlInput0" class="form-label">ID</label>
                        <input type="text" class="form-control" name="ID" id="exampleFormControlInput0" placeholder="Enter product ID" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Enter product name" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput4" class="form-label">Price</label>
                        <input type="text" class="form-control" name="price" id="exampleFormControlInput4" placeholder="Enter product price" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput2" class="form-label">Region</label>
                        <input type="text" class="form-control" name="region" id="exampleFormControlInput2" placeholder="Enter product region" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput2" class="form-label">Quantity</label>
                        <input type="text" class="form-control" name="quantity" id="exampleFormControlInput2" placeholder="Enter product quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput3" class="form-label">Received date</label>
                        <input type="text" class="form-control" name="date" id="exampleFormControlInput3" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                
                </form>
                </div>
                
                <form action="DeleteItemServlet" method="post">
   
                <div class="col-3">
                    
                    <h2>Remove product</h2>
                    <div class="input-group mb-3">
                        <input type="text" name="delete" class="form-control" id="exampleFormControlInput1" placeholder="Enter product name" required>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </div>
                </form>
                    
             
                
                <jsp:include page="/ConnServlet" flush="true"/>
            </div>

        </div>
       
    </body>
</html>
