<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .form-container {
            width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        th {
            text-align: left;
            padding: 8px 0;
            width: 30%;
        }

        td {
            padding: 8px 0;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            margin-top: 15px;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<header>
    <div class="header">
        <h2 class="header-title">Fitness MemberShip System</h2>
    </div>
</header>

<div class="form-container">
    <h2>Enter Admin Details</h2>
    <form action="<%=request.getContextPath()%>/add-admin" method="post">
        <table>
            <tbody>
            <tr>
                <th>Name</th>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><input type="password" name="password" required></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Sign Up">

        <p class="error-message">
            <% String error = (String) request.getAttribute("email-already-used");
                if (error != null) { %>
            <%= error %>
            <% session.removeAttribute("email-already-used"); } %>
        </p>
    </form>
</div>

</body>
</html>