<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Storee</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        .login { padding: 100px; }
                body {
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('img/wy.png'); /* Assuming 'wy.png' is in an 'img' folder at the same level as this JSP */
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>

<body>
    <%@include file="header.jsp" %>
<div class="container-fluid" style="padding: 0!important;">
    <div class="container login">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h1>User Profile</h1>
                    </div>
                    <div class="card-body">
                        <form action="./login" method="POST" class="butt">
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" value="${requestScope.user.password}">
                            </div>
                            <div class="form-group">
                                <label for="mail">Email</label>
                                <input type="email" class="form-control" id="mail" name="mail" value="${requestScope.user.mail}">
                            </div>
                            <input type="text" name="username" value="${requestScope.user.username}" hidden>
                            <input type="text" name="action" value="save" hidden>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>
    <div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
