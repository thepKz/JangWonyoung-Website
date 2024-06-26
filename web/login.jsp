<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Log In - Storee</title>
        <link rel="stylesheet" href="css/log.css">
        <style>
        .error-message {
            color: red;
            text-align: center;
            margin: 10px 0;
        }
        #wrap {
    min-height: 100%; /* Ensure it's at least the full viewport height */
    display: flex;     /* Use flexbox for easy alignment */
    flex-direction: column; /* Stack content vertically */
}
        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div id="wrap">
        <section>
            <form action="./login" method="post">
                <h1>Login</h1>
                

                <div class="inputbox">
                    <ion-icon name="text-outline"></ion-icon>
                    <input type="text" name="username"  required>
                    <label for="username">UserName</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password"name="password" required>
                    <label for="password">Password</label>
                </div>
                <div class="forget">
                    <label for=""><input type="checkbox">Remember Me</label>
                    <a href="register.jsp">Forget Password</a>
                </div>
                <div class="error-message">
                    <% if (request.getAttribute("errorMessage") != null) { %>
                        Error: <%= request.getAttribute("errorMessage") %><br/>
                    <% } %>
                </div>
                <button type="submit" value="Login">Login</button>
                <div class="register">
                    <p>Don't have a account <a href="register.jsp">Register</a></p>
                </div>
            </form>
        </section>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    


        
    </body>

</html>



