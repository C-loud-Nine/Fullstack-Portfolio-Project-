<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Webapp_01.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #212529; /* Dark background */
            color: #fff; /* Bright text */
        }

        .container {
            max-width: 500px; /* Larger panel */
            margin: 100px auto;
            padding: 40px; /* Increased padding */
            border-radius: 10px;
            background-color: #343a40; /* Darker panel background */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Enhanced box shadow for depth */
        }

        h2 {
            text-align: center;
            margin-bottom: 30px; /* Increased margin */
            color: #17a2b8; /* Cyan title color */
        }

        .form-group {
            margin-bottom: 30px; /* Increased margin */
        }

        label {
            display: block;
            margin-bottom: 10px; /* Increased margin */
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #adb5bd; /* Gray border */
            border-radius: 5px;
            background-color: #495057; /* Darker input background */
            color: #fff; /* Bright text */
            transition: border-color 0.3s; /* Smooth border transition */
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #17a2b8; /* Cyan border on focus */
        }

        .button {
            width: 100%;
            padding: 12px;
            background-color: #007bff; /* Blue button color */
            color: #fff; /* White text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth background transition */
        }

        .button:hover {
            background-color: #0056b3; /* Darker Blue on hover */
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container">
            <h2>Login</h2>
            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
