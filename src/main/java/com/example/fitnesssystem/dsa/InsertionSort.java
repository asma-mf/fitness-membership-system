package com.example.fitnesssystem.dsa;

import com.example.fitnesssystem.models.MemberShip;

public class InsertionSort {
    public static int toInt(String dateString) {
        return Integer.parseInt(dateString.replace("-", ""));
    }


    public static void insertionSort(MemberShip[] arr) {
        for (int i = 1; i < arr.length; i++) {
            MemberShip key = arr[i];
            int j = i - 1;

            while (j >= 0 && toInt(arr[j].getRenewalRequestDate()) > toInt(key.getRenewalRequestDate()) ) {
                arr[j + 1] = arr[j];
                j--;
            }

            arr[j + 1] = key;
        }
    }

}
