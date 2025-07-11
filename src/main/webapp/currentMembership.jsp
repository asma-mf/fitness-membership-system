<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.fitnesssystem.models.User" %>
<%@ page import="com.example.fitnesssystem.models.MemberShip" %>
<%@ page import="com.example.fitnesssystem.models.Plan" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.fitnesssystem.services.MemberShipManagers" %>
<%@ page import="com.example.fitnesssystem.services.PlanManagers" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="com.example.fitnesssystem.services.UserManagers" %>

<%
    MemberShipManagers.loadMemberShips();
    PlanManagers.readPlans();
    UserManagers.readUsers();

    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    MemberShip membership = MemberShipManagers.getMemberShipsByUserID(user.getId());

    Date today = new Date();
    long remainingDays = 0;
    Plan plan = null;

    if (membership != null) {
        plan = PlanManagers.findPlan(membership.getPlanID());
        long diff = membership.getExpireDate().getTime() - today.getTime();
        remainingDays = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Current Membership</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .navbar {
            background-color: #1e40af;
            padding: 1rem;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        .nav-brand {
            color: white;
            font-weight: bold;
            font-size: 1.25rem;
            text-decoration: none;
        }
        .nav-links {
            display: flex;
            gap: 1.5rem;
        }
        .nav-link {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #93c5fd;
        }
        .profile-container {
            margin-top: 5rem;
        }
        .status-expired {
            color: #ef4444;
            font-weight: bold;
        }
        .status-pending {
            color: #eab308;
            font-weight: bold;
        }
        .status-active {
            color: #22c55e;
            font-weight: bold;
        }
        .renew-btn {
            background-color: #1e40af;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .renew-btn:hover {
            background-color: #1e3a8a;
        }
    </style>
</head>
<body class="bg-gray-100">
<!-- Navigation Bar -->
<nav class="navbar">
    <div class="nav-container">
        <a href="index.jsp" class="nav-brand">Fitness System</a>
        <div class="nav-links">
            <a href="userProfile.jsp" class="nav-link">Profile</a>
            <a href="viewUserPlans.jsp" class="nav-link">View Plans</a>
        </div>
    </div>
</nav>

<!-- Membership Content -->
<div class="flex justify-center items-start min-h-screen py-10 profile-container">
    <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-md">
        <h1 class="text-2xl font-bold text-center text-blue-600 mb-6">Current Membership Details</h1>

        <% if (membership != null && plan != null) { %>
        <div class="space-y-3 mb-6">
            <p><span class="font-semibold">Plan Name:</span> <%= plan.getPlanName() %></p>
            <p><span class="font-semibold">Plan Description:</span> <%= plan.getPlanDescription() %></p>
            <p><span class="font-semibold">Start Date:</span> <%= sdf.format(membership.getStartDate()) %></p>
            <p><span class="font-semibold">End Date:</span> <%= sdf.format(membership.getExpireDate()) %></p>
            <p><span class="font-semibold">Remaining Days:</span> <%= remainingDays %></p>

            <p><span class="font-semibold">Status:</span>
                <% if (remainingDays <= 0) { %>
                <span class="status-expired">Expired</span>
                <% } else if (membership.getStatus().equalsIgnoreCase("pending")) { %>
                <span class="status-pending">Pending</span>
                <% } else if (membership.getStatus().equalsIgnoreCase("active")) { %>
                <span class="status-active">Active</span>
                <% } %>
            </p>
        </div>

        <% if (remainingDays <= 0) { %>
        <div class="text-center">
            <form action="<%=request.getContextPath()%>/renewalForm.jsp" method="get">
                <input type="hidden" name="membershipID" value="<%= membership.getMemberShipID() %>">
                <input type="submit" value="Renew Membership" class="renew-btn cursor-pointer">
            </form>
        </div>
        <% } %>

        <% } else { %>
        <div class="text-center py-4">
            <p class="text-gray-600">You do not have an active membership.</p>
        </div>
        <% } %>

        <div class="mt-6 text-center">
            <a href="index.jsp" class="text-blue-500 hover:underline">← Back to Home</a>
        </div>
    </div>
</div>
</body>
</html>