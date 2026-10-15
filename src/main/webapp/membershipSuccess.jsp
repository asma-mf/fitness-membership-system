<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String planName = (String) session.getAttribute("planName");
    Double price = (Double) session.getAttribute("price");
    String startDate = (String) session.getAttribute("startDate");
    String duration = (String) session.getAttribute("duration");

    System.out.println(planName+price+startDate+duration);
    if (planName == null || price == null || startDate == null || duration == null) {
        response.sendRedirect("error.jsp");
        return;
    }

    String readableDuration = "";
    switch (duration) {
        case "1month": readableDuration = "1 Month"; break;
        case "3months": readableDuration = "3 Months"; break;
        case "6months": readableDuration = "6 Months"; break;
        case "1year": readableDuration = "1 Year"; break;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Membership Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            padding: 40px;
        }
        .container {
            background-color: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #28a745;
        }
        .details {
            margin-top: 20px;
            text-align: left;
        }
        .details p {
            margin: 8px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>✅ Membership Purchased Successfully!</h2>
    <div class="details">
        <p><strong>Plan:</strong> <%= planName %></p>
        <p><strong>Duration:</strong> <%= readableDuration %></p>
        <p><strong>Start Date:</strong> <%= startDate %></p>
        <p><strong>Price Paid:</strong> $<%= String.format("%.2f", price) %></p>
    </div>
</div>
</body>
</html>
