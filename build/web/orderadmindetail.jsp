<%-- 
    Document   : productadmindetail
    Created on : Mar 16, 2024, 1:16:16 PM
    Author     : ducco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="productadmin.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: grey;
            }
            .order-detail-container {
                margin: 100px auto;
                padding: 30px;
                font-size: 20px;
                border: 2px solid black;
                background-color: white;
                max-width: 600px;
                border-radius: 10px;
            }
            .order-detail-container h1 {
                font-size: 36px;
                margin-bottom: 20px;
            }
            .order-detail-container a {
                font-size: 18px;
                margin-right: 10px;
            }
            .order-detail-container table {
                width: 100%;
            }
            .order-detail-container table td {
                padding: 10px 0;
            }
            .order-detail-container form input[type="submit"] {
                font-size: 20px;
                padding: 10px;
                width: 100%;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="order-detail-container">
            <h1>Order Detail</h1>
            <div class="mb-3">
                <a href='admin?action=orderlist' class="btn btn-primary">Order List</a>
                <a href='login?action=logout' class="btn btn-secondary">Logout</a>
            </div>
            <table class="table table-bordered">
                <tr>
                    <td>Id</td>
                    <td>${requestScope.orders.id}</td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td>${requestScope.orders.userID}</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>${requestScope.orders.address}</td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>${requestScope.orders.phone}</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>${requestScope.orders.status}</td>
                </tr>
                <tr>
                    <td>Total Price</td>
                    <td>${requestScope.orders.totalPrice}</td>
                </tr>
            </table>
            <form action="admin" method="POST">
                <input type="hidden" name="id" value="${requestScope.orders.id}">
                <input type="hidden" name="action" value="order-edit">
                <input type="submit" value="Edit" class="btn btn-success">
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
