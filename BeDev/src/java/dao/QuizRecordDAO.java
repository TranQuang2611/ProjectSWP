/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import modal.QuizRecord;

/**
 *
 * @author admin
 */
public class QuizRecordDAO extends DBContext {

    /**
     * This method get list of quiz record done by student
     *
     * @param sid is student id
     * @param qid is quiz id
     * @return a quiz record
     */
    public ArrayList<QuizRecord> listRecord(int sid, int qid) {
        ArrayList<QuizRecord> list = new ArrayList<>();
        try {
            String sql = "select qu1.quizRecordID, qu1.grade, qu1.time, qu2.number_correct_answer, qu1.numberQuestion, qu2.quizID from\n"
                    + "(select ar.quizRecordID, count(distinct(ar.questionID)) as numberQuestion, qr.grade, qr.time\n"
                    + "from Answer_Record ar \n"
                    + "join Quiz_Record qr on ar.quizRecordID = qr.quizRecordID\n"
                    + "group by ar.quizRecordID,qr.grade, qr.time\n"
                    + ") qu1\n"
                    + "join\n"
                    + "(select qr.quizRecordID, qr.quizID , count(distinct(a.questionID)) as number_correct_answer from\n"
                    + "(select ar.questionID, ar.quizRecordID, o.optionID, o.content, o.isTrue, ar.answerID from [Option] o\n"
                    + "left join Answer_Record ar\n"
                    + "on o.questionID = ar.questionID and o.optionID = ar.answerID)  a\n"
                    + "right join Quiz_Record qr on qr.quizRecordID = a.quizRecordID and qr.quizID =? and qr.studentID =? and a.isTrue = 1 and a.answerID = a.optionID\n"
                    + "group by qr.quizID, qr.quizRecordID ) qu2\n"
                    + "on qu1.quizRecordID = qu2.quizRecordID "
                    + "order by qu1.time desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            stm.setInt(2, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new QuizRecord(rs.getInt(1), rs.getFloat(2), rs.getTimestamp(3).toLocalDateTime(), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method is a record of grade and passrate of quiz in a quiz record
     * completed by student
     *
     * @param rid is recordID
     * @param qid is quiz id
     * @param sid is student id
     * @return a quiz record
     */
    public QuizRecord compareGrade(int rid, int qid, int sid) {
        try {
            String sql = "select qr.grade, q.passRate, q.quizName from Quiz_Record qr, Quiz q\n"
                    + "where qr.quizID =  q.quizID and qr.quizRecordID = ? and q.quizID = ? and qr.studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setInt(2, qid);
            stm.setInt(3, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new QuizRecord(rs.getFloat(1), rs.getInt(2), rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method used to check quiz record existed in database
     *
     * @param sid is student id
     * @param rid is record id
     * @return number of quiz record
     */
    public int checkExistQuizRecord(int sid, int rid) {
        try {
            String sql = "select count(qr.quizRecordID) from Quiz_Record qr\n"
                    + "where qr.studentID = ? and qr.quizRecordID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, rid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * This method get name of a quiz
     *
     * @param qid is a quiz id
     * @return a name of quiz
     */
    public QuizRecord nameOfQuiz(int qid) {
        try {
            String sql = "select quizName from Quiz\n"
                    + "where quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new QuizRecord(0, 0, rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     * This method get a quiz record
     *
     * @param studentID
     * @param quizID
     * @return a quiz record
     */
    public QuizRecord getGrade(String quizID, int studentID) {
        try {
            String sql = "select top 1 quizRecordID, grade from Quiz_Record "
                    + "where studentID = ? and quizID = ? order by time desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentID);
            stm.setString(2, quizID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new QuizRecord(rs.getInt(1), rs.getFloat(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public boolean checkQuizRecordExist(int quizID){
        try {
            String sql ="select * from Quiz_record q where q.quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public static void main(String[] args) {
        QuizRecordDAO d = new QuizRecordDAO();
        System.out.println(d.listRecord(10, 1).size());
    }
}
