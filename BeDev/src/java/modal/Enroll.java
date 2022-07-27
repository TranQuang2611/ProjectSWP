/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Enroll {
    private Course course;
    private Student student;
    private Date registerDate;
    private int numberRegisted;

    public Enroll() {
    }

    public Enroll(Course course, Student student, Date registerDate, int numberRegisted) {
        this.course = course;
        this.student = student;
        this.registerDate = registerDate;
        this.numberRegisted = numberRegisted;
    }
    
    public Enroll(Course course, int numberRegisted) {
        this.course = course;
        this.numberRegisted = numberRegisted;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public int getNumberRegisted() {
        return numberRegisted;
    }

    public void setNumberRegisted(int numberRegisted) {
        this.numberRegisted = numberRegisted;
    }
    
    
    
}
