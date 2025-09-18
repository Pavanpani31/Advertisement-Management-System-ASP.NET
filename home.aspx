<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="advertiseManegement.home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Home - Advertisement Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS and JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
    body {
        margin: 0;
        padding: 0;
    }

    .header-bar, .footer-bar {
        background-color: rgba(2,70,2,0.94);
        color: white;
        padding: 10px;
    }

    .footer-bar {
        text-align: center;
        font-size: 18px;
        padding-top: 20px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }

    .full-image {
        height: calc(100vh - 160px); 
        width: 100%;
        overflow: hidden;
    }

    .full-image img {
        width: 100%;
        height: 100%;
        object-fit: cover; 
        display: block;
    }
</style>

</head>
<body>
    <form runat="server">

        <div class="container-fluid header-bar">
            <div class="row">
                <div class="col-sm-4"><strong>Home</strong></div>
                <div class="col-sm-8 text-right">
                    <a href="home.aspx" style="padding: 10px; color: white;">Home</a> |
                    <a href="register.aspx" style="padding: 10px; color: white;">Register</a> |
                    <a href="login.aspx" style="padding: 10px; color: white;">Login</a>
                </div>
            </div>
        </div>

        <div class="full-image" style="flex: 1; padding-bottom: 0px; width: 100%; height: 100%;">

            <img src="images/home.jpg" alt="Home Image" />
        </div>
    
        <div class="footer-bar">
            &copy; 2025 Advertise Management - All Rights Reserved
        </div>

    </form>
</body>
</html>
