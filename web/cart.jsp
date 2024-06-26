<%@page import="java.util.List"%>
<%@page import="Products.ProductsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storee - Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        /* CSS đã được tối ưu và điều chỉnh theo Bootstrap */
        body {
            font-family: 'Arial', sans-serif;
        }

        .bigcart {
            padding: 30px 0;
             margin-top: 50px;
        }

        .cart {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng nhẹ */
        }

        .product-image {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
        }

        .product-name {
            font-weight: 600;
        }

        .total-price {
            font-size: 1.2rem;
            font-weight: bold;
        }
.payment-methods label {
    display: flex; /* Sử dụng flexbox để căn chỉnh ảnh và text */
    align-items: center; /* Căn giữa theo chiều dọc */
    cursor: pointer;
}

.payment-icon {
    max-width: 50px; /* Giới hạn chiều rộng tối đa */
    height: auto;  /* Tự động điều chỉnh chiều cao */
    margin-right: 10px; /* Khoảng cách giữa ảnh và text */
}

    </style>
</head>

<body>
    <%@include file="header.jsp" %>

    <div class="container bigcart">
        <form class="cart" action="./user" method="POST" id="orderForm" onsubmit="return validatePhone()"> 
            <div class="row">
                <div class="col-md-6">
                    <h1 class="mb-3">Shipping Information</h1>
                    <div class="form-group">
                        <input class="form-control" type="text" id="username" name="username" placeholder="Fullname" size="40" required>
                        <div id="usernameError" class="invalid-feedback">Please enter your full name.</div>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" id="phone" name="phone" placeholder="Phone" size="40" required>
                        <div id="phoneError" class="invalid-feedback">Please enter a valid phone number.</div>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" id="address" name="address" placeholder="Address (Ex: 103 Van Phuc)" size="40" required>
                        <div id="addressError" class="invalid-feedback">Please enter your address.</div>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="notes" placeholder="Notes" size="40">
                    </div>
                    <hr>
                    <h1 class="mb-3">Payment Method</h1>
                    <ul class="list-unstyled d-flex payment-methods">
                        <li class="mr-3">
                            <label for="cb1">
                                <img src="images/cod.png" alt="Cash on Delivery" class="payment-icon">
                                Cash on Delivery
                            </label>
                            <input type="radio" name="payment" id="cb1" value="cod" checked/>
                        </li>
                        <li class="mr-3">
                            <label for="cb2">
                                <img src="images/momo.png" alt="MoMo" class="payment-icon">
                                MoMo
                            </label>
                            <input type="radio" name="payment" id="cb2" value="mm"/>
                        </li>
                        <li>
                            <label for="cb3">
                                <img src="images/qr.jpg" alt="QR Code" class="payment-icon">
                                QR Code
                            </label>
                            <input type="radio" name="payment" id="cb3" value="qr"/>
                        </li>
                    </ul>
                </div>

                <div class="col-md-6">
                    <h1 class="mb-3">Cart</h1>
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int totalPrice = 0;
                                int shippingCost = 50; 
                                List<ProductsDTO> listcart = (List<ProductsDTO>) request.getAttribute("cartlist");

                                if (listcart != null && !listcart.isEmpty()) {
                                    for (ProductsDTO product : listcart) {
                                        pageContext.setAttribute("product", product);
                                        totalPrice += product.getPrice();
                            %>

                                <tr>
                                    <td style="vertical-align: middle;"> 
                                        <div class="d-flex align-items-center">
                                            <img src="${product.picture}" alt="${product.name}" class="product-image mr-3">
                                            <div>
                                                <h5 class="product-name mb-0">${product.name}</h5>
                                                <p class="text-muted mb-0">${product.color} / ${product.size}</p>
                                            </div>
                                        </div>
                                        <input name="name" value="${product.name}" hidden>
                                        <input name="color" value="${product.color}" hidden>
                                        <input name="size" value="${product.size}" hidden>
                                    </td>
                                    <td style="vertical-align: middle;">
                                        <input type="number" class="form-control quantity-input" value="1" min="1" data-price="${product.price}">
                                    </td>
                                    <td style="vertical-align: middle;" class="item-price">$${product.price}</td> 
                                </tr>
                            <%
                                    } // End of for loop
                                }
                            %>

                            <% if (listcart != null && !listcart.isEmpty()) { %>
                                <div class="mt-3"> 
                                    <div class="d-flex justify-content-between">
                                        <h3>Subtotal:</h3> 
                                        <span class="total-price">$<span id="subtotal"><%= totalPrice %></span></span>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <h3>Shipping:</h3>
                                        <span class="total-price">$<span id="shipping"><%= shippingCost %></span></span> 
                                    </div>

                                    <hr>
                                    <div class="d-flex justify-content-between">
                                        <h2>Total:</h2>
                                        <span class="total-price">$<span id="finalPrice"><%= totalPrice + shippingCost %></span></span> 
                                    </div>

                                    <input name="totalPrice" value="<%= totalPrice + shippingCost %>" hidden>
                                    <input name="action" value="order" hidden>
                                    <p id="phoneError"></p>
                                    <button class="btn btn-primary btn-block mt-3 ttoan" type="submit">ORDER</button>
                                </div> 
                            <% } else { %> 
                                <tr>
                                    <td colspan="4" class="text-center" style="vertical-align: middle;">Your cart is empty.</td>
                                </tr>
                            <% } %> 
                        </tbody>
                    </table>
                </div>
            </div> 
        </form>
    </div>



    <script>
  // JavaScript để xác thực các trường input và xử lý giỏ hàng
