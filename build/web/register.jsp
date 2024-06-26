<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Storee - Register</title>
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <script>
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var message = document.getElementById("message");
                if (username.includes(" ")) {
                    message.style.color = "red";
                    message.innerHTML = "No space in UserName!";
                    return false;
                }
                if (password != confirmPassword && confirmPassword !="") {
                    message.style.color = "red";
                    message.innerHTML = "Passwords do not match.";
                    return false;
                } else if (confirmPassword !=""){
                    message.style.color = "white";
                    message.innerHTML = "Passwords match.";
                }
                return true;
            }
        </script>
</head>

<body>

    <%@include file="header.jsp" %>
    <div class="container-fluid" style="margin: 50px;">
        <section>
            <form action="register" method="post" onsubmit="return validateForm()">
            <h1>Register</h1>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="email" name="mail" required>
                    <label for="email">Email</label>
                </div>
                
                <div class="inputbox">
                    <ion-icon name="person-outline"></ion-icon>
                    <input type="text" id="username" name="username" required onchange="validateForm()">
                    <label for="username">Username</label>
                </div>

                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" id="password" name="password" required onchange="validateForm()">
                    <label for="password">Password</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" id="confirmPassword" required onchange="validateForm()">
                    <label for="confirmPassword">Confirm Password</label>
                </div>
                <div id="message" style="font-size: 20px;"></div>

                <button type="submit" value="Register">Register</button>

                <div class="register">
                    <p>You have a account? <a href="login.jsp">Login here!</a></p>
                </div>
            </form>
        </section>
    </div>
    
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
