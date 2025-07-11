package com.example.fitnesssystem.services;
import com.example.fitnesssystem.fileHandling.FileHandler;
import com.example.fitnesssystem.models.Review;
import java.util.ArrayList;

public class ReviewManagers {
    private static ArrayList<Review> reviews = null;
    private static final String fileName = "reviews.txt";
    private static int id = 0;

    public static void readReviews() {
        if (reviews != null)
            return;

        reviews = new ArrayList<>();
        String[] reviewDataArray = FileHandler.readFile(fileName);
        int reviewID = 0;

        for (String reviewData : reviewDataArray) {
            String[] data = reviewData.split(",");
            reviewID = Integer.parseInt(data[0]);
            int userID = Integer.parseInt(data[1]);
            int planID = Integer.parseInt(data[2]);
            String reviewText = data[3];
            int rating = Integer.parseInt(data[4]);

            Review review = new Review(reviewID, userID, planID, reviewText, rating);
            reviews.add(review);
        }
        id = reviewID;
    }

    public static void addReview(int userID, int planID, String reviewText, int rating) {
        int reviewID = getNextID();
        Review review = new Review(reviewID, userID, planID, reviewText, rating);
        reviews.add(review);
        FileHandler.writeToFile(fileName, true, review.toString());
    }

    public static void removeReview(int reviewID) {
        reviews.remove(findReview(reviewID));
        saveReviewsToFile();
    }

    public static void updateReview(int reviewID, String reviewText, int rating) {
        Review review = findReview(reviewID);
        if (review != null) {
            review.setReviewText(reviewText);
            review.setRating(rating);
        }
        saveReviewsToFile();
    }

    public static Review findReview(int reviewID) {
        for (Review review : reviews) {
            if (review.getReviewID() == reviewID) {
                return review;
            }
        }
        return null;
    }

    public static ArrayList<Review> getReviewsByplanID(int planID) {
        ArrayList<Review> planReviews = new ArrayList<>();
        for (Review review : reviews) {
            if (review.getPlanID() == planID) {
                planReviews.add(review);
            }
        }
        return planReviews;
    }

    public static void saveReviewsToFile() {
        StringBuilder reviewDetails = new StringBuilder();
        for (Review review : reviews) {
            reviewDetails.append(review.toString());
        }
        FileHandler.writeToFile(fileName, false, reviewDetails.toString());
    }

    public static int getNextID() {
        return ++id;
    }

    public static ArrayList<Review> getAllReviews() {
        return reviews;
    }
}

