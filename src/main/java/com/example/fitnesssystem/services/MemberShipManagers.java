package com.example.fitnesssystem.services;

import com.example.fitnesssystem.dsa.Queue;
import com.example.fitnesssystem.models.MemberShip;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class MemberShipManagers {
    private static ArrayList<MemberShip> memberShips = new ArrayList<>();
    private static Queue pendingMemberships = null;
    private static int nextMemberShipID = 1;

    private static final String FILE_NAME = "memberships.txt";
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    // Load from file
    public static void loadMemberShips() {
        memberShips.clear();
        pendingMemberships = new Queue();
        File file = new File(FILE_NAME);
        if (!file.exists()) return;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    int id = Integer.parseInt(parts[0]);
                    int userId = Integer.parseInt(parts[1]);
                    int planId = Integer.parseInt(parts[2]);
                    Date startDate = sdf.parse(parts[3]);
                    Date endDate = sdf.parse(parts[4]);
                    String status = parts[5];
                    String renewalDate = parts[6];

                    MemberShip m = new MemberShip(id, userId, planId, startDate, endDate, status, renewalDate);
                    memberShips.add(m);
                    if (m.getStatus().equalsIgnoreCase("pending")){
                        pendingMemberships.insertMemberShip(m);
                    }
                    nextMemberShipID = Math.max(nextMemberShipID, id + 1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Save to file
    private static void saveMemberShips() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_NAME))) {
            for (MemberShip m : memberShips) {
                bw.write(m.getMemberShipID() + "," +
                        m.getUserID() + "," +
                        m.getPlanID() + "," +
                        sdf.format(m.getStartDate()) + "," +
                        sdf.format(m.getExpireDate()) + "," +
                        m.getStatus() + "," +
                        m.getRenewalRequestDate());
                        bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Create and save a new membership
    public static void createMemberShip(int userID, int planID, Date startDate, Date expireDate,
                                        String status, String renewalDate) {
        MemberShip newMemberShip = new MemberShip(nextMemberShipID++, userID, planID, startDate, expireDate, status, renewalDate);
        memberShips.add(newMemberShip);
        saveMemberShips(); // Save after adding
    }

    // Find by ID
    public static MemberShip findMemberShip(int memberShipID) {
        for (MemberShip m : memberShips) {
            if (m.getMemberShipID() == memberShipID) {
                return m;
            }
        }
        return null;
    }

    // Get all
    public static ArrayList<MemberShip> getAllMemberShips() {
        return memberShips;
    }

    // Get by user ID
    public static MemberShip getMemberShipsByUserID(int userID) {
        for (MemberShip m : memberShips) {
            if (m.getUserID() == userID) {
                return m;
            }
        }
        return null;
    }

    // Delete
    public static boolean deleteMemberShip(int memberShipID) {
        boolean removed = memberShips.removeIf(m -> m.getMemberShipID() == memberShipID);
        if (removed) {
            saveMemberShips(); // Save after deleting
            pendingMemberships = new Queue();
            for (MemberShip m : memberShips) {
                pendingMemberships.insertMemberShip(m);
            }
        }
        return removed;
    }

    public static void renewalRequest(int id, Date startDate, Date expireDate, String renewalDate) {
        MemberShip m = findMemberShip(id);

        m.setStatus("Pending");
        m.setStartDate(startDate);
        m.setExpireDate(expireDate);
        m.setRenewalRequestDate(renewalDate);

        pendingMemberships.insertMemberShip(m);
        saveMemberShips();
    }

    // Update status
    public static void renewalAccept(){
        pendingMemberships.removeMemberShip().setStatus("Active");
        saveMemberShips();
    }

    public static Queue getPendingMemberships() {
        return pendingMemberships;
    }
}
