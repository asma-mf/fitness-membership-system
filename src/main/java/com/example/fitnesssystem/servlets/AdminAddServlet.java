package com.example.fitnesssystem.servlets;
import java.io.*;

import com.example.fitnesssystem.models.Admin;
import com.example.fitnesssystem.services.AdminManagers;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AdminServlet", value = "/add-admin")
public class AdminAddServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");

        for(Admin admin : AdminManagers.getAdmins()) {
            if (admin.getEmail().equals(email)) {
                HttpSession session = request.getSession();
                session.setAttribute("email-already-used", "This email is already used");
                response.sendRedirect("/adminLogin.jsp");
                return;
            }
        }
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        int id = AdminManagers.getNextID();

        AdminManagers.addAdmin(id, name, email, password);
        response.sendRedirect("/admin-view.jsp");

    }
}
