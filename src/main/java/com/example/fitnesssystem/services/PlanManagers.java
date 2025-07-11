package com.example.fitnesssystem.services;
import com.example.fitnesssystem.fileHandling.FileHandler;
import com.example.fitnesssystem.models.Plan;
import java.util.ArrayList;


public class PlanManagers {
    private static ArrayList<Plan> plans = null;
    private static final String fileName = "plans.txt";
    private static int id = 0;

    public static void readPlans() {
        if (plans != null)
            return;

        plans = new ArrayList<>();
        String[] plansDataArray = FileHandler.readFile(fileName);
        int planID = 0;

        for (String planData : plansDataArray) {
            String[] data = planData.split(",");
            planID = Integer.parseInt(data[0]);
            String name = data[1];
            String description = data[2];
            double oneMonth = Double.parseDouble(data[3]);
            double threeMonths = Double.parseDouble(data[4]);
            double sixMonth = Double.parseDouble(data[5]);
            double oneYear = Double.parseDouble(data[6]);

            Plan plan = new Plan(planID, name, description, oneMonth, threeMonths, sixMonth, oneYear);
            plans.add(plan);
        }
        id = planID;
    }

    public static Plan findPlan(int id) {
        for (Plan plan : plans) {
            if (plan.getPlanID() == id) {
                return plan;
            }
        }
        return null;
    }

    public static void addPlan(String name, String description,
                                double oneMonth, double threeMonths, double sixMonth, double oneYear) {
        int newID = getNextID();
        Plan plan = new Plan(newID, name, description, oneMonth, threeMonths, sixMonth, oneYear);
        plans.add(plan);
        FileHandler.writeToFile(fileName, true, plan.toString());
    }

    public static void removePlan(int id) {
        plans.remove(findPlan(id));
        savePlansToFile();
    }

    public static void updatePlan(int id, String name, String description,
                                   double oneMonth, double threeMonths, double sixMonth, double oneYear) {
        Plan plan = findPlan(id);
        if (plan != null) {
            plan.setPlanName(name);
            plan.setPlanDescription(description);
            plan.setOneMonth(oneMonth);
            plan.setThreeMonths(threeMonths);
            plan.setSixMonth(sixMonth);
            plan.setOneYear(oneYear);
        }
        savePlansToFile();
    }

    public static void savePlansToFile() {
        StringBuilder planDetails = new StringBuilder();
        for (Plan plan : plans) {
            planDetails.append(plan.toString());
        }
        FileHandler.writeToFile(fileName, false, planDetails.toString());
    }

    public static int getNextID() {
        return ++id;
    }

    public static ArrayList<Plan> getPlans() {
        return plans;
    }

}


