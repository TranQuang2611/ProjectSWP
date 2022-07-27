/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author ACER
 */
public class Student {
    private int studentID;
    private Account account;
    private String name;
    private double cashInWallet;
    private String imageURL;

    public Student() {
    }

    public Student(int studentID, String name, double cashInWallet, String imageURL) {
        this.studentID = studentID;
        this.name = name;
        this.cashInWallet = cashInWallet;
        this.imageURL = imageURL;
    }
    
    public Student(Account account, String name, double cashInWallet, String imageURL) {
        this.account = account;
        this.name = name;
        this.cashInWallet = cashInWallet;
        this.imageURL = imageURL;
    }

    public Student(Account account) {
        this.account = account;
    }
    
    

    public Student(Account account, String name, String imageURL) {
        this.account = account;
        this.name = name;
        this.imageURL = imageURL;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCashInWallet() {
        return cashInWallet;
    }

    public void setCashInWallet(double cashInWallet) {
        this.cashInWallet = cashInWallet;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
    
    
}
