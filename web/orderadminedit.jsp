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
        <h1>Order Edit </h1>
        <a href='admin?action=orderlist'>Order List</a> | <a href='login?action=logout'>Logout</a>
        <p>Login user: ${sessionScope.usersession.username}</p>
        <form action="admin" method="POST">              
            <table style="font-size: 30px">
                <tr><td>ID</td><td><input name="id" value="${requestScope.orders.id}" required></td></tr>
                <tr><td>User ID</td><td><input name="userID" value="${requestScope.orders.userID}" required></td></tr>
                <tr><td>Address</td><td><input name="address" value="${requestScope.orders.address}" required></td></tr>
                <tr><td>Phone</td><td><input name="phone" value="${requestScope.orders.phone}" required></td></tr>
                <tr><td>Status</td><td><input name="status" value="${requestScope.orders.status}" required></td></tr>
                <tr><td>Total Price</td><td><input name="totalPrice" value="${requestScope.orders.totalPrice}" required></td></tr>


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
