
<!DOCTYPE html>
<html>
<head>
    <title>Exam Registration - EduAssessPro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
        }
        .form-container h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            text-align: left;
            margin-top: 10px;
            font-weight: bold;
            color: #34495e;
        }
        .form-container input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .form-container button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 8px;
            background-color: #27ae60;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Exam Registration</h1>
        <form action="RegistrationServlet" method="post">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>

            <label for="email">Email ID:</label>
            <input type="email" id="email" name="email" required>

            <label for="subject">Choose Subject:</label>
            <select id="subject" name="subject" required>
                <option value="">--Select--</option>
                <option value="maths">Mathematics</option>
                <option value="science">Science</option>
                <option value="english">English</option>
                <option value="computers">Computer Science</option>
            </select>

            <label for="date">Exam Date:</label>
            <input type="date" id="date" name="date" required>

            <button type="submit">Register Now</button>
        </form>
    </div>
</body>
</html>
