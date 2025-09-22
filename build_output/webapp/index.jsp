<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EduAssessPro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            text-align: center;
            width: 400px;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 25px;
        }
        a {
            display: block;
            margin: 12px 0;
            padding: 12px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }
        .register {
            background: #2980b9;
            color: #fff;
        }
        .register:hover {
            background: #1f6391;
        }
        .login {
            background: #27ae60;
            color: #fff;
        }
        .login:hover {
            background: #1f8a4b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edu Assessment Pro</h1>
        <p>Welcome! Get started with registration or login to continue.</p>

        <a href="registration.jsp" class="register">Register for Exam</a>
        <a href="login.jsp" class="login">Login</a>
    </div>
</body>
</html>
