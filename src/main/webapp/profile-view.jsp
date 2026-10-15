<%@ page import="com.example.fitnesssystem.models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My profile</title>
</head>
<body>

<%
    Admin currentAdmin = (Admin) session.getAttribute("logged-in-admin");
    if (currentAdmin == null) {
        response.sendRedirect(request.getContextPath() + "/admin-login");
        return;
    }
%>

<header>
    <div class="header">
        <div>
            <h2 class="header-title">Fitness Membership System</h2>
        </div>
    </div>
</header>

<div class="profile-container">
    <h2>Welcome, <%= currentAdmin.getName() %>!</h2>

    <table>
        <tr><td>Email:</td><td><%= currentAdmin.getEmail() %></td></tr>
    </table>

    <div class="button-group">
        <button value="Edit Profile" class="btn-edit" onClick="editProfile(<%= currentAdmin.getID() %>)">
            Edit Profile
        </button>

        <form action="<%= request.getContextPath() %>/delete-admin-account" method="post"
              onsubmit="return confirm('Are you sure you want to delete your account?')">
            <input type="hidden" value="<%= currentAdmin.getID() %>" name="admin-id">
            <input type="submit" value="Delete Account" class="btn-remove"/>
        </form>
    </div>


    <script>
        function editProfile(adminID) {
            if (confirm("Are you sure you want to edit your account?")) {
                window.location.href = "update.jsp?adminID=" + adminID;
            }
        }
    </script>
</div>

</body>
</html>
