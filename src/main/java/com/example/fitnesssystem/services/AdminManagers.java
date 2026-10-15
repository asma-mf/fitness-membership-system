package com.example.fitnesssystem.services;


import com.example.fitnesssystem.fileHandling.FileHandler;
import com.example.fitnesssystem.models.Admin;
import java.util.ArrayList;


public class AdminManagers {

    private static ArrayList<Admin> admins = null;
    private static final String fileName = "admins.txt";
    private static int id = 0;

    public static void readAdmins() {
        if (admins != null)
            return;

        admins = new ArrayList<>();
        admins.add(new Admin(0, "Admin", "123", "admin@gmail.com"));

        String[] adminsDataArray = FileHandler.readFile(fileName);
        int adminID = 0;

        for (String adminsData : adminsDataArray) {
            String[] adminDataArray = adminsData.split(",");
            adminID = Integer.parseInt(adminDataArray[0]);
            String name = adminDataArray[1];
            String password = adminDataArray[2];
            String email = adminDataArray[3];

            Admin admin = new Admin(adminID, name, password, email);
            admins.add(admin);
        }
        id = adminID;
    }

    public static Admin findAdmin(int id) {
        for (Admin admin : admins) {
            if (admin.getId() == id) {
                return admin;
            }
        }
        return null;
    }

    public static void addAdmin(int id, String name, String password, String email) {
        Admin admin = new Admin(id, name, password, email);
        admins.add(admin);
        FileHandler.writeToFile(fileName, true, admin.toString());

    }

    public static void removeAdmin(int id) {
        admins.remove(findAdmin(id));
        saveAdminsToFile();
    }

    public static void UpdateAdmin(int id, String name, String password, String email) {
        Admin admin = findAdmin(id);
        if (admin != null) {
            admin.setName(name);
            admin.setPassword(password);
            admin.setEmail(email);
        }
        saveAdminsToFile();
    }

    public static void saveAdminsToFile() {
        String adminDetails = "";
        for (Admin admin : admins) {
            if (admin.getId() != 0) {
                adminDetails += admin.toString();
            }
        }
        FileHandler.writeToFile(fileName, false, adminDetails);
    }


    public static int getNextID() {
        return ++id;
    }

    public static ArrayList<Admin> getAdmins() {
        return admins;
    }
}






