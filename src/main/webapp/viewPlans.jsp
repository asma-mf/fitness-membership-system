<%@ page language="java" import="com.example.fitnesssystem.models.Plan, com.example.fitnesssystem.services.PlanManagers, java.util.*" %>
<%
    PlanManagers.readPlans();
    ArrayList<Plan> plans = PlanManagers.getPlans();
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Plans</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            padding: 40px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px #ccc;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        th {
            background: #007BFF;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .actions a {
            margin: 0 5px;
            color: #007BFF;
            text-decoration: none;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .top-link {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            background: #007BFF;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h2>All Membership Plans</h2>
<a class="top-link" href="addPlan.jsp">+ Add New Plan</a>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>1 Month</th>
        <th>3 Months</th>
        <th>6 Months</th>
        <th>1 Year</th>
        <th>Actions</th>
    </tr>
    <%
        for (Plan p : plans) {
            if (p.getPlanID() != 0) {
    %>
    <tr>
        <td><%= p.getPlanID() %></td>
        <td><%= p.getPlanName() %></td>
        <td><%= p.getPlanDescription() %></td>
        <td><%= p.getOneMonth() %></td>
        <td><%= p.getThreeMonths() %></td>
        <td><%= p.getSixMonth() %></td>
        <td><%= p.getOneYear() %></td>

        <td class="actions">
            <a href="updatePlan.jsp?id=<%= p.getPlanID() %>">Edit</a>
            <form method="post" action = "delete-Plan" onSubmit="return confirm('Are you sure you want to delete this plan?')">
                <input type="hidden" name="planID"  value = "<%= p.getPlanID()%>">
                <input type="submit"  value="Delete">
            </form>
        </td>
    </tr>
    <% }} %>
</table>
</body>
</html>
