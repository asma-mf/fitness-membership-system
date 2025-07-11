package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.services.MemberShipManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "MembershipRenewalAccept", value = "/accept-renewal")
public class MembershipRenewalAccept extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MemberShipManagers.renewalAccept();

        response.sendRedirect("membership-pending-admin-view.jsp");
    }
}

