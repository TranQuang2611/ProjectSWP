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
public class Question {
    private int questionID;
    private String content;
    private String explanation;
    private Quiz quiz;
    private boolean status;
    private ArrayList<Option> optionList;
    private double pointPerQuestion;
    private boolean multipleChoice;
    private int numberTrueOption;
    private ArrayList<Option> answerList;
    private ArrayList<Option> compareList;
    private int numberAnswer;
    private int checkQuestionCompleted;
    private Expert expert;
    
    public Question() {
    }

    public Question(int questionID, String content, String explanation, boolean status, int checkQuestionCompleted) {
        this.questionID = questionID;
        this.content = content;
        this.explanation = explanation;
        this.status = status;
        this.checkQuestionCompleted = checkQuestionCompleted;
    }

    public Question(int questionID, String content, String explanation, boolean status, int checkQuestionCompleted, Expert expert) {
        this.questionID = questionID;
        this.content = content;
        this.explanation = explanation;
        this.status = status;
        this.checkQuestionCompleted = checkQuestionCompleted;
        this.expert = expert;
    }
    
    public Question(int questionID) {
        this.questionID = questionID;
    }

    public Question(int questionID, String content, String explanation, int numberTrueOption) {
        this.questionID = questionID;
        this.content = content;
        this.explanation = explanation;
        this.numberTrueOption = numberTrueOption;
    }
    
    
    
    public Question(int questionID, String content, String explaination, Quiz quiz, boolean status, ArrayList<Option> answerList) {
        this.questionID = questionID;
        this.content = content;
        this.explanation = explaination;
        this.quiz = quiz;
        this.status = status;
        this.optionList = answerList;
    }

    public Question(int questionID, String content, String explaination, Quiz quiz, boolean status) {
        this.questionID = questionID;
        this.content = content;
        this.explanation = explaination;
        this.quiz = quiz;
        this.status = status;
    }

    public Question(int questionID, double pointPerQuestion) {
        this.questionID = questionID;
        this.pointPerQuestion = pointPerQuestion;
    }

    public Question(int questionID, ArrayList<Option> optionList) {
        this.questionID = questionID;
        this.optionList = optionList;
    }
    
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<Option> getOptionList() {
        return optionList;
    }

    public void setOptionList(ArrayList<Option> optionList) {
        this.optionList = optionList;
    }

    public double getPointPerQuestion() {
        return pointPerQuestion;
    }

    public void setPointPerQuestion(double pointPerQuestion) {
        this.pointPerQuestion = pointPerQuestion;
    }

    public boolean isMultipleChoice() {
        return multipleChoice;
    }

    public void setMultipleChoice(boolean multipleChoice) {
        this.multipleChoice = multipleChoice;
    }

    public int getNumberTrueOption() {
        return numberTrueOption;
    }

    public void setNumberTrueOption(int numberTrueOption) {
        this.numberTrueOption = numberTrueOption;
    }

    public ArrayList<Option> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(ArrayList<Option> answerList) {
        this.answerList = answerList;
    }

    public ArrayList<Option> getCompareList() {
        return compareList;
    }

    public void setCompareList(ArrayList<Option> compareList) {
        this.compareList = compareList;
    }

    public int getNumberAnswer() {
        return numberAnswer;
    }

    public void setNumberAnswer(int numberAnswer) {
        this.numberAnswer = numberAnswer;
    }

    public int getCheckQuestionCompleted() {
        return checkQuestionCompleted;
    }

    public void setCheckQuestionCompleted(int checkQuestionCompleted) {
        this.checkQuestionCompleted = checkQuestionCompleted;
    }

    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }

    
    
    
    
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + this.questionID;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Question other = (Question) obj;
        if (this.questionID != other.questionID) {
            return false;
        }
        return true;
    }
    
}
