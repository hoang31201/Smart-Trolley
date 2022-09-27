<%-- 
    Document   : hardware
    Created on : 28/10/2021, 11:33:43 PM
    Author     : clint
--%>

<%@page import="uts.asd.model.Customer"%>
<%@page import="uts.asd.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Validator validate = new Validator();
    validate.clear(session);
    Customer user = (Customer) session.getAttribute("user");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/button.css">
        <link rel="stylesheet" href="./css/warning.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./header.jsp"%>
        <title>Hardware details</title
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp"><h3>Home</h3></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="AccountScreen.jsp"><h3>Profile</h3></a>
                    </li>
                    <li>
                        <div class="position-absolute top-0 end-0">
                            <form action="AccountLogoutServlet">
                                <button type="submit"  class="btn btn-danger">Log Out</button>
                            </form>
                        </div>
                    </li>
                </ul>   
            </div>
        </nav>        

        <table class="table">
            <thead>
                <tr>
                    <th scope="col" style="width:10%"></th>
                    <th scope="col" style="width:25%">Parts and Accessories</th>
                    <th scope="col" style="width:65%">Information</th>                
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">Cart Wheels</th>
                    <td>
                        <h3>5" Super Wheel</h3>
                        <img src="image/wheel.jpg" alt="Wheels" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Wheel Diameter</dt>
                            <dd>5 inch</dd>
                            <dt>Tread Width</dt>
                            <dd>1.25 inch</dd>
                            <dt>Hub Width</dt>
                            <dd>1.6 inch</dd>
                            <dt>Color</dt>
                            <dd>Blue tread,  Gray hub, Blue thread guard</dd>
                            <dt>Weight</dt>
                            <dd>.8 pounds</dd>
                            <dt>Weight Capacity</dt>
                            <dd>250 pounds</dd>
                            <dt>Axle Size</dt>
                            <dd>5/16" - 18 X 2.25" keyed hex head, zinc plated</dd>
                            <dt>Lock Nut</dt>
                            <dd>5/16" - 18 nylon lock nut</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>Manufacturer 1 year limited material and workmanship</dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <th scope="row">Child Safety Belt</th>
                    <td>
                        <h3>Standard Safety Belt</h3>
                        <img src="image/belt.jpg" alt="Belt" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Strap Webbing</dt>
                            <dd>Polypropylene</dd>
                            <dt>Strap Width</dt>
                            <dd>1 inch</dd>
                            <dt>Fastener</dt>
                            <dd>Quick Click no-tool fastener</dd>
                            <dt>Color</dt>
                            <dd>Black</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>Manufacturer 1 year limited material and workmanship</dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <th scope="row">Child Safety Dock</th>
                    <td>
                        <h3>Safe-Dock</h3>
                        <img src="image/dock.jpg" alt="Dock" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Construction</dt>
                            <dd>Steel powder coated frame, deep contoured shape, durable non-toxic Polypropylene material</dd>
                            <dt>Features</dt>
                            <dd>Works with all infant seat carriers, safety graphics, simple installation, meets all applicable standards and regulations, allows carts to nest together for storage</dd>
                            <dt>Harness</dt>
                            <dd>Heavy duty nylon webbing, nylon child resistant buckle</dd>
                            <dt>Mounting Type</dt>
                            <dd>Two U bolts permanently attach frame to closed back gate of cart</dd>
                            <dt>Color</dt>
                            <dd>Gray</dd>
                            <dt>Weight Capacity</dt>
                            <dd>Up to 50 pounds</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>Manufacturer 1 year limited material and workmanship</dd>
                        </dl>
                    </td>
                </tr>                
                <tr>
                    <th scope="row">Cart Handles</th>
                    <td>
                        <h3>Snap-On 4 Peg</h3>
                        <img src="image/handle.jpg" alt="Handles" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Style</dt>
                            <dd>C-Shape Snap-On Plastic Handle</dd>
                            <dt>Diameter</dt>
                            <dd>Works with 7/8" &amp; 1" diameter handles</dd>
                            <dt>Alignment</dt>
                            <dd>2 inner pegs, 2 outer pegs</dd>
                            <dt>Length Options</dt>
                            <dd>13.75 inch</dd>
                            <dt>Color</dt>
                            <dd>Black</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>n/a</dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <th scope="row">Cart Leg Hole Closures</th>
                    <td>
                        <h3>Unarco</h3>
                        <img src="image/closure.jpg" alt="Closure" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Print</dt>
                            <dd>ASTM F2372 Safety Logo on top side</dd>
                            <dt>Size</dt>
                            <dd>10" Wide, 6" High</dd>
                            <dt>Attachment</dt>
                            <dd>Snaps on over mounting wire</dd>
                            <dt>Color</dt>
                            <dd>Dk Green</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>n/a</dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <th scope="row">POS</th>
                    <td>
                        <h3>POS Terminal</h3>
                        <img src="image/POS.png" alt="POS" width="300" height="300">
                    </td>
                    <td>
                        <dl>
                            <dt>Model</dt>
                            <dd>SM-T870</dd>
                            <dt>Size</dt>
                            <dd>11.0 inches, 350.9 cm2 (~83.6% screen-to-body ratio)</dd>
                            <dt>Camera</dt>
                            <dd>13 MP, f/2.0, 26mm (wide), 1/3.4", 1.0µm, AF</dd>
                            <dt>Color</dt>
                            <dd>Mystic Black</dd>
                            <dt>Received Date</dt>
                            <dd>20-10-2021</dd>
                            <dt>Warranty</dt>
                            <dd>Manufacturer 1 year warranty</dd>
                        </dl>
                    </td>
                </tr>
            </tbody>
        </table>

        <%@include file="./footer.jsp"%>
    </body>
</html>
