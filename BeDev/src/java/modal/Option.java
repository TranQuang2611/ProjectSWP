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
public class Option {

    private int optionID;
    private Question question;
    private String content;
    private boolean isTrue;
    private double point;
    
    private int trueOption;
    private int answerOption;

    public Option() {
    }


    public Option(int optionID, String content, boolean isTrue, int answerOption) {
        this.optionID = optionID;
        this.content = content;
        this.isTrue = isTrue;
        this.answerOption = answerOption;
    }
    
    
    public Option(int optionID) {
        this.optionID = optionID;
    }

    public Option(int optionID, Question question, String content, boolean isTrue) {
        this.optionID = optionID;
        this.question = question;
        this.content = content;
        this.isTrue = isTrue;
    }

    public Option(int optionID, Question question, String content) {
        this.optionID = optionID;
        this.question = question;
        this.content = content;
    }

    public Option(int optionID, boolean isTrue) {
        this.optionID = optionID;
        this.isTrue = isTrue;
    }

    public Option(int optionID, double point) {
        this.optionID = optionID;
        this.point = point;
    }

    public Option(int optionID, String content, boolean isTrue, double point) {
        this.optionID = optionID;
        this.content = content;
        this.isTrue = isTrue;
        this.point = point;
    }

    public int getOptionID() {
        return optionID;
    }

    public void setOptionID(int optionID) {
        this.optionID = optionID;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isTrue() {
        return isTrue;
    }

    public void setIsTrue(boolean isTrue) {
        this.isTrue = isTrue;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public int getTrueOption() {
        return trueOption;
    }

    public void setTrueOption(int trueOption) {
        this.trueOption = trueOption;
    }

    public int getAnswerOption() {
        return answerOption;
    }

    public void setAnswerOption(int answerOption) {
        this.answerOption = answerOption;
    }


    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + this.optionID;
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
        final Option other = (Option) obj;
        if (this.optionID != other.optionID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return optionID + "";
    }
    
}
