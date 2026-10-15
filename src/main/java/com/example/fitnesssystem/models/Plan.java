package com.example.fitnesssystem.models;

public class Plan {
    private int planID;
    private String planName;
    private String planDescription;
    private double oneMonth;
    private double threeMonths;
    private double sixMonth;
    private double oneYear;

    public Plan(int planID, String planName, String planeDescription, double oneMonth, double threeMonths, double sixMonth, double oneYear) {
        this.planID = planID;
        this.planName = planName;
        this.planDescription = planeDescription;
        this.oneMonth = oneMonth;
        this.threeMonths = threeMonths;
        this.sixMonth = sixMonth;
        this.oneYear = oneYear;
    }

    public int getPlanID() {
        return planID;
    }

    public void setPlanID(int planID) {
        this.planID = planID;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getPlanDescription() {
        return planDescription;
    }

    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }

    public double getOneMonth() {
        return oneMonth;
    }

    public void setOneMonth(double oneMonth) {
        this.oneMonth = oneMonth;
    }

    public double getThreeMonths() {
        return threeMonths;
    }

    public void setThreeMonths(double threeMonths) {
        this.threeMonths = threeMonths;
    }

    public double getSixMonth() {
        return sixMonth;
    }

    public void setSixMonth(double sixMonth) {
        this.sixMonth = sixMonth;
    }

    public double getOneYear() {
        return oneYear;
    }

    public void setOneYear(double oneYear) {
        this.oneYear = oneYear;
    }
    @Override
    public String toString() {
        return planID + "," + planName + "," + planDescription + "," +
                oneMonth + "," + threeMonths + "," + sixMonth + "," + oneYear + "\n";
    }
}
