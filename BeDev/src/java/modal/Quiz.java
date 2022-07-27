/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class Quiz {
    private int quizID;
    private String quizName;
    private double passRate;
    private int position;
    private Chapter chapter;
    private boolean status;
    private ArrayList<Question> questionList;
    private double grade;
    private  boolean  checkQuizrecord;
    public Quiz() {
    }

    public Quiz(int quizID) {
        this.quizID = quizID;
    }

    public Quiz(int quizID, String quizName, double passRate, boolean status) {
        this.quizID = quizID;
        this.quizName = quizName;
        this.passRate = passRate;
        this.status = status;
    }
    

    public Quiz(int quizID, String quizName, int position) {
        this.quizID = quizID;
        this.quizName = quizName;
        this.position = position;
    }

    public Quiz(int quizID, String quizName, double passRate, int position, Chapter chapter, boolean status, ArrayList<Question> questionList) {
        this.quizID = quizID;
        this.quizName = quizName;
        this.passRate = passRate;
        this.position = position;
        this.chapter = chapter;
        this.status = status;
        this.questionList = questionList;
    }

    public Quiz(int quizID, String quizName, double passRate) {
        this.quizID = quizID;
        this.quizName = quizName;
        this.passRate = passRate;
    }

    public boolean isCheckQuizrecord() {
        return checkQuizrecord;
    }

    public void setCheckQuizrecord(boolean checkQuizrecord) {
        this.checkQuizrecord = checkQuizrecord;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public double getPassRate() {
        return passRate;
    }

    public void setPassRate(double passRate) {
        this.passRate = passRate;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(ArrayList<Question> questionList) {
        this.questionList = questionList;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
    
}
