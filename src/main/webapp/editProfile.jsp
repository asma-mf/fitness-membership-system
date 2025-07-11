<%@ page import="com.example.fitnesssystem.models.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/4/2025
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("loggedUser");  // Ensure user session is set
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update profile details</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">

</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">

<div class="bg-white p-6 rounded-lg shadow-lg w-96">
    <h2 class="text-xl font-bold text-center mb-4">Update profile details</h2>

    <form action="edit-user" method="post">
        <input type="hidden" name="id" value="<%=user.getId()%>">
        <label class="block mb-2 font-medium">Name</label>
        <input type="text" name="name" class="w-full p-2 border rounded-lg mb-3" value="<%= user.getName()%>" required>

        <label class="block mb-2 font-medium">Email</label>
        <input type="email" name="email" class="w-full p-2 border rounded-lg mb-3" value="<%=user.getEmail()%>" required>

        <label class="block mb-2 font-medium">Password</label>
        <input type="password" name="password" class="w-full p-2 border rounded-lg mb-3" value="<%= user.getPassword()%>" required>

        <label class="block mb-2 font-medium">Contact Number</label>
        <input type="tel" name="contactNumber" class="w-full p-2 border rounded-lg mb-3" value="<%=user.getContactNumber()%>" required>

        <label class="block mb-2 font-medium">Address</label>
        <input type="text" name="address" class="w-full p-2 border rounded-lg mb-3"value="<%=user.getAddress()%>" required>

        <label class="block mb-2 font-medium">Weight</label>
        <input type="number" step="0.1" name="weight" class="w-full p-2 border rounded-lg mb-3 " value="<%=user.getWeight()%>" required>

        <label class="block mb-2 font-medium">Height</label>
        <input type="number" step="0.1" name="height" class="w-full p-2 border rounded-lg mb-3" value="<%=user.getHeight()%>" required>

        <label class="block mb-2 font-medium">Gender</label>
        <div class="flex gap-4 mb-3">
            <label class="flex items-center">
                <input type="radio" name="gender" value="Male" class="mr-2" <%= (user.getGender().equals("Male"))? "checked" : "" %> required> Male
            </label>
            <label class="flex items-center">
                <input type="radio" name="gender" value="Female" class="mr-2" <%= (user.getGender().equals("Female"))? "checked" : "" %> required> Female
            </label>
        </div>

        <label class="block mb-2 font-medium" >Age</label>
        <input type="number" name="age" class="w-full p-2 border rounded-lg mb-3" value="<%=user.getAge()%>" required>

        <input value="Submit" type="submit" class="w-full bg-blue-500 text-white p-2 rounded-lg hover:bg-blue-600">
        <input value="Reset" type="reset" class="w-full bg-gray-500 text-white p-2 rounded-lg hover:bg-gray-600">
    </form>
</div>

</body>
</html>
