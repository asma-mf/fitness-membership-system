<%@ page language="java" import="com.example.fitnesssystem.services.PlanManagers" %>
<%@ page import="java.io.*" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("planName");
        String description = request.getParameter("planDescription");
        double oneMonth = Double.parseDouble(request.getParameter("oneMonth"));
        double threeMonths = Double.parseDouble(request.getParameter("threeMonths"));
        double sixMonth = Double.parseDouble(request.getParameter("sixMonth"));
        double oneYear = Double.parseDouble(request.getParameter("oneYear"));

        PlanManagers.readPlans();
        PlanManagers.addPlan(name, description, oneMonth, threeMonths, sixMonth, oneYear);
        response.sendRedirect("viewPlans.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            padding: 40px;
        }
        h2 {
            color: #333;
        }
        form {
            background: white;
            padding: 20px;
            max-width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border-radius: 5px;
            border: 1px solid #aaa;
        }
        input[type="submit"] {
            background: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
        }
    </style>
</head>
<body>
<h2 align="center">Add New Plan</h2>
<form method="post" action="<%=request.getContextPath()%>/addPlan">
    <label>Plan Name:</label>
    <input type="text" name="planeName" required>

    <label>Description:</label>
    <input type="text" name="planeDescription" required>

    <label>1 Month Price:</label>
    <input type="text" name="oneMonth" required>

    <label>3 Months Price:</label>
    <input type="text" name="threeMonths" required>

    <label>6 Months Price:</label>
    <input type="text" name="sixMonth" required>

    <label>1 Year Price:</label>
    <input type="text" name="oneYear" required>

    <input type="submit" value="Add Plan">
</form>
<a href="viewPlans.jsp">← Back to View Plans</a>
</body>
</html>
