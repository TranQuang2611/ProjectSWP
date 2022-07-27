/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class Transaction {
    private int transactionID;
    private Student student;
    private LocalDateTime time;
    private float amount;
    private Course course;
    private Expert expert;
    
    public Transaction() {
    }

    public Transaction(int transactionID, Student student, LocalDateTime time, float amount, Course course) {
        this.transactionID = transactionID;
        this.student = student;
        this.time = time;
        this.amount = amount;
        this.course = course;
    }

    public Transaction(int transactionID, Student student, LocalDateTime time, float amount, Course course, Expert expert) {
        this.transactionID = transactionID;
        this.student = student;
        this.time = time;
        this.amount = amount;
        this.course = course;
        this.expert = expert;
    }

    
    
    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    
}
