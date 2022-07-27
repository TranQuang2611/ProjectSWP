/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.util.List;

/**
 *
 * @author ACER
 */
public class Chapter {
    private int chapterID;
    private String chapterName;
    private Course course;
    private int position;
    private boolean status;
    private List<Lesson> lessons;
    private Quiz quiz;

    public Chapter() {
    }

    public Chapter(int chapterID, String chapterName) {
        this.chapterID = chapterID;
        this.chapterName = chapterName;
    }
    
    public Chapter(int chapterID, String chapterName, Course course, int position, boolean status) {
        this.chapterID = chapterID;
        this.chapterName = chapterName;
        this.course = course;
        this.position = position;
        this.status = status;
    }
    
    public Chapter(int chapterID, String chapterName, int position, List<Lesson> lessons, Quiz quiz) {
        this.chapterID = chapterID;
        this.chapterName = chapterName;
        this.position = position;
        this.lessons = lessons;
        this.quiz = quiz;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
