<%@page import="Order.OrderDTO"%>
<%@page import="OrderDetails.OrderDetailsDTO"%>
<%@page import="Products.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products - Storee
        </title>
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/adminlist.css">

        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    </head>

    <body>
        <%@ include file="/productadmin.jsp" %>
            <table style="margin: 10px 10px 10px 40px;  text-align: center; background-color: white" border>
                <tr class="adminlist">
                    <td  width="100px">Order ID</td>
                    <td  width="350px">Product ID</td>


                </tr>
                <%
                    List<OrderDetailsDTO> orderdetaillist = (List<OrderDetailsDTO>) request.getAttribute("orderdetaillist");
                    for (OrderDetailsDTO ordersdetails : orderdetaillist) {
                        pageContext.setAttribute("ordersdetails", ordersdetails);
                %>
                <tr>
                    <td>${ordersdetails.orderID} </td>
                    <td>${ordersdetails.productID}</td>
                </tr>
                <%
                    }
                %>   
    </body>

</html>
