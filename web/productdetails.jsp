<%@page import="Products.ProductsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product - Storee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <style>
          body {
            background-color: #fffdf5; /* Creamy white background */
            font-family: 'Playfair Display', serif; /* Elegant serif font */
        }

        .imgdetails img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle image shadow */
        }

        .details h1 {
            color: #333; /* Darker text for contrast */
        }

        .star {
            color: #d4af37; /* Gold color */
        }

        .color-swatch {
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-right: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
            border-radius: 50%; /* Make the swatches circular */
        }

        .submitbutt {
            background-color: #990000; /* Rich red */
            border: none;
        }

        .submitbutt:hover {
            background-color: #660000; /* Darker red on hover */
        }

        .details-prod h3 {
            color: #555; /* Medium gray */
        }

        .details-prod li {
            list-style: disc;
            margin-left: 20px;
        }
        /* Feedback Section Styling */
        .feedbackall {
            background-color: #fff; /* White background for the feedback area */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle box shadow for depth */
        }

        .feedback-list { /* Style the area where feedback comments will appear */
            max-height: 300px; /* Limit height to prevent content overflow */
            overflow-y: auto;  /* Add a scrollbar if content exceeds the height */
        }
    </style>
</head>

<body>
    <%@include file="header.jsp" %>
    
    <div class="container mt-5" style="margin-top: 100px;"> 
        <div class="row " style="margin-top: 100px;">
            <div class="col-md-6"> 
                <div class="imgdetails">
                    <img src="${product.picture}" alt="">
                </div>
            </div>
            <div class="col-md-6 details">
                <form action="./user" method="POST">
                    <h1>${product.name}</h1>
                    <p class="rating">
                        <% for (int i = 0; i < 5; i++) { %> 
                            <i class="star material-symbols-outlined">star</i>
                        <% } %>
                    </p>
                    <h2> $ ${product.price}</h2>
                    <div class="form-group">
                        <label for="color-select">Color:</label>
                        <select name="color" id="color-select" class="form-select">
                            <option value="black" style="background-color: black; color: white;">Black</option>
                            <option value="gray" style="background-color: gray;">Gray</option>
                            </select>
                    </div>
                    <div class="form-group mt-3">
                        <label for="size">Size:</label>
                        <select name="size" class="form-select">
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                            </select>
                    </div>
                    <div class="form-group mt-3">
                        <label for="amount">Amount:</label>
                        <input class="form-control" name="amount" type="number" value="1" min="1" required>
                    </div>

                    <input name="action" value="addcart" type="hidden">
                    <input name="id" value="${product.id}" type="hidden">

                    <button class="btn btn-primary mt-3 submitbutt" type="submit">ADD TO CART</button>
                </form>
                <hr>
                <div class="details-prod">
                    <h3>Đặc Điểm Nổi Bật</h3>
                    <ul>
                        <li>Thành phần: 100% cotton</li>
                        <li>Hạn chế xù lông và chống nhăn</li>
                        <li>Form áo: Regular, ôm nhẹ</li>
                        <li>Sản xuất tại Mỹ</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-bottom: 100px;"></div>
    

    <%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="css/size.js"></script> 
    <script>
        const colorSelect = document.getElementById('color-select');
        colorSelect.addEventListener('change', function () {
            this.style.backgroundColor = this.value;
            this.style.color = this.value === 'black' ? 'white' : 'black'; // Adjust text color for visibility
        });
    </script>
</body>
</html>
