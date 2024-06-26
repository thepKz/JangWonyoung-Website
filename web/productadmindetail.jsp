<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="productadmin.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <style>
            body {
                background-color: grey;
                font-family: 'Arial', sans-serif;
            }
            .product-detail-container {
                margin: 100px auto;
                padding: 30px;
                max-width: 700px;
                background-color: white;
                border: 2px solid black;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .product-detail-container h1 {
                font-size: 36px;
                margin-bottom: 20px;
                font-weight: bold;
                text-align: center;
            }
            .product-detail-container a {
                font-size: 18px;
                margin-right: 10px;
                display: inline-block;
            }
            .product-detail-container table {
                width: 100%;
                margin-bottom: 20px;
            }
            .product-detail-container table td {
                padding: 10px;
                font-size: 18px;
            }
            .product-detail-container .btn {
                font-size: 18px;
                padding: 10px;
                width: 100%;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="product-detail-container">
                <h1>Product Detail</h1>
                <div class="mb-3 text-center">
                    <a href='admin?action=list' class="btn btn-primary">Product List</a>
                    <a href='login?action=logout' class="btn btn-secondary">Logout</a>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <td>Id</td>
                        <td>${requestScope.products.id}</td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>${requestScope.products.name}</td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>${requestScope.products.price}</td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>${requestScope.products.category}</td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>${requestScope.products.amount}</td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td>${requestScope.products.color}</td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>${requestScope.products.type}</td>
                    </tr>
                    <tr>
                        <td>Size</td>
                        <td>${requestScope.products.size}</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>${requestScope.products.status}</td>
                    </tr>
                </table>
                <form action="admin" method="POST">
                    <input type="hidden" name="id" value="${requestScope.products.id}">
                    <input type="hidden" name="action" value="edit">
                    <input type="submit" value="Edit" class="btn btn-success">
                </form>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>