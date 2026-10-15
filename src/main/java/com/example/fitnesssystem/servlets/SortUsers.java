package com.example.fitnesssystem.servlets;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

import com.example.fitnesssystem.dsa.InsertionSort;
import com.example.fitnesssystem.models.MemberShip;
import com.example.fitnesssystem.services.MemberShipManagers;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "SortUsers", value = "/sort-users")
public class SortUsers extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<MemberShip> memberships = MemberShipManagers.getAllMemberShips();
        MemberShip[] memberShipsSortedArr = (memberships.toArray(new MemberShip[0]));
        InsertionSort.insertionSort(memberShipsSortedArr);
        ArrayList<MemberShip> memberShipsSorted = new ArrayList<>(Arrays.asList(memberShipsSortedArr));

        HttpSession session = request.getSession();
        session.setAttribute("sorted-memberships", memberShipsSorted);
        response.sendRedirect("users-admin-view.jsp");
    }

}