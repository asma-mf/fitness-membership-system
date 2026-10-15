package com.example.fitnesssystem.servlets;

import java.io.*;

import com.example.fitnesssystem.services.ReviewManagers;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "AddReview", value = "/add-review")
public class AddReview extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String reviewText = request.getParameter("reviewText");
        int rating = Integer.parseInt(request.getParameter("rating"));

        int planId = Integer.parseInt(request.getParameter("planID"));
        int userId = Integer.parseInt(request.getParameter("userID"));

        ReviewManagers.addReview (userId,planId,reviewText,rating);
        response.sendRedirect("planProfile.jsp?planID="+planId);

    }
}

