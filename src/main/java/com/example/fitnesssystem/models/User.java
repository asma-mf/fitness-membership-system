package com.example.fitnesssystem.models;

public class User extends Admin {
    private int age;
    private String gender;
    private String contactNumber;
    private String address;
    private double weight;
    private double height;
    private String imagePath;

    public User(int id, String name, String password, String email,  int age,  String gender,
                String contactNumber, String address, double weight, double height) {
        super(id, name, password, email);
        this.age = age;
        this.gender = gender;
        this.contactNumber = contactNumber;
        this.address = address;
        this.weight = weight;
        this.height = height;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }



    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public String getImagePath() {return imagePath;}
    public void setImagePath(String imagePath) {this.imagePath = imagePath;}


    @Override
    public String toString(){
        return id+","+name+","+password+","+email+","+age+","+
                gender+","+contactNumber+","+address+","+weight+","+height+"\n";
    }
}

