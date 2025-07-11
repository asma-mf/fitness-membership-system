package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.models.Plan;
import com.example.fitnesssystem.services.MemberShipManagers;
import com.example.fitnesssystem.services.PaymentManagers;
import com.example.fitnesssystem.services.PlanManagers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/BuyMembershipServlet")
public class BuyMembershipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PlanManagers.readPlans();
        try {
            int userID = Integer.parseInt(request.getParameter("userID"));
            int planID = Integer.parseInt(request.getParameter("planID"));
            String startDateStr = request.getParameter("startDate");
            String durationStr = request.getParameter("duration"); // e.g., "1month", "3months"

            // Convert start date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(startDateStr);

            // Calculate end date
            Calendar cal = Calendar.getInstance();
            cal.setTime(startDate);
            switch (durationStr) {
                case "1month":
                    cal.add(Calendar.MONTH, 1);
                    break;
                case "3months":
                    cal.add(Calendar.MONTH, 3);
                    break;
                case "6months":
                    cal.add(Calendar.MONTH, 6);
                    break;
                case "1year":
                    cal.add(Calendar.YEAR, 1);
                    break;
                default:
                    cal.add(Calendar.MONTH, 1);
                    break;
            }
            Date expireDate = cal.getTime();

            Plan selectedPlan = PlanManagers.findPlan(planID);

            double price = 0;
            if (selectedPlan != null) {
                switch (durationStr) {
                    case "1month":
                        price = selectedPlan.getOneMonth();
                        break;
                    case "3months":
                        price = selectedPlan.getThreeMonths();
                        break;
                    case "6months":
                        price = selectedPlan.getSixMonth();
                        break;
                    case "1year":
                        price = selectedPlan.getOneYear();
                        break;
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("planName", selectedPlan.getPlanName());
            session.setAttribute("price", price);
            session.setAttribute("startDate", startDateStr);
            session.setAttribute("duration", durationStr);

            String currentDate = LocalDate.now().toString();
            // Create membership
            MemberShipManagers.createMemberShip(userID, planID, startDate, expireDate, "Active", currentDate);

            String paymentDate = LocalDate.now().toString();
            PaymentManagers.addPayment(userID, paymentDate, price);

            // Redirect to success page
            response.sendRedirect("membershipSuccess.jsp");

        } catch (Exception e) {
            PrintWriter  out = response.getWriter();
            out.write("Something went wrong");
            out.close();
        }
    }
}
