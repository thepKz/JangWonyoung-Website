<%-- 
    Document   : productadmindetail
    Created on : Mar 16, 2024, 1:16:16 PM
    Author     : ducco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="productadmin.jsp" %>
<body style="background-color: grey;">
    <div style="margin-left: 700px; margin-top:100px; padding: 30px; font-size: 30px; border: black 2px solid; display: inline-block; background-color: white;">
        <h1>User Detail </h1>
        <a href='admin?action=userlist'>User List</a> | <a href='login?action=logout'>Logout</a>
        <form action="admin"method="POST">
                <table style="font-size: 30px">


                    <tr><td>Username</td><td>${requestScope.users.username}</td></tr>
                    <tr><td>Password</td><td>${requestScope.users.password}</td></tr>
                    <tr><td>Mail</td><td>${requestScope.users.mail}</td></tr>
                    <tr><td>Status</td><td>${requestScope.users.status}</td></tr>	

                </table>


                <form action="admin">
                    <input type=hidden name="username" value="${requestScope.users.username}">
                    <input type=hidden name="action" value="user-edit">
                    <input style="justify-content: center;
                           font-size: 20px;
                           padding: 10px;
                           " type=submit value="Edit"></form>
            </form>
</body>
