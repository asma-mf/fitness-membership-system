package com.example.fitnesssystem.services;

import com.example.fitnesssystem.fileHandling.FileHandler;
import com.example.fitnesssystem.models.Payment;

import java.util.ArrayList;

public class PaymentManagers {
    private static ArrayList<Payment> payments = null;
    private static final String fileName = "payments.txt";
    private static int id = 0;

    public static void readPayments() {
        if (payments != null)
            return;

        payments = new ArrayList<>();
        String[] paymentDataArray = FileHandler.readFile(fileName);
        int paymentID = 0;

        for (String paymentData : paymentDataArray) {
            String[] data = paymentData.split(",");
            paymentID = Integer.parseInt(data[0]);
            int userID = Integer.parseInt(data[1]);
            String paymentDate = data[2];
            double amount = Double.parseDouble(data[3]);

            payments.add(new Payment(paymentID, userID, paymentDate, amount));
        }

        id = paymentID;
    }

    public static void addPayment(int userID, String paymentDate, double amount) {
        int paymentID = getNextID();
        Payment payment = new Payment(paymentID, userID, paymentDate, amount);
        payments.add(payment);
        FileHandler.writeToFile(fileName, true, payment.toString());
    }

    public static Payment findPayment(int paymentID) {
        for (Payment payment : payments) {
            if (payment.getId() == paymentID) {
                return payment;
            }
        }
        return null;
    }

    public static ArrayList<Payment> getPaymentsByUserID(int userID) {
        ArrayList<Payment> userPayments = new ArrayList<>();
        for (Payment payment : payments) {
            if (payment.getUserID() == userID) {
                userPayments.add(payment);
            }
        }
        return userPayments;
    }

    public static void savePaymentsToFile() {
        StringBuilder sb = new StringBuilder();
        for (Payment payment : payments) {
            sb.append(payment.toString());
        }
        FileHandler.writeToFile(fileName, false, sb.toString());
    }

    public static int getNextID() {
        return ++id;
    }

    public static ArrayList<Payment> getAllPayments() {
        return payments;
    }
}
