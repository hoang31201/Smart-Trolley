<%-- 
    Document   : AccountScreen
    Created on : 24/09/2021, 1:07:36 PM
    Author     : quyda
--%>

<%@page import="uts.asd.controller.Validator"%>
<%@page import="uts.asd.model.Staff"%>
<%@page import="uts.asd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Account screen to display all details of customer or staff -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/button.css">
        <link rel="stylesheet" href="./css/warning.css">
        <title>Account</title>
        <jsp:include page="/ConnServlet" flush="true"/>
    </head>
    <!-- get the type of the account and clear all error message first -->
    <%
        Validator validate = new Validator();
        Customer customer = (Customer) session.getAttribute("customer");
        Staff staff = (Staff) session.getAttribute("staff");
        session.setAttribute("passUpdate", "");
        String idErr = (String) session.getAttribute("idErr");
        validate.clear(session);

    %>
    <body>
        <div class="header">
            <div class="header-right">
            </div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp"><h3>Home</h3></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="hardware.jsp"><h3>Hardware Details</h3></a>
                        </li>
                        <li>
                            <div class="position-absolute top-0 end-0">
                                <form action="AccountLogoutServlet">
                                    <button type="submit"  class="btn btn-danger">Log Out</button>
                                </form>
                            </div>
                        </li>
                        <li><!-- Pass the data to the create payment page-->
                            <form action="CreatePayment.jsp">
                                <%session.setAttribute("customer", customer);%>
                                <body onload = "check()">
                                    <button class="btn btn-light" type="submit" id="submit" ><h3>Create Payment</h3></button>
                            </form>
                        </li>
                        <li><!-- Go to view payment page -->
                            <form action="Viewpayment.jsp">
                                <%session.setAttribute("customer", customer);%>
                                <button class="btn btn-light" type="submit"><h3>View Payment</h3></button>

                            </form>
                        </li>
                        <li><!-- Go to product page -->
                            <form action="index.jsp">
                                <%session.setAttribute("customer", customer);%>
                                <button class="btn btn-light" type="submit"><h3>Product</h3></button>
                            </form>
                        </li>
                        <li><!-- Go to payment page -->
                            <form action="Payment.jsp">
                                <%session.setAttribute("customer", customer);%>
                                <button class="btn btn-light" type="submit"><h3>Make Payment</h3></button>
                            </form>
                        </li>
                        <li><!-- Go to show payment history page -->
                            <form action="PaymentHistoryServlet" method="post">
                                <%session.setAttribute("customer", customer);%>
                                <button class="btn btn-light" type="submit"><h3>Show Payment History</h3></button>
                            </form>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <%if (customer != null) {%>
        <div style="padding-left:20px">
            <h1>Customer Profile</h1>
            <p><span class="tag">Customer ID: </span> ${customer.customerID}</p>
            <p><span class="tag">NAME: </span> <%=customer.getCustomerFName() + " " + customer.getCustomerLName()%></p>
            <p><span class="tag">EMAIL: </span> ${customer.customerEmail}</p>
            <%String password = customer.getCustomerPassword();%>
            <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
            <p><span class="tag">PHONE: </span> ${customer.customerPhoneNum}</p>
            <p><span class="tag">ADDRESS: </span> ${customer.customerAddress}</p>
            <p><span class="tag">DATE OF BIRTH: </span> ${customer.customerDOB}</p>
            <p><span class="tag">Award Point: </span> ${customer.customerPoint}</p>
        </div>
        <div>
            <table>
                <tr>
                    <td> <!-- lead to update details screen -->
                        <form action="UpdateScreen.jsp" method="post">
                            <%session.setAttribute("customer", customer);
                                session.setAttribute("staff", null);
                                session.setAttribute("existErr", "");
                            %>
                            <button type="submit" class="btn btn-success">Update Details</button>
                        </form>
                    </td>
                    <td><!-- lead to update password screen -->
                        <form method="post" action="PassUpdateScreen.jsp">
                            <%session.setAttribute("customer", customer);
                                session.setAttribute("staff", null);
                            %>
                            <button type="submit" class="btn btn-warning">Change Password</button>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div class="position-fixed bottom-0 end-0"><!-- delete account -->
            <form action="AccountDeleteServlet" method="post">
                <%session.setAttribute("customer", customer);
                    session.setAttribute("staff", null);
                %>
                <input class="btn btn-danger"  name="delete" type="submit" value="Delete">
            </form>
        </div>
        <%} else if (staff != null) {%>
        <div style="padding-left:20px">
            <h1>Staff Profile</h1> 
            <form action="FindCustomerServlet" method="post" >
                <div class="container.container-fluid">
                    <div class="row">
                        <div class="col-sm">
                            <span class="tag">Staff ID: </span> ${staff.staffID} 
                        </div>
                        <div class="col-sm" style="padding-left:50%">    
                            <%if (idErr.equals("idErr")) {%>
                            <button class="btn btn-success" type="submit">Find</button><input type="text" class="errorField" name="customerID" placeholder="Invalid format!">
                            <%} else if (idErr.equals("notFound")) {%>
                            <button class="btn btn-success" type="submit">Find</button><input type="text" class="errorField" name="customerID" placeholder="Account Not Found!" >
                            <%} else {%>
                            <button class="btn btn-success" type="submit">Find</button><input type="text" name="customerID">
                            <%}%>
                        </div>
                    </div>
                </div>
            </form>  
            <p><span class="tag">NAME: </span> <%=staff.getStaffFName() + " " + staff.getStaffLName()%></p>
            <p><span class="tag">EMAIL: </span> ${staff.staffEmail}</p>
            <%String password = staff.getStaffPassword();%>
            <p><span class="tag">PASSWORD: </span><%=password.substring(0, 2) + "***" + password.substring(password.length() - 2, password.length())%></p>
            <p><span class="tag">PHONE: </span> ${staff.staffPhoneNum}</p>
            <p><span class="tag">ADDRESS: </span> ${staff.staffAddress}</p>
            <p><span class="tag">DATE OF BIRTH: </span> ${staff.staffDOB}</p>
            <p><span class="tag">Role: </span> ${staff.staffRole}</p> 
        </div>
        <div>
            <table>
                <tr>
                    <td><!-- lead to update details screen -->
                        <form action="UpdateScreen.jsp" method="post">
                            <%session.setAttribute("staff", staff);
                                session.setAttribute("customer", null);
                                session.setAttribute("existErr", "");
                            %>
                            <button class="btn btn-success" type="submit">Update Details</button>          
                        </form>
                    </td>
                    <td><!-- lead to staff create screen -->
                        <form action="StaffRegisterScreen.jsp">
                            <input class="btn btn-success" type="submit" value="Staff Register" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td><!-- lead to update password screen -->
                        <form method="post" action="PassUpdateScreen.jsp">
                            <%session.setAttribute("staff", staff);
                                session.setAttribute("customer", null);
                            %>
                            <button class="btn btn-warning" type="submit">Change Password</button>
                        </form>
                    </td>
                </tr>                                            
            </table>        
        </div>    
        <div class="position-fixed bottom-0 end-0"><!-- Delete account -->
            <form action="AccountDeleteServlet" method="post">
                <%session.setAttribute("staff", staff);
                    session.setAttribute("customer", null);
                %>
                <input class="btn btn-danger" name="delete" type="submit"  value="Delete">
            </form>           
        </div>           
        <%}%>
    </body>
</html>
