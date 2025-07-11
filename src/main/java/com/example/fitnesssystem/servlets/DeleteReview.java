package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.ReviewManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteReview", value = "/delete-review")
public class DeleteReview extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reviewID = Integer.parseInt(request.getParameter("review-id"));
        ReviewManagers.removeReview(reviewID);
        response.sendRedirect("reviews-admin-view.jsp");
    }
}

