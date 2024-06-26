<%@page import="Users.UserDTO"%>
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
    <title>Products - Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/adminlist.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 20px;
        }

        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .table-container h2 {
            margin-bottom: 20px;
        }

        .btn-create {
            display: block;
            margin: 20px auto;
            width: 200px;
        }
    </style>
</head>

<body>
    <%@ include file="/productadmin.jsp" %>
    <div class="container">
        <c:if test="${not empty list}">
            <div class="table-container">
                <h2>Product List</h2>
                <table class="table table-striped table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Amount</th>
                            <th>Color</th>
                            <th>Type</th>
                            <th>Size</th>
                            <th>Status</th>
                            <th>Picture</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("list");
                            for (ProductsDTO products : list) {
                                pageContext.setAttribute("products", products);
                        %>
                        <tr>
                            <td>${products.id}</td>
                            <td>${products.name}</td>
                            <td>${products.price}</td>
                            <td>${products.category}</td>
                            <td>${products.amount}</td>
                            <td>${products.color}</td>
                            <td>${products.type}</td>
                            <td>${products.size}</td>
                            <td>${products.status}</td>
                            <td>${products.picture}</td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="edit" type="hidden">
                                    <input name="id" value="${products.id}" type="hidden">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </form>
                            </td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${products.id}" type="hidden">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <form action="admin" method="POST">
                    <input name="action" value="create" type="hidden">
                    <button type="submit" class="btn btn-success btn-create">Create New Product</button>
                </form>
            </div>
        </c:if>

        

        <c:if test="${not empty orderlist}">
            <div class="table-container">
                <h2>Order List</h2>
                <table class="table table-striped table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Total Price</th>
                            <th>Detail</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<OrderDTO> orderlist = (List<OrderDTO>) request.getAttribute("orderlist");
                            for (OrderDTO orders : orderlist) {
                                pageContext.setAttribute("orders", orders);
                        %>
                        <tr>
                            <td>${orders.id}</td>
                            <td>${orders.userID}</td>
                            <td>${orders.address}</td>
                            <td>${orders.phone}</td>
                            <td>${orders.status}</td>
                            <td>${orders.totalPrice}</td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="order-admin-detail" type="hidden">
                                    <input name="id" value="${orders.id}" type="hidden">
                                    <button type="submit" class="btn btn-info">Detail</button>
                                </form>
                            </td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="order-edit" type="hidden">
                                    <input name="id" value="${orders.id}" type="hidden">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${not empty userlist}">
            <div class="table-container">
                <h2>User List</h2>
                <table class="table table-striped table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Mail</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<UserDTO> userlist = (List<UserDTO>) request.getAttribute("userlist");
                            for (UserDTO users : userlist) {
                                pageContext.setAttribute("users", users);
                        %>
                        <tr>
                            <td>${users.username}</td>
                            <td>${users.password}</td>
                            <td>${users.mail}</td>
                            <td>${users.status}</td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="user-edit" type="hidden">
                                    <input name="username" value="${users.username}" type="hidden">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </form>
                            </td>
                            <td>
                                <form action="admin" method="POST">
                                    <input name="action" value="user-delete" type="hidden">
                                    <input name="username" value="${users.username}" type="hidden">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <form action="admin" method="POST">
                    <input name="action" value="user-create" type="hidden">
                    <button type="submit" class="btn btn-success btn-create">Create New User</button>
                </form>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
