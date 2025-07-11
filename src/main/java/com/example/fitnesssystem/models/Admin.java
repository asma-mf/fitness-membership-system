package com.example.fitnesssystem.models;

public class Admin {
    protected int id;
    protected String name;
    protected String password;
    protected String email;

    public Admin(int id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void displaydDetails() {
        System.out.println(" ID" + id);
        System.out.println(" Name" + name);
        System.out.println(" Password" + password);
        System.out.println(" Email" + email);

    }

    public String toString() {
        return "ID: " + id + " Name: " + name + " Password: " + password + " Email: " + email;
    }


    public int getID() {
        return id;
    }
}
