package com.example.fitnesssystem.services;

import com.example.fitnesssystem.models.User;

import java.util.ArrayList;
import java.util.Arrays;

import com.example.fitnesssystem.fileHandling.FileHandler;

public class UserManagers {
    private static ArrayList<User> users = null;
    private static final String fileName = "users.txt";
    private static int id=0;

    public static void readUsers(){
        if (users!=null) return;
        users=new ArrayList<>();
        String[] fileLines=FileHandler.readFile(fileName);

        System.out.println("File Content :");
        System.out.println(Arrays.toString(fileLines));

        for (String fileLine : fileLines) {
            System.out.println("line : "+ fileLine);

            String [] userDataArray=fileLine.split(",");
            System.out.println("Split line : " + Arrays.toString(userDataArray));

            int userid=Integer.parseInt(userDataArray[0]);
            String name=userDataArray[1];
            String password=userDataArray[2];
            String email=userDataArray[3];
            int age=Integer.parseInt(userDataArray[4]);
            String gender=userDataArray[5];
            String contactNumber=userDataArray[6];
            String address=userDataArray[7];
            double weight=Double.parseDouble(userDataArray[8]);
            double height=Double.parseDouble(userDataArray[9]);

            User user=new User(userid,name,password,email, age, gender, contactNumber, address, weight, height);
            users.add(user);
            id = userid;
        }
    }

    public static int getNextId(){
        return ++id;
    }
    public static void addNewUser(String name, String password, String email,  int age, String gender, String contactNumber, String address, double weight, double height){
        User user=new User(getNextId(), name, password, email, age, gender, contactNumber, address, weight, height);
        users.add(user);
        FileHandler.writeToFile(fileName,true, user.toString());

    }
    public static ArrayList<User> getUsers(){
        return users;
    }
    public static void deleteUser(int id){
        users.removeIf(user -> user.getId()==id);
        saveToFile();

    }
    public static User getUserById(int id){
        for (User user : users) {
            if(user.getId()==id){
                return user;
            }
        }
        return null;
    }
    public static void updateUser(int id, String name, String password, String email,  int age,  String gender,
                                  String contactNumber, String address, double weight, double height){
        User user = getUserById(id);
        if(user!=null){
            user.setName(name);
            user.setPassword(password);
            user.setEmail(email);
            user.setAge(age);
            user.setGender(gender);
            user.setContactNumber(contactNumber);
            user.setAddress(address);
            user.setWeight(weight);
            user.setHeight(height);
            saveToFile();
        }
    }
    public static void saveToFile(){
        String data="";
        for (User user : users) {
            data += user.toString();
        }
        FileHandler.writeToFile(fileName,false, data);
    }

    public static User getUserByLogin(String email, String password){
        for (User user : users) {
            if(user.getEmail().equals(email) && user.getPassword().equals(password)){
                return user;
            }
        }
        return null;
    }


}
