<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.fitnesssystem.services.PlanManagers, com.example.fitnesssystem.models.Plan" %>
<%@ page import="com.example.fitnesssystem.models.User" %>
<%
    User user = (User)session.getAttribute("loggedUser");
    String planIDStr = request.getParameter("planID");
    int planID = Integer.parseInt(planIDStr);
    PlanManagers.readPlans();
    Plan selectedPlan = null;

    for (Plan p : PlanManagers.getPlans()) {
        if (p.getPlanID() == planID) {
            selectedPlan = p;
            break;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Buy Membership</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            padding: 20px;
        }
        .container {
            background-color: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #2a57c9;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #2a57c9;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .plan-info {
            margin-top: 10px;
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Buy Membership</h2>

    <% if (selectedPlan != null) { %>
    <div class="plan-info">
        <strong>Plan:</strong> <%= selectedPlan.getPlanName() %><br>
        <small><%= selectedPlan.getPlanDescription() %></small>
    </div>

    <form action="BuyMembershipServlet" method="post">
        <!-- You can set userID from session if login system exists -->
        <input type="hidden" name="userID" value="<%=user.getId()%>" />
        <input type="hidden" name="planID" value="<%= selectedPlan.getPlanID() %>" />

        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required>

        <label for="duration">Select Duration:</label>
        <select id="duration" name="duration" required>
            <option value="1month">1 Month - $<%= selectedPlan.getOneMonth() %></option>
            <option value="3months">3 Months - $<%= selectedPlan.getThreeMonths() %></option>
            <option value="6months">6 Months - $<%= selectedPlan.getSixMonth() %></option>
            <option value="1year">1 Year - $<%= selectedPlan.getOneYear() %></option>
        </select>

        <!-- Card Payment Section -->
        <label for="cardName">Card Holder's Name:</label>
        <input type="text" id="cardName" name="cardName" placeholder="John Doe" required>

        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required maxlength="19">

        <label for="expiryDate">Card Expiry Date:</label>
        <input type="month" id="expiryDate" name="expiryDate" required>

        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" placeholder="123" required maxlength="4">

        <button type="submit">Confirm & Pay</button>
    </form>
    <% } else { %>
    <p>Plan not found. Please go back and try again.</p>
    <% } %>
</div>
</body>
</html>
