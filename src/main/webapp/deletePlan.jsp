<%@ page language="java" import="com.example.fitnesssystem.services.PlanManagers" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PlanManagers.readPlans();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fff3f3;
            padding: 50px;
        }
        .box {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px #ddd;
        }
        h2 {
            color: #c0392b;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"], a {
            padding: 10px 15px;
            margin: 10px;
            border-radius: 5px;
            text-decoration: none;
            border: none;
        }
        input[type="submit"] {
            background: #c0392b;
            color: white;
        }
        a {
            background: #ccc;
            color: black;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Confirm Delete</h2>
    <p>Are you sure you want to delete this plan?</p>

</div>
</body>
</html>
