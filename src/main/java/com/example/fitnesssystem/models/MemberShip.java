package com.example.fitnesssystem.models;

import java.util.Date;

public class MemberShip {
    private int memberShipID;
    private int userID;
    private int planID;
    private Date startDate;
    private Date expireDate;
    private String status;
    private String renewalRequestDate;

    public MemberShip(int memberShipID, int userID, int planID, Date startDate, Date expireDate, String status, String renewalRequestDate) {
        this.memberShipID = memberShipID;
        this.userID = userID;
        this.planID = planID;
        this.startDate = startDate;
        this.expireDate = expireDate;
        this.status = status;
        this.renewalRequestDate = renewalRequestDate;
    }

    public int getMemberShipID() {
        return memberShipID;
    }

    public void setMemberShipID(int memberShipID) {
        this.memberShipID = memberShipID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPlanID() {
        return planID;
    }

    public void setPlanID(int planID) {
        this.planID = planID;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRenewalRequestDate() {
        return renewalRequestDate;
    }

    public void setRenewalRequestDate(String renewalRequestDate) {
        this.renewalRequestDate = renewalRequestDate;
    }
}
