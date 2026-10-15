<%@ page import="com.example.fitnesssystem.models.Plan" %>
<%@ page import="com.example.fitnesssystem.services.PlanManagers" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.fitnesssystem.models.Review" %>
<%@ page import="com.example.fitnesssystem.services.ReviewManagers" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int planID = Integer.parseInt(request.getParameter("planID"));
    Plan plan = PlanManagers.findPlan(planID);
    ArrayList<Review> reviews = ReviewManagers.getAllReviews();
%>
<html>
<head>
    <title><%= plan.getPlanName() %> - Plan Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #003366;
            padding: 20px;
        }
        h1 {
            color: #004080;
        }
        h3 {
            color: #0059b3;
        }
        .plan-box, .review-box, .review-form-box {
            background-color: #e6f2ff;
            border: 1px solid #99ccff;
            border-radius: 8px;
            padding: 20px;
            width: 400px;
            margin-bottom: 20px;
        }
        .plan-box p, .plan-box li, .review-box p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        textarea, select, input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-top: 10px;
            border-radius: 4px;
            border: 1px solid #99ccff;
        }
    </style>
</head>
<body>
<div class="plan-box">
    <h1>Plan Profile</h1>
    <p><strong>Plan Name:</strong> <%= plan.getPlanName() %></p>
    <p><strong>Description:</strong> <%= plan.getPlanDescription() %></p>
    <h3>Fees</h3>
    <ul>
        <li><strong>1 Month:</strong> $<%= plan.getOneMonth() %></li>
        <li><strong>3 Months:</strong> $<%= plan.getThreeMonths() %></li>
        <li><strong>6 Months:</strong> $<%= plan.getSixMonth() %></li>
        <li><strong>1 Year:</strong> $<%= plan.getOneYear() %></li>
    </ul>
</div>

<div class="review-box">
    <h3>Reviews</h3>
    <%
        boolean hasReview = false;
        for (Review r : reviews) {
            if (r.getPlanID() == planID) {
                hasReview = true;
    %>
    <p><strong>Review ID:</strong> <%= r.getReviewID() %></p>
    <p><strong>Rating:</strong> <%= r.getRating() %> / 5</p>
    <p><%= r.getReviewText() %></p>
    <hr>
    <%
            }
        }
        if (!hasReview) {
    %>
    <p>No reviews found for this plan.</p>
    <%
        }
    %>
</div>

<div class="review-form-box">
    <h3>Write a Review</h3>
    <form action="add-review" method="post">
        <input type="hidden" name="planID" value="<%= planID %>">
        <input type="hidden" name="userID" value="2">
        <label for="reviewText">Your Review:</label><br>
        <textarea name="reviewText" rows="4" required></textarea><br>

        <label for="rating">Rating (1 to 5):</label><br>
        <select name="rating" required>
            <option value="">-- Select Rating --</option>
            <option value="1">1 - Poor</option>
            <option value="2">2 - Fair</option>
            <option value="3">3 - Good</option>
            <option value="4">4 - Very Good</option>
            <option value="5">5 - Excellent</option>
        </select><br>

        <input type="submit" value="Submit Review">
    </form>
</div>
</body>
</html>
