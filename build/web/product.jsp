<%-- // This is Product.jsp --%>
<%@page import="Products.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products - Storee
        </title>
        <link rel="stylesheet" href="css/prrrr.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <style>
            body {
                font-family: 'Arial', sans-serif; 
                background-color: #F8F4EA; /* A warm off-white */
            }
            .product-card {
                background-color: #F8F4EA; /* A warm off-white */
                border-radius: 8px;        /* Rounded corners */
                overflow: hidden;         /* Hide overflowing content (like shadows) */
                border: none; /* A subtle white border */ /* Remove default bootstrap border */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Adjust values as needed */ /* Subtle shadow for depth */
                transition: transform 0.3s ease; /* Smooth hover effect */
            }
            .product-card:hover .product-overlay {
                opacity: 0.8; /* Slightly more transparent */
            }
            .product-card:hover {
                transform: translateY(-5px); /* Slight lift on hover */
            }

            .product-image-container {
                aspect-ratio: 4/3;
                position: relative;
                overflow: hidden; /* Hide overlay when not hovered */
            }

            .product-image {
                width: 100%;
                height: auto;
                transition: transform 0.3s ease; /* Image zoom effect */
            }

            .product-card:hover .product-image {
                transform: scale(1.1);
            }

            .product-overlay {
                background: linear-gradient(45deg, rgba(255,255,255,0.3), rgba(255,255,255,0)); /* Subtle gradient */
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6); /* Dark overlay */
                display: flex;
                justify-content: center;
                align-items: center;
                opacity: 0; /* Hidden by default */
                transition: opacity 0.3s ease; /* Smooth fade-in */
            }

            .product-card:hover .product-overlay {
                opacity: 1;
            }

            .product-info {
                padding: 15px;
            }

            .product-name {
                font-family: 'Playfair Display', serif; /* Use your elegant font */
                margin-bottom: 5px;
            }

            .product-price {
                font-weight: 500;
            }
    </style>
    </head>

    <body>
    <%@include file="header.jsp" %>

    <div class="container mt-5">
        <div class="row" style="margin-top: 100px;">
            <%
                List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("list");
                for (ProductsDTO product : list) {
                    pageContext.setAttribute("product", product);
            %>
                <div class="col-md-4 col-lg-3 mb-4"> 
                    <div class="product-card">
                        <div class="product-image-container">
                            <a href="user?action=details&id=${product.id}"> 
                                <img src="${product.picture}" class="img-fluid product-image" alt="${product.name}">
                            </a>
                            <div class="product-overlay">
                                <a href="user?action=details&id=${product.id}" class="btn btn-outline-light btn-sm">View Details</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h5 class="product-name">${product.name}</h5>
                            <p class="product-price">$ ${product.price}</p>
                            <p class="text-muted mb-0">Size: ${product.size}</p> 
                            <p class="text-muted mb-0">Stock: ${product.amount}</p>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <%@include file="footer.jsp" %>
</body>


</html>
