package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.models.Admin;
import com.example.fitnesssystem.services.AdminManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "adminLoginServlet", value = "/admin-login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin loggedAdmin = null;

        for (Admin admin : AdminManagers.getAdmins()) {
            if (admin.getEmail().equals(email) && admin.getPassword().equals(password)) {
                loggedAdmin = admin;
                break;
            }
        }

        HttpSession session = request.getSession();

        if (loggedAdmin == null) {
            session.setAttribute("email-password-incorrect", "Email or password incorrect");
        } else {
            session.setAttribute("logged-in-admin", loggedAdmin);
        }

        response.sendRedirect("users-admin-view.jsp");
    }
}

