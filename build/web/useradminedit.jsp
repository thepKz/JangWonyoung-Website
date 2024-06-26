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
        <a href='admin?action=userlist'>User List</a> | <a href='login?action=logout'>Logout</a>
        <p>Login user: ${sessionScope.usersession.username}</p>
        <form action="admin" method="POST">              
            <table style="font-size: 30px">
                <tr><td>Username</td><td><input name="username" value="${requestScope.users.username}" required></td></tr>
                <tr><td>Password</td><td><input name="password" value="${requestScope.users.password}" required></td></tr>
                <tr><td>Mail</td><td><input name="mail" value="${requestScope.users.mail}" required></td></tr>
                <tr><td>Status</td><td><input name="status" value="${requestScope.users.status}" required></td></tr>
                      
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
