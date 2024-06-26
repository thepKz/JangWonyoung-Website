<%@page import="Users.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
    <header class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
        <div class="container-fluid"> <%-- Fluid container for better responsiveness --%>
            <a href="./home.jsp" class="navbar-brand logo">
                <img src="images/logo1.png" alt="logo">
            </a>
            <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="./home.jsp">HOME</a></li>
                    <li class="nav-item"><a class="nav-link" href="user?action=list&keyword=Shirt">SHIRTS</a></li>
                    <li class="nav-item"><a class="nav-link" href="user?action=list&keyword=Pant">PANTS</a></li>
                    <li class="nav-item"><a class="nav-link" href="user?action=list&keyword=Accessory">ACCESORIES</a></li>
                    <li class="nav-item"><a class="nav-link" href="user?action=list&keyword=Perfume">PERFUME</a></li>
                </ul>
                
                <form action="user" method="GET" class="d-flex">
                    <div class="input-group">
                        <span class="input-group-text material-symbols-outlined">search</span>
                        <input class="form-control" type="search" name="keyword" placeholder="Search products...">
                    </div>
                    <button class="btn btn-primary btn-sm ms-2" type="submit" name="action" value="search">Search</button>
                </form>

                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${empty usersession}">
                            <li class="nav-item"><a class="nav-link" href="./login.jsp"><span class="material-symbols-outlined">person</span></a></li>
                            <li class="nav-item"><a class="nav-link" href="user?action=showcart"><span class="material-symbols-outlined">shopping_cart</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="./loginSucc.jsp"><span class="material-symbols-outlined">person</span></a></li>
                            <li class="nav-item"><a class="nav-link" href="user?action=showcart"><span class="material-symbols-outlined">shopping_cart</span></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </header>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const navbarToggler = document.querySelector('.custom-toggler');
    const navbarCollapse = document.querySelector('.navbar-collapse');

    navbarToggler.addEventListener('click', function () {
        if (navbarCollapse.classList.contains('show')) {
            navbarCollapse.classList.remove('show');
        } else {
            navbarCollapse.classList.add('show');
        }

        // Trigger Bootstrap's event for smooth collapse animation
        const bsCollapseEvent = new Event('hidden.bs.collapse');
        navbarCollapse.dispatchEvent(bsCollapseEvent);
    });
</script>


    </body>
</html>