<%@ page language="java" import="com.example.fitnesssystem.services.PlanManagers" %>
<%@ page import="com.example.fitnesssystem.models.Plan" %>
<%
    int planID = Integer.parseInt(request.getParameter("planID"));
    Plan plan = PlanManagers.findPlan(planID);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Plan</title>
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
<h2 align="center">Edit Plan</h2>
<form method="post" action="<%=request.getContextPath()%>/editPlan">
    <label>Plan Name:</label>
    <input type="hidden" name="planID" value="<%=planID%>">
    <input type="text" name="planName" value="<%=plan.getPlanName()%>" required>

    <label>Description:</label>
    <label>Description:</label>
    <input type="text" name="planDescription" value="<%=plan.getPlanDescription()%>" required>

    <label>1 Month Price:</label>
    <input type="text" name="oneMonth" value="<%=plan.getOneMonth()%>" required>

    <label>3 Months Price:</label>
    <input type="text" name="threeMonths" value="<%=plan.getThreeMonths()%>" required>

    <label>6 Months Price:</label>
    <input type="text" name="sixMonth" value="<%=plan.getSixMonth()%>" required>

    <label>1 Year Price:</label>
    <input type="text" name="oneYear" value="<%=plan.getOneYear()%>" required>

    <input type="submit" value="Edit Plan">
</form>
<a href="viewPlans.jsp">← Back to View Plans</a>
</body>
</html>
