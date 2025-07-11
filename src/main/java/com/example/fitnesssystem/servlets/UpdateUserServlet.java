package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.UserManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateUserServlets", value = "/edit-user")
public class UpdateUserServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Registering user");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNumber = request.getParameter("contactNumber");
        String address = request.getParameter("address");
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));

        UserManagers.readUsers();

        UserManagers.updateUser(id, name, password, email, age, gender, contactNumber, address, weight, height);

        response.sendRedirect("userProfile.jsp");
    }
}
