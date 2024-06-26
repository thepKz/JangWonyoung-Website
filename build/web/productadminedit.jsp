<%-- 
    Document   : productedit
    Created on : Mar 12, 2024, 9:00:31 AM
    Author     : ducco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="productadmin.jsp" %>
    <body style="background-color: grey;">
        <div style="margin-left: 700px; margin-top:100px; padding: 30px; font-size: 30px; border: black 2px solid; display: inline-block; background-color: white;">
        <h1>Products Edit </h1>
        <a href='admin?action=list'>Product List</a> | <a href='login?action=logout'>Logout</a>
        <p>Login user: ${sessionScope.usersession.username}</p>
        <form action="admin" method="POST">              
            <table style="font-size: 30px">
                <tr><td>ID</td><td><input name="id" value="${requestScope.products.id}" required></td></tr>
                <tr><td>Name</td><td><input name="name" value="${requestScope.products.name}" required></td></tr>
                <tr><td>Price</td><td><input name="price" value="${requestScope.products.price}" required></td></tr>
                <tr><td>Category</td><td><input name="category" value="${requestScope.products.category}" required></td></tr>
                <tr><td>Amount</td><td><input name="amount" value="${requestScope.products.amount}" required></td></tr>
                <tr><td>Color</td><td><input name="color" value="${requestScope.products.color}" required></td></tr>
                <tr><td>Type</td><td><input name="type" value="${requestScope.products.type}" required></td></tr>
                <tr><td>Size</td><td><input name="size" value="${requestScope.products.size}" required></td></tr>
                <tr><td>Status</td><td><input name="status" value="${requestScope.products.status}" required></td></tr>
                <tr><td>Picture</td><td><input name="status" value="${requestScope.products.picture}" required></td></tr>

                      
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input style="justify-content: center;
               font-size: 20px;
               padding: 10px;
               " type="submit" value="Save">
                    </td></tr>
            </table>
        </form>
    </body>
</html>
