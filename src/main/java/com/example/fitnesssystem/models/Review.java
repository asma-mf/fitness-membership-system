package com.example.fitnesssystem.models;

public class Review {
    private int reviewID;
    private int userID;
    private int planID;
    private String reviewText;
    private int rating;

    public Review(int reviewID, int userID, int planID, String reviewText, int rating) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.planID = planID;
        this.reviewText = reviewText;
        this.rating = rating;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
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

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return reviewID + "," + userID + "," + planID + "," + reviewText + "," + rating + "," + "\n";
    }
}
