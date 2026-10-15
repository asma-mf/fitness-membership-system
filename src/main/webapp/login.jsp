<%@ page import="com.example.fitnesssystem.services.UserManagers" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  UserManagers.readUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitness Membership Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #e3f2fd; /* Light blue background fallback */
      color: #ffffff;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: calc(100vh - 72px); /* Adjust based on navbar height */
      width: 100%;
    }

    .login-container {
      background: white;
      padding: 2rem;
      border-radius: 0.75rem;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    .login-title {
      font-size: 1.5rem;
      font-weight: bold;
      color: #1e40af;
      margin-bottom: 0.5rem;
      text-align: center;
    }

    .login-subtitle {
      font-size: 0.875rem;
      color: #6b7280;
      text-align: center;
      margin-bottom: 1.5rem;
    }

    .form-label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: #1f2937;
    }

    .form-input {
      width: 100%;
      padding: 0.5rem;
      border: 1px solid #d1d5db;
      border-radius: 0.5rem;
      margin-bottom: 1rem;
      color: black;
    }

    .form-input:focus {
      outline: none;
      border-color: #3b82f6;
      box-shadow: 0 0 0 3px rgba(59,130,246,0.3);
    }

    .btn-primary {
      width: 100%;
      padding: 0.5rem;
      background-color: #3b82f6;
      color: white;
      font-weight: bold;
      border: none;
      border-radius: 0.5rem;
      cursor: pointer;
    }

    .btn-primary:hover {
      background-color: #2563eb;
    }

    .link-primary {
      color: #1e40af;
      font-weight: bold;
      text-decoration: none;
    }

    /* Navigation bar */
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

    .navbar a.home-link {
      display: none;
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

<body>
<nav class="navbar">
  <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
  <a href="<%=request.getContextPath()%>/login.jsp">Login</a>
  <a href="<%=request.getContextPath()%>/userRegister.jsp">Register</a>
  <a href="<%=request.getContextPath()%>/adminLogin.jsp">Admin</a>
</nav>

<div class="container">
  <div class="login-container">
    <h2 class="login-title">Fitness Membership Login</h2>
    <p class="login-subtitle">Welcome back! Please log in to continue.</p>

    <form action="login-servlet" method="post">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-input" required>

      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-input" required>

      <button type="submit" class="btn-primary">Login</button>

      <p class="mt-4 text-center text-sm text-black">Don't have an account?
        <a href="userRegister.jsp" class="link-primary">Register now</a>
      </p>
    </form>
  </div>
</div>
</body>
</html>
