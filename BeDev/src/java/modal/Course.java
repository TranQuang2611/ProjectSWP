/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Course {

    private int courseID;
    private String courseName;
    private String description;
    private String courseImage;
    private Expert expert;
    private double money;
    private Date releasedDate;
    private boolean status;
    private int numberRegister;
    private int numberLesson;
    private int averageStar;
    private float percentOfComplete;
    private Category category;
    private int numberOfViews;
    private int numberOfRating;
    private double totalEarn;
    private int totalLession;
    private int totalLearned;

    public Course() {
    }

    public Course(int courseID) {
        this.courseID = courseID;
    }

    public Course(int courseID, String courseName) {
        this.courseID = courseID;
        this.courseName = courseName;
    }

    public Course(int totalLession, int totalLearned) {
        this.totalLession = totalLession;
        this.totalLearned = totalLearned;
    }

    public Course(int courseID, String courseName, String courseImage, Expert expert) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.courseImage = courseImage;
        this.expert = expert;
    }

    public Course(int courseID, String courseName, String description, String courseImage, Expert expert, double money, Date releasedDate, boolean status) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.expert = expert;
        this.money = money;
        this.releasedDate = releasedDate;
        this.status = status;
    }

    public Course(int courseID, String courseName, String description, String courseImage, Expert expert, double money, Date releasedDate, boolean status, int numberRegister) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.expert = expert;
        this.money = money;
        this.releasedDate = releasedDate;
        this.status = status;
        this.numberRegister = numberRegister;
    }

    public Course(int courseID, String courseName, String description, String courseImage, Expert expert, double money, Date releasedDate, boolean status, int numberRegister, int numberLesson) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.expert = expert;
        this.money = money;
        this.releasedDate = releasedDate;
        this.status = status;
        this.numberRegister = numberRegister;
        this.numberLesson = numberLesson;
    }

    public Course(int courseID, String courseName, String courseImage, Expert expert, double money, int numberRegister, int numberLesson, int averageStar) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.courseImage = courseImage;
        this.expert = expert;
        this.money = money;
        this.numberRegister = numberRegister;
        this.numberLesson = numberLesson;
        this.averageStar = averageStar;
    }

    public Course(int courseID, String courseName, String description, String courseImage, Expert expert, double money, Date releasedDate, int numberRegister, int numberLesson, int averageStar) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.expert = expert;
        this.money = money;
        this.releasedDate = releasedDate;
        this.numberRegister = numberRegister;
        this.numberLesson = numberLesson;
        this.averageStar = averageStar;
    }

    public Course(int courseID, String courseName, String description, String courseImage, double money, Date releasedDate, boolean status, Category category) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.money = money;
        this.releasedDate = releasedDate;
        this.status = status;
        this.category = category;
    }

    public Course(int courseID, String courseName, double money, int numberOfViews, int numberRegister, int averageStar, int numberOfRating) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.money = money;
        this.numberOfViews = numberOfViews;
        this.numberRegister = numberRegister;
        this.averageStar = averageStar;
        this.numberOfRating = numberOfRating;
    }

    public Course(int courseID, String courseName, String description, String courseImage, double money, boolean status, Category category) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.money = money;
        this.status = status;
        this.category = category;
    }

    public Course(int courseID, String courseName, int numberOfViews, int numberRegister, double totalEarn, int averageStar, int numberOfRating) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.numberRegister = numberRegister;
        this.averageStar = averageStar;
        this.numberOfViews = numberOfViews;
        this.numberOfRating = numberOfRating;
        this.totalEarn = totalEarn;
    }

    public double getTotalEarn() {
        return totalEarn;
    }

    public void setTotalEarn(double totalEarn) {
        this.totalEarn = totalEarn;
    }

    public int getNumberOfViews() {
        return numberOfViews;
    }

    public void setNumberOfViews(int numberOfViews) {
        this.numberOfViews = numberOfViews;
    }

    public int getNumberOfRating() {
        return numberOfRating;
    }

    public void setNumberOfRating(int numberOfRating) {
        this.numberOfRating = numberOfRating;
    }

    public Course(int courseID, String courseName, String description, String courseImage, Expert expert) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.courseImage = courseImage;
        this.expert = expert;
    }     
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getAverageStar() {
        return averageStar;
    }

    public void setAverageStar(int averageStar) {
        this.averageStar = averageStar;
    }

    public int getNumberLesson() {
        return numberLesson;
    }

    public void setNumberLesson(int numberLesson) {
        this.numberLesson = numberLesson;
    }

    public int getNumberRegister() {
        return numberRegister;
    }

    public void setNumberRegister(int numberRegister) {
        this.numberRegister = numberRegister;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(String courseImage) {
        this.courseImage = courseImage;
    }

    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Date getReleasedDate() {
        return releasedDate;
    }

    public void setReleasedDate(Date releasedDate) {
        this.releasedDate = releasedDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getTotalLession() {
        return totalLession;
    }

    public void setTotalLession(int totalLession) {
        this.totalLession = totalLession;
    }

    public int getTotalLearned() {
        return totalLearned;
    }

    public void setTotalLearned(int totalLearned) {
        this.totalLearned = totalLearned;
    }

//    public float getPercentOfComplete() {
//        String format = String.format("%0.02f", (float) totalLearned / totalLession);
//        return Float.parseFloat(format);
//    }
    public float getPercentOfComplete() {
        return (float) totalLearned / totalLession;
    }

    public void setPercentOfComplete() {
        this.percentOfComplete = (float) totalLearned / totalLession;
    }

    @Override
    public String toString() {
        return "Course{" + "courseID=" + courseID + ", courseName=" + courseName + ", description=" + description + ", courseImage=" + courseImage + ", expert=" + expert + ", money=" + money + ", releasedDate=" + releasedDate + ", status=" + status + ", numberRegister=" + numberRegister + ", numberLesson=" + numberLesson + '}';
    }

}
