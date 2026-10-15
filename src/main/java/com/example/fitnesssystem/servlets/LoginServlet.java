package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.models.User;
import com.example.fitnesssystem.services.UserManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserManagers.readUsers();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserManagers.getUserByLogin(email, password);

        if (user == null) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1 style=''>Invalid Email or Password ! </h1>");
            out.println("<a href='Login.jsp'>Go to Login</a>");
            out.println("</body></html>");
            return;
        }
        if ("Male".equalsIgnoreCase(user.getGender())) {
            user.setImagePath("images/image5.jpg");
        } else {
            user.setImagePath("images/image6.jpg");
        }

        // If login success
        HttpSession session = request.getSession();
        session.setAttribute("loggedUser", user);
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
