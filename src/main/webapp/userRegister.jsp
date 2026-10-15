<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitness Membership Form</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
  <style>
    .navbar {
      background: rgba(34, 49, 63, 0.85);
      padding: 16px 32px;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
    }
    .navbar a {
      color: #a9d18e;
      text-decoration: none;
      margin-left: 30px;
      font-weight: 600;
      font-size: 17px;
      padding: 8px 15px;
      border-radius: 25px;
      transition: background-color 0.3s ease, color 0.3s ease;
      user-select: none;
    }
    .navbar a:hover {
      background-color: #a9d18e;
      color: #22313f;
      box-shadow: 0 0 8px #a9d18e;
    }
    @media(max-width: 700px) {
      .navbar a {
        margin-left: 15px;
        font-size: 15px;
        padding: 7px 12px;
      }
    }
  </style>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center">

<!-- Navbar -->
<nav class="navbar w-full">
  <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
  <a href="<%=request.getContextPath()%>/login.jsp">Login</a>
  <a href="<%=request.getContextPath()%>/userRegister.jsp">Register</a>
  <a href="<%=request.getContextPath()%>/adminLogin.jsp">Admin</a>
</nav>

<!-- Centered Form -->
<div class="flex-grow flex justify-center items-center w-full">
  <div class="bg-white p-6 rounded-lg shadow-lg w-96 mt-6">
    <h2 class="text-xl font-bold text-center mb-4">Fitness Membership Form</h2>

    <form action="register-user" method="post">
      <label class="block mb-2 font-medium">Name</label>
      <input type="text" name="name" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Email</label>
      <input type="email" name="email" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Password</label>
      <input type="password" name="password" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Contact Number</label>
      <input type="tel" name="contactNumber" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Address</label>
      <input type="text" name="address" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Weight</label>
      <input type="number" step="0.1" name="weight" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Height</label>
      <input type="number" step="0.1" name="height" class="w-full p-2 border rounded-lg mb-3" required>

      <label class="block mb-2 font-medium">Gender</label>
      <div class="flex gap-4 mb-3">
        <label class="flex items-center">
          <input type="radio" name="gender" value="Male" class="mr-2" required> Male
        </label>
        <label class="flex items-center">
          <input type="radio" name="gender" value="Female" class="mr-2" required> Female
        </label>
      </div>

      <label class="block mb-2 font-medium">Age</label>
      <input type="number" name="age" class="w-full p-2 border rounded-lg mb-3" required>

      <input value="Submit" type="submit" class="w-full bg-blue-500 text-white p-2 rounded-lg hover:bg-blue-600">
      <input value="Reset" type="reset" class="w-full bg-gray-500 text-white p-2 rounded-lg hover:bg-gray-600 mt-2">
    </form>
  </div>
</div>

</body>
</html>
