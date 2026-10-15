package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.UserManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterUserServlets", value = "/register-user")
public class RegisterUserServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Registering user");
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
        UserManagers.addNewUser( name, password,  email, age,  gender,  contactNumber,  address,  weight, height);

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1 style=''>User registered successfully</h1>");
        out.println("<a href='login.jsp'>Go to Login</a>");
        out.println("</body></html>");


    }
}
