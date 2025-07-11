<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.fitnesssystem.models.MemberShip" %>
<%@ page import="com.example.fitnesssystem.services.MemberShipManagers" %>
<%@ page import="com.example.fitnesssystem.dsa.Queue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberShipManagers.loadMemberShips();
%>
<html>
<head>
    <title>Admin Dashboard - Membership Management</title>
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
    </style>
</head>
<body>

<header>Admin Dashboard - Membership Management</header>

<nav class="navbar">
    <a href="<%=request.getContextPath()%>/users-admin-view.jsp">User Management</a>
    <a href="<%=request.getContextPath()%>/admins-admin-view.jsp">Admin Management</a>
    <a href="<%=request.getContextPath()%>/plans-admin-view.jsp">Plan Management</a>
    <a href="<%=request.getContextPath()%>/membership-admin-view.jsp">Membership Management</a>
    <a href="<%=request.getContextPath()%>/payments-admin-view.jsp">Payment History</a>
    <a href="<%=request.getContextPath()%>/reviews-admin-view.jsp">Reviews</a>
</nav>

<div class="container">
    <table>
        <tr>
            <th>Membership ID</th>
            <th>User ID</th>
            <th>Plan ID</th>
            <th>Start Date</th>
            <th>Duration</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            ArrayList<MemberShip> memberships = MemberShipManagers.getAllMemberShips();
            Queue pendingMembership = MemberShipManagers.getPendingMemberships();
            if (memberships != null && !memberships.isEmpty()) {
                for (MemberShip membership : memberships) {
                    if (membership.getStatus().equalsIgnoreCase("pending")) {
        %>
        <tr>
            <td><%= membership.getMemberShipID() %></td>
            <td><%= membership.getUserID() %></td>
            <td><%= membership.getPlanID() %></td>
            <td><%= membership.getStartDate() %></td>
            <td><%= membership.getExpireDate() %></td>
            <td><%= membership.getStatus() %></td>
            <td>
                <form action="accept-renewal" method="POST" onsubmit="return confirm('Are you sure you want accept this renewal request?')">
                    <input type="submit" value="Accept" class="accept-btn"
                        <%=(membership.getMemberShipID() == pendingMembership.peekFrontMemberShip().getMemberShipID())? "": "disabled"%>>
                </form>
            </td>
        </tr>
        <%
            }
                }
        } else {
        %>
        <tr>
            <td colspan="7">No memberships found.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
