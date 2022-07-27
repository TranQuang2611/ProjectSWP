/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author admin
 */
public class Rate {
    private int rateID;
    private int star;
    private Student student;
    private String content;
    private Course course;

    public Rate() {
    }

    public Rate(int star, String content) {
        this.star = star;
        this.content = content;
    }

    public Rate(int star, Course course) {
        this.star = star;
        this.course = course;
    }

    public Rate(int rateID, int star, Student student, String content, Course course) {
        this.rateID = rateID;
        this.star = star;
        this.student = student;
        this.content = content;
        this.course = course;
    }

    public Rate(int rateID, int star, Student student, String content) {
        this.rateID = rateID;
        this.star = star;
        this.student = student;
        this.content = content;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
    
    

    public int getRateID() {
        return rateID;
    }

    public void setRateID(int rateID) {
        this.rateID = rateID;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    
}
