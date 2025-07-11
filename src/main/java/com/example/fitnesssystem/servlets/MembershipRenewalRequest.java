package com.example.fitnesssystem.servlets;

import com.example.fitnesssystem.models.MemberShip;
import com.example.fitnesssystem.models.Plan;
import com.example.fitnesssystem.services.MemberShipManagers;
import com.example.fitnesssystem.services.PaymentManagers;
import com.example.fitnesssystem.services.PlanManagers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "MembershipRenewalRequest", value = "/request-renewal")
public class MembershipRenewalRequest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int membershipId = Integer.parseInt(request.getParameter("membershipID"));
            String startDateStr = request.getParameter("startDate");
            String durationStr = request.getParameter("duration");
            int userID = Integer.parseInt(request.getParameter("userID"));

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

            MemberShip memberShip = MemberShipManagers.findMemberShip(membershipId);
            Plan selectedPlan = PlanManagers.findPlan(memberShip.getPlanID());

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

            String currentDate = LocalDate.now().toString();
            MemberShipManagers.renewalRequest(membershipId, startDate, expireDate, currentDate);
            String paymentDate = LocalDate.now().toString();
            PaymentManagers.addPayment(userID, paymentDate, price);

            response.sendRedirect("currentMembership.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}

