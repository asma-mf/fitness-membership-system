<%@ page import="com.example.fitnesssystem.services.*" %>
<%@ page import="com.example.fitnesssystem.models.MemberShip" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  UserManagers.readUsers();
  AdminManagers.readAdmins();
  ReviewManagers.readReviews();
  PlanManagers.readPlans();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fitness Center Membership System</title>
  <style>
    /* Reset and base styles */
    * {
      box-sizing: border-box;
    }
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      overflow: hidden;
      background: #e3f2fd; /* Light blue background fallback */
      color: #ffffff;
    }

    /* Background slideshow */
    .bg-slideshow {
      position: fixed;
      top: 0; left: 0;
      width: 100vw;
      height: 100vh;
      z-index: 1;
    }
    .bg-slideshow div {
      position: absolute;
      width: 100%;
      height: 100%;
      background-size: cover;
      background-position: center;
      opacity: 0;
      animation: fadeSlide 20s infinite;
      filter: brightness(0.6) saturate(1.2);
      will-change: opacity;
    }
    .bg-slideshow div:nth-child(1) {
      background-image: url('images/image1.jpg');
      animation-delay: 0s;
    }
    .bg-slideshow div:nth-child(2) {
      background-image: url('images/image2.jpg');
      animation-delay: 5s;
    }
    .bg-slideshow div:nth-child(3) {
      background-image: url('images/image3.jpg');
      animation-delay: 10s;
    }
    .bg-slideshow div:nth-child(4) {
      background-image: url('images/image4.jpg');
      animation-delay: 15s;
    }
    @keyframes fadeSlide {
      0% {opacity: 0;}
      10% {opacity: 1;}
      25% {opacity: 1;}
      35% {opacity: 0;}
      100% {opacity: 0;}
    }

    /* Container with content */
    .container {
      position: relative;
      z-index: 10;
      height: 100vh;
      display: flex;
      flex-direction: column;
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
      color: #a9d18e; /* soft fitness green */
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

    /* Main content */
    .main-content {
      flex-grow: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 0 20px;
    }
    .main-content h1 {
      font-size: 3.5rem;
      line-height: 1.2;
      max-width: 850px;
      text-shadow: 2px 3px 8px rgba(0, 0, 0, 0.7);
      font-weight: 700;
    }
    .main-content p {
      margin-top: 20px;
      font-size: 1.3rem;
      color: #d1e7c2;
      max-width: 700px;
      text-shadow: 1px 2px 6px rgba(0, 0, 0, 0.6);
      font-weight: 500;
    }

    /* Responsive */
    @media(max-width: 700px) {
      .navbar a {
        margin-left: 15px;
        font-size: 15px;
        padding: 7px 12px;
      }
      .main-content h1 {
        font-size: 2.5rem;
      }
      .main-content p {
        font-size: 1.1rem;
      }
    }
  </style>
</head>
<body>
<!-- Background slideshow -->
<div class="bg-slideshow">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>

<!-- Main container -->
<div class="container">

  <!-- Navigation Bar -->
  <nav class="navbar">
    <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
    <a href="<%=request.getContextPath()%>/login.jsp">Login</a>
    <a href="<%=request.getContextPath()%>/userRegister.jsp">Register</a>
    <a href="<%=request.getContextPath()%>/adminLogin.jsp">Admin</a>
  </nav>

  <!-- Center message -->
  <div class="main-content">
    <div>
      <h1>Achieve Your Best Shape<br>With Our Fitness Membership</h1>
      <p>Join today and start your journey to a healthier, stronger you. Track your progress and unlock exclusive benefits!</p>
    </div>
  </div>
</div>
</body>
</html>
