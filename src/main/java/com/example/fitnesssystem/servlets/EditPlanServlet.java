package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.PlanManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/editPlan")
public class EditPlanServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        int id = Integer.parseInt(request.getParameter("planID"));
        String name = request.getParameter("planName");
        String description = request.getParameter("planDescription");

        try {
            double oneMonth = Double.parseDouble(request.getParameter("oneMonth"));
            double threeMonths = Double.parseDouble(request.getParameter("threeMonths"));
            double sixMonth = Double.parseDouble(request.getParameter("sixMonth"));
            double oneYear = Double.parseDouble(request.getParameter("oneYear"));

            // Add the plan using the manager
            PlanManagers.readPlans(); // Make sure data is initialized
            PlanManagers.updatePlan(id, name, description, oneMonth, threeMonths, sixMonth, oneYear);

            // Redirect or show success
            response.sendRedirect("plans-admin-view.jsp"); // Change to your desired page

        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.write("Something went wrong");
        }
    }
}