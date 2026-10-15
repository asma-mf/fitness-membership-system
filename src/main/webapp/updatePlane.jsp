<%@ page language="java" import="com.example.fitnesssystem.models.Plan, com.example.fitnesssystem.services.PlanManagers" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PlanManagers.readPlanes();
    Plan p = PlanManagers.findPlane(id);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("planeName");
        String description = request.getParameter("planeDescription");
        double oneMonth = Double.parseDouble(request.getParameter("oneMonth"));
        double threeMonths = Double.parseDouble(request.getParameter("threeMonths"));
        double sixMonth = Double.parseDouble(request.getParameter("sixMonth"));
        double oneYear = Double.parseDouble(request.getParameter("oneYear"));

        PlanManagers.updatePlane(id, name, description, oneMonth, threeMonths, sixMonth, oneYear);
        response.sendRedirect("viewPlanes.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            padding: 40px;
        }
        h2 {
            color: #333;
            text-align: center;
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
<h2>Edit Plan</h2>
<form method="post">
    <label>Plan Name:</label>
    <input type="text" name="planeName" value="<%= p.getPlanName() %>" required>

    <label>Description:</label>
    <input type="text" name="planeDescription" value="<%= p.getPlanDescription() %>" required>

    <label>1 Month Price:</label>
    <input type="text" name="oneMonth" value="<%= p.getOneMonth() %>" required>

    <label>3 Months Price:</label>
    <input type="text" name="threeMonths" value="<%= p.getThreeMonths() %>" required>

    <label>6 Months Price:</label>
    <input type="text" name="sixMonth" value="<%= p.getSixMonth() %>" required>

    <label>1 Year Price:</label>
    <input type="text" name="oneYear" value="<%= p.getOneYear() %>" required>

    <input type="submit" value="Update Plan">
</form>
<a href="viewPlanes.jsp">← Back to View</a>
</body>
</html>
