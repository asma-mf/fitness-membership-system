package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.UserManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UnregisterUser", value = "/unregister-user")
public class UnregisterUser extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID = Integer.parseInt(request.getParameter("user-id"));

        UserManagers.deleteUser(userID);

        response.sendRedirect("login.jsp");
    }
}