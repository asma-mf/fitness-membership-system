<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.fitnesssystem.models.Plan" %>
<%@ page import="com.example.fitnesssystem.services.PlanManagers" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PlanManagers.readPlans();
%>
<html>
<head>
    <title>Admin Dashboard - Plan Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4ff;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1e3a8a;
            padding: 20px;
            color: white;
            text-align: center;
            font-size: 26px;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background-color: #1e3a8a;
            padding: 10px 0;
        }

        .navbar a {
            color: #a9d18e;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 18px;
            border-radius: 20px;
            font-weight: 600;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #a9d18e;
            color: #1e3a8a;
        }

        .container {
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #3b82f6;
            color: white;
        }

        tr:hover {
            background-color: #e0efff;
        }

        .delete-btn {
            padding: 6px 12px;
            background-color: #ef4444;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #dc2626;
        }

        .nav-logout-btn {
            background-color: transparent;
            color: #a9d18e;
            border: none;
            margin: 0 15px;
            padding: 10px 18px;
            border-radius: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            font-family: inherit;
            font-size: 16px;
        }

        .nav-logout-btn:hover {
            background-color: #a9d18e;
            color: #1e3a8a;
        }

    </style>
</head>
<body>

<header>Admin Dashboard - Plan Management</header>

<nav class="navbar">
    <a href="<%=request.getContextPath()%>/users-admin-view.jsp">User Management</a>
    <a href="<%=request.getContextPath()%>/admins-admin-view.jsp">Admin Management</a>
    <a href="<%=request.getContextPath()%>/plans-admin-view.jsp">Plan Management</a>
    <a href="<%=request.getContextPath()%>/membership-admin-view.jsp">Membership Management</a>
    <a href="<%=request.getContextPath()%>/payments-admin-view.jsp">Payment History</a>
    <a href="<%=request.getContextPath()%>/reviews-admin-view.jsp">Reviews</a>
    <a href="<%=request.getContextPath()%>/admin-logout">Logout</a>


    <form method="post" action="<%=request.getContextPath()%>/admin-logout" onsubmit="return confirm('Are you sure you want to logout?')"style="margin-left:15px" >
        <button type="submit" class="nav-logout-btn">Logout</button>
    </form>
</nav>

<div class="container">
    <table>
        <tr>
            <th>ID</th>
            <th>Plan Name</th>
            <th>Description</th>
            <th>Price (1 Month)</th>
            <th>Price (3 Month)</th>
            <th>Price (6 Month)</th>
            <th>Price (1 Year)</th>
            <th>Action</th>
        </tr>
        <%
            ArrayList<Plan> plans = PlanManagers.getPlans();
            if (plans != null && !plans.isEmpty()) {
                for (Plan plan : plans) {
        %>
        <tr>
            <td><%= plan.getPlanID() %></td>
            <td><%= plan.getPlanName() %></td>
            <td><%= plan.getPlanDescription() %></td>
            <td><%= plan.getOneMonth() %></td>
            <td><%= plan.getThreeMonths() %></td>
            <td><%= plan.getSixMonth() %></td>
            <td><%= plan.getOneYear() %></td>
            <td>
                <form action="<%=request.getContextPath()%>/delete-plan" method="POST" onsubmit="return confirm('Are you sure you want to delete this plan?')">
                    <input type="hidden" name="planID" value="<%= plan.getPlanID() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>

                <form action="editPlan.jsp" method="GET" onsubmit="return confirm('Are you sure you want to edit this plan?')">
                    <input type="hidden" name="planID" value="<%= plan.getPlanID() %>">
                    <input type="submit" value="Edit" class="delete-btn">
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No plans found.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
