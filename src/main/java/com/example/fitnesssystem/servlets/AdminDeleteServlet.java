package com.example.fitnesssystem.servlets;

import java.io.*;

import com.example.fitnesssystem.services.AdminManagers;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AdminDeleteServlet", value = "/delete-admin")
public class AdminDeleteServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

       int id = Integer.parseInt(request.getParameter("id"));
       AdminManagers.removeAdmin(id);
       response.sendRedirect("admin-view.jsp");


    }
}