document.addEventListener('DOMContentLoaded', () => {
    const usernameInput = document.getElementById('username');
    const phoneInput = document.getElementById('phone');
    const addressInput = document.getElementById('address');
    const phoneError = document.getElementById('phoneError');

    // Validate form before submitting
    document.querySelector('.cart').addEventListener('submit', (event) => {
        let isValid = true;

        if (usernameInput.value.trim() === '') {
            showError(usernameInput, 'usernameError');
            isValid = false;
        } else {
            hideError(usernameInput, 'usernameError');
        }

        // Validate phone number
        const phoneRegex = /^\d+$/; 
        if (!phoneRegex.test(phoneInput.value.trim())) {
            phoneError.textContent = 'Please enter a valid phone number (only digits).';
            phoneError.style.color = 'red'; // Đổi màu thông báo lỗi
            isValid = false;
        } else {
            phoneError.textContent = ''; // Xóa thông báo lỗi nếu hợp lệ
        }

        if (addressInput.value.trim() === '') {
            showError(addressInput, 'addressError');
            isValid = false;
        } else {
            hideError(addressInput, 'addressError');
        }

        if (!isValid) {
            event.preventDefault(); 
        }
    });

    const quantityInputs = document.querySelectorAll('.quantity-input');
    const subtotalElement = document.getElementById('subtotal');
    const shippingElement = document.getElementById('shipping');
    const finalPriceElement = document.getElementById('finalPrice');
    const totalPriceInput = document.querySelector('input[name="totalPrice"]');

    quantityInputs.forEach(input => {
        input.addEventListener('change', updateTotalPrice);
    });

    function updateTotalPrice() {
        let subtotal = 0;
        quantityInputs.forEach(input => {
            const price = parseFloat(input.dataset.price);
            const quantity = parseInt(input.value);
            subtotal += price * quantity;
        });

        // Adjust shipping cost calculation as needed
        let shippingCost = subtotal > 100 ? 0 : 10;
        let totalPrice = subtotal + shippingCost;

        // Round totalPrice to the nearest integer
        totalPrice = Math.round(totalPrice);

        // Ensure totalPrice is positive
        if (totalPrice <= 0) {
            alert("Total price must be greater than 0.");
            return; // Prevent further execution
        }

        subtotalElement.textContent = subtotal.toFixed(2);
        shippingElement.textContent = shippingCost.toFixed(2);
        finalPriceElement.textContent = totalPrice; // Display as integer
        totalPriceInput.value = totalPrice; // Update hidden input as integer
    }

    updateTotalPrice(); // Initial calculation o
});

    </script>

    <%@include file="footer.jsp" %>
</body>

</html>
