<%@page import="Users.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <%-- <link rel="stylesheet" href="css/headeradmin.css"> --%>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <style>
            .header-dark {
                background-color: #343a40;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header-dark .navbar-nav .nav-link {
                color: #ffffff;
                transition: color 0.3s ease-in-out;
            }
            .header-dark .navbar-nav .nav-link:hover {
                color: #adb5bd;
            }
            .header-dark .navbar-toggler {
                border-color: rgba(255, 255, 255, 0.1);
            }
        </style>
    </head>
    <body>
        <header class="header-dark py-3">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between">
                    <img class="logo-admin" src="images/logo1.png" alt="logo" height="50">
                    <nav class="navbar navbar-expand-lg navbar-dark">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=list&keyword=Shirt">SHIRTS</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=list&keyword=Pant">PANTS</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=list&keyword=Accessory">ACCESSORIES</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=list&keyword=Perfume">PERFUME</a>
                                </li>
        
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=orderlist">ORDER</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?action=userlist">USER CONTROLLER</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <c:if test="${not empty usersession}">
                        <a href="./adminloginSucc.jsp" class="logicon"><img src="images/user1.png" alt="admin" class="rounded-circle" height="40"></a>
                    </c:if>
                </div>
            </div>
        </header>
        
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
