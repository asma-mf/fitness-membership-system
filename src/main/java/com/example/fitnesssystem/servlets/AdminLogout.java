package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.models.Admin;
import com.example.fitnesssystem.services.AdminManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AdminLogout", value = "/admin-logout")
public class AdminLogout extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("logged-in-admin");

        response.sendRedirect("adminLogin.jsp");
    }
}

