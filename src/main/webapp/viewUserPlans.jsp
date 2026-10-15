<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.fitnesssystem.models.Plan, com.example.fitnesssystem.services.PlanManagers, java.util.*" %>
<%
  PlanManagers.readPlans();
  ArrayList<Plan> plans = PlanManagers.getPlans();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Available Plans</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f2f2f2; margin: 20px;">

<h1 style="color: white; background-color: #2a57c9; display: inline-block; padding: 10px 20px; border-radius: 8px;">
  Available Plans
</h1>

<!-- Flex container -->
<div style="display: flex; flex-wrap: wrap; gap: 20px; margin-top: 20px;">

  <% for (Plan p : plans) { %>
  <!-- Each plan card -->
  <div style="background-color: #ffffff; border: 1px solid #ccc; border-radius: 10px; padding: 15px; width: 280px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">

    <h3 style="margin-top: 0; color: #2a57c9;"><%= p.getPlanName() %></h3>
    <p style="font-size: 14px; color: #555;"><%= p.getPlanDescription() %></p>

    <ul style="list-style: none; padding: 0; font-size: 13px;">
      <li>1 Month: $<%= p.getOneMonth() %></li>
      <li>3 Months: $<%= p.getThreeMonths() %></li>
      <li>6 Months: $<%= p.getSixMonth() %></li>
      <li>1 Year: $<%= p.getOneYear() %></li>
    </ul>

    <!-- Buttons -->
    <div style="display: flex; justify-content: space-between; margin-top: 10px;">
      <form action="buyNow.jsp" method="post">
        <input type="hidden" name="planID" value="<%= p.getPlanID() %>"/>
        <button type="submit" style="padding: 6px 12px; border: none; border-radius: 5px; background-color: #007bff; color: white; cursor: pointer;">
          Buy Now
        </button>
      </form>
      <form action="planProfile.jsp" method="get">
        <input type="hidden" name="planID" value="<%= p.getPlanID() %>"/>
        <button type="submit" style="padding: 6px 12px; border: none; border-radius: 5px; background-color: #007bff; color: white; cursor: pointer;">
          View More
        </button>
      </form>
    </div>

  </div>
  <% } %>

</div>

</body>
</html>
