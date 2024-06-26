<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information - Storee</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">

    <style>
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

        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 30px; /* Increased padding for better spacing */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 100px; /* Add margin top for spacing */
        }

        .card-title {
            font-weight: 500; /* Slightly bolder title */
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

    </style>
</head>

<body>

    <%@include file="header.jsp" %> 
<div class="container-fluid" style="padding: 0!important;">
    <div class="container mt-5"> 
        <div class="row justify-content-center">
            <div class="col-md-6"> 
                <div class="card">
                    <div class="card-body">
                        <h1 class="card-title text-center">User Information</h1>
                        <hr>

                        <p class="card-text"><strong>Username:</strong> ${sessionScope.usersession.username}</p>
                        <p class="card-text"><strong>Email:</strong> ${sessionScope.usersession.mail}</p>
                        
                        <hr>
                        
                        <div class="text-center mt-4"> 
                            <form action="./login" method="POST" class="d-inline">
                                <input type="hidden" name="username" value="${sessionScope.usersession.username}">
                                <input type="hidden" name="action" value="edit">
                                <button type="submit" class="btn btn-primary">Edit Info</button>
                            </form>

                            <form action="./login" method="POST" class="d-inline ml-3"> 
                                <input name="action" value="logout" hidden="">
                                <button type="submit" class="btn btn-secondary">Logout</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>

    <%@include file="footer.jsp" %>
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</body>

</html>
