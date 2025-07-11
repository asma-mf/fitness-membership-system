package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.dsa.InsertionSort;
import com.example.fitnesssystem.models.MemberShip;
import com.example.fitnesssystem.services.MemberShipManagers;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet(name = "UnsortUsers", value = "/unsort-users")
public class UnsortUsers extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("sorted-memberships");
        response.sendRedirect("users-admin-view.jsp");
    }

}