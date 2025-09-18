<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="advertiseManegement.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Log In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS & JS -->
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
            
            width: 100%;
        }

        .content-area {
            min-height: 500px;
            padding-bottom: 70px;
            margin-top: 30px;
        }

        .form-box {
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 8px #ccc;
        }

        .valid-msg { color: green; font-size: 0.9em; }
        .invalid-msg { color: red; font-size: 0.9em; }
        .valid-border { border: 2px solid #09c372 !important; }
        .invalid-border { border: 2px solid #ff3860 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validate();">

        <%--<div class="container-fluid header-bar">
            <div class="row">
                <div class="col-sm-4"><strong>Login Form</strong></div>
                <div class="col-sm-8 text-right">
                    <a href="home.aspx" style="padding: 10px; color: white;">Home</a> |
                    <a href="register.aspx" style="padding: 10px; color: white;">Register</a> |
                    <a href="login.aspx" style="padding: 10px; color: white;">Login</a>
                </div>
            </div>
        </div>--%>

                        <!--- hamburger menu --->
<nav class="navbar navbar-inverse" style="background-color: rgb(2,70,2); padding: 4px 10px; min-height: 36px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="welcome.aspx"
               style="color: white; font-size: 16px; padding: 5px 10px;">
               Login
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
                <li><a href="home.aspx" style="color: white; padding: 5px 10px;">Home | </a></li>
                <li><a href="register.aspx" style="color: white; padding: 5px 10px;">Register | </a></li>
                <li><a href="login.aspx" style="color: white; padding: 5px 10px;">Login </a></li>
            </ul>
        </div>
    </div>
</nav>

        <div class="container content-area">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <img src="Images/Login.jpg" alt="Login" class="img-responsive" />
                </div>

                <div class="col-md-6 col-sm-12">
                    <div class="form-box">
                        <h3 class="text-center">User Login</h3>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="text" runat="server" id="email" class="form-control" name="email" />
                            <div id="emailMsg"></div>
                        </div>

                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" runat="server" id="password" class="form-control" name="password" />
                            <div id="passwordMsg"></div>
                        </div>

                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success" OnClick="BtnLogin_Click" />
                        <br />
                        <p class="text-center">Don't have an account? <a href="register.aspx">Register here</a></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bar">
            &copy; 2025 Advertise Management - All Rights Reserved
        </div>
    </form>
   
    <script>
        function validate() {
            var emailValid = validateEmail();
            var passwordValid = validatePassword();
            return emailValid && passwordValid;
        }

        function validateEmail() {
            var input = document.getElementById('email');
            var email = input.value.trim();
            var msg = document.getElementById('emailMsg');
            var emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

            input.classList.remove("valid-border", "invalid-border");

            if (email === "") {
                msg.textContent = "Email is required.";
                msg.className = "invalid-msg";
                input.classList.add("invalid-border");
                return false;
            } else if (!emailPattern.test(email)) {
                msg.textContent = "Invalid email format.";
                msg.className = "invalid-msg";
                input.classList.add("invalid-border");
                return false;
            } else {
                msg.textContent = "Valid email!";
                msg.className = "valid-msg";
                input.classList.add("valid-border");
                return true;
            }
        }

        function validatePassword() {
            var input = document.getElementById('password');
            var password = input.value.trim();
            var msg = document.getElementById('passwordMsg');

            var lengthCheck = password.length >= 8;
            var uppercaseCheck = /[A-Z]/.test(password);
            var numberCheck = /[0-9]/.test(password);
            var specialCharCheck = /[!@#$%^&*(),.?":{}|<>]/.test(password);

            input.classList.remove("valid-border", "invalid-border");

            if (!lengthCheck || !uppercaseCheck || !numberCheck || !specialCharCheck) {
                msg.textContent = "Invalid Password. Please use at least 8 characters with uppercase, number, and special symbol.";
                msg.className = "invalid-msg";
                input.classList.add("invalid-border");
                return false;
            } else {
                msg.textContent = "Very Strong password!";
                msg.className = "valid-msg";
                input.classList.add("valid-border");
                return true;
            }
        }

            function validate() {
                var emailValid = validateEmail();
                var passwordValid = validatePassword();

                if (emailValid && passwordValid) {
                    alert("Conform Your Login !");
                    return true;
                } else {
                    alert("You need to fill this form before submit.");
                    return false;
                }
            }
    </script>
</body>
</html>
