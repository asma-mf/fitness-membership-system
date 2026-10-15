package com.example.fitnesssystem.servlets;



import com.example.fitnesssystem.services.PlanManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteUser", value = "/delete-plan")
public class DeletePlan extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int planID= Integer.parseInt(request.getParameter("planID"));

        PlanManagers.removePlan(planID);

        response.sendRedirect("viewPlans.jsp");
    }

}
