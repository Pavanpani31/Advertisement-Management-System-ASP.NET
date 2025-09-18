<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="advertiseManegement.welcome" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Welcome - Advertisement Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script type="text/javascript">
        window.addEventListener("pageshow", function (event) {
            if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                window.location.reload();
            }
        });
    </script>

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

        .content-area {
            min-height: 500px;
            padding-bottom: 70px;
            margin-top: 40px;
        }

        .jumbotron h2 {
            font-size: 28px;
        }

        .table-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

       <%-- <div class="container-fluid header-bar">
            <div class="row">
                <div class="col-sm-4"><strong>User</strong></div>
                <div class="col-sm-8 text-right">
                    <a href="welcome.aspx" style="padding: 10px; color: white;">User</a> |
                    <a href="addAds.aspx" style="padding: 10px; color: white;">Add Ads Ads</a> |
                    <a href="manageads.aspx" style="padding: 10px; color: white;">Manage Ads</a> |
                    <a href="logout.aspx" style="padding: 10px; color: white;">Logout</a>
                </div>
            </div>
        </div> --%>

                <!--- hamburger menu --->
<nav class="navbar navbar-inverse" style="background-color: rgb(2,70,2); padding: 4px 10px; min-height: 36px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="welcome.aspx"
               style="color: white; font-size: 16px; padding: 5px 10px;">
                Welcome
            </a>
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#mainNavbar"
                    aria-expanded="false" style="margin-top: 4px;">
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse justify-content-center" id="mainNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="welcome.aspx" style="color: white; padding: 5px 10px;">User |</a></li>
                <li><a href="addAds.aspx" style="color: white; padding: 5px 10px;">Add Ads |</a></li>
                <li><a href="manageads.aspx" style="color: white; padding: 5px 10px;">Manage Ads |</a></li>
                <li><a href="logout.aspx" style="color: white; padding: 5px 10px;">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

        <div class="container content-area">
            <div class="jumbotron">
                <h2>Hello, <%= Session["user"] != null ? Session["user"].ToString() : "Guest" %>!</h2>
                <p>Welcome to the Advertisement Management Dashboard.</p>
                <p>Use the navigation buttons above to manage your advertisements.</p>
            </div>
        </div>

        <!-- Footer bar: copied structure from manageads.aspx -->
        <div class="footer-bar">
            &copy; 2025 Advertise Management - All Rights Reserved
        </div>

    </form>
</body>
</html>