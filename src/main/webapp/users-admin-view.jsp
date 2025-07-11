<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.fitnesssystem.models.User" %>
<%@ page import="com.example.fitnesssystem.services.UserManagers" %>
<%@ page import="com.example.fitnesssystem.models.MemberShip" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="com.example.fitnesssystem.services.MemberShipManagers" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserManagers.readUsers();
    MemberShipManagers.loadMemberShips();
%>
<html>
<head>
    <title>Admin Dashboard - User Management</title>
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

        .btn-sort{
            background-color: #a9d18e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

    </style>
</head>
<body>

<header>Admin Dashboard - User Management</header>

<nav class="navbar">
    <a href="<%=request.getContextPath()%>/users-admin-view.jsp">User Management</a>
    <a href="<%=request.getContextPath()%>/admins-admin-view.jsp">Admin Management</a>
    <a href="<%=request.getContextPath()%>/plans-admin-view.jsp">Plan Management</a>
    <a href="<%=request.getContextPath()%>/membership-admin-view.jsp">Membership Management</a>
    <a href="<%=request.getContextPath()%>/payments-admin-view.jsp">Payment History</a>
    <a href="<%=request.getContextPath()%>/reviews-admin-view.jsp">Reviews</a>

    <form method="post" action="<%=request.getContextPath()%>/admin-logout" onsubmit="return confirm('Are you sure you want to logout?')"style="margin-left:15px" >
        <button type="submit" class="nav-logout-btn">Logout</button>
    </form>
</nav>

<form action="sort-users" method="post" class="btn-sort">
    <input type="submit" value="Sort by Renewal Date">
</form>

<form action="unsort-users" method="post" class="btn-sort">
    <input type="submit" value="Reset">
</form>

<div class="container">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Weight</th>
            <th>Height</th>
            <th>Action</th>
        </tr>
        <%

            ArrayList<MemberShip> memberShips = (ArrayList<MemberShip>)session.getAttribute("sorted-memberships");
            ArrayList<User> users = new ArrayList<>();
            if (memberShips != null){
                for (MemberShip membership: memberShips){
                    users.add(UserManagers.getUserById(membership.getUserID()));
                }
            }

            if (users.isEmpty()){
                users = UserManagers.getUsers();
            }


            if (!(users==null || users.isEmpty())) {
            for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getAge() %></td>
            <td><%= user.getGender() %></td>
            <td><%= user.getContactNumber() %></td>
            <td><%= user.getAddress() %></td>
            <td><%= user.getWeight() %></td>
            <td><%= user.getHeight() %></td>
            <td>
                <form action="unregister-user" method="POST" onsubmit="return confirm('Are you sure you want to delete this user?')">
                    <input type="hidden" name="user-id" value="<%= user.getId() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="11">No users found.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
