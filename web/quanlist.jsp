<%-- 
    Document   : productlist
    Created on : Mar 12, 2024, 11:07:09 PM
    Author     : ducco
--%>

<%@page import="java.util.List"%>
<%@page import="Products.QuanDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storee - Admin</title>
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<table>
    <%
        List<QuanDTO> list = (List<QuanDTO>) request.getAttribute("list");
        for (QuanDTO product : list) {
            pageContext.setAttribute("product", product);
    %>
    <tr>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.id}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.name}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.price}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.category}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.amount}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.color}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.type}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.size}</td>
        <td style="width: 150px; background-color: #ffffff; text-align: center; font-size: 25px;">${product.status}</td>



        <td><form action="QuanController" method="POST">
                <input name="action" value="delete" type="hidden">
                <input name="id" value="${product.id}" type="hidden">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <%
        }
    %>           
</table>
<br>
<form  action="QuanController" method="POST">
    <input name="action" value="create" type="hidden">
    <input class="button"  type="submit" value="Create">
</form>


