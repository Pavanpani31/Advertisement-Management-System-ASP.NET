<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="advertiseManegement.logout" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Logging Out...</title>
    <meta http-equiv="refresh" content="2;url=login.aspx" />

    <script type="text/javascript">
    window.addEventListener("pageshow", function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
            window.location.reload();
        }
    });
</script>


    <style>
        body {
            font-family: Arial;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <h2>You are being logged out...</h2>
</body>
</html>

