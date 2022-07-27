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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modal.Quiz;

/**
 *
 * @author ACER
 */
public class QuizDAO extends DBContext {

    /**
     * This method get quiz by id.
     *
     * @param quizID id of quiz
     * @return Quiz
     */
    public Quiz getQuizByID(int quizID) {
        try {
            String sql = "select q.quizName, q.passRate from Quiz q where q.quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Quiz(quizID, rs.getNString(1), rs.getDouble(2));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Quiz getQuizByIdandExpertId(int quizID, int eid) {
        try {
            String sql = "select q.quizID, q.quizName from Quiz q, Chapter ch, Course c\n"
                    + "where q.chapterID = ch.chapterID and ch.courseID = c.courseID and q.quizID = ? and c.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            stm.setInt(2, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Quiz(rs.getInt(1), rs.getString(2), 0);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method insert a quiz record into database.
     *
     * @param studentID id of student who take quiz
     * @param grade grade of quiz record
     * @param quizID id of quiz
     * @return a quiz record id.
     */
    public int insertQuizRecord(int studentID, double grade, int quizID) {
        try {
            String sql = "insert into Quiz_Record (studentID, grade, quizID) values (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, studentID);
            stm.setDouble(2, grade);
            stm.setInt(3, quizID);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     * This method used to check quiz existed in database
     *
     * @param quizID is quiz id
     * @return number of quiz
     */
    public int checkQuizExist(int quizID) {
        try {
            String sql = "select count(q.quizID) from Quiz q\n"
                    + "where q.quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * This method update grade of a quiz record.
     *
     * @param grade student grade
     * @param quizRecordID id of quiz record
     */
    public void updateQuizRecordGrade(double grade, int quizRecordID) {
        try {
            String sql = "update Quiz_Record set grade = ? where quizRecordID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, grade);
            stm.setInt(2, quizRecordID);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int getNumberQuestionByQuizID(String quizID) {
        try {
            String sql = "select COUNT(quizID) from Question where quizID = ? group by quizID";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, quizID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public Quiz getQuiz(int qid) {
        try {
            String sql = "select q.quizID, q.quizName from Quiz q\n"
                    + "where q.quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Quiz(rs.getInt(1), rs.getString(2), 0);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Quiz> getListQuizByChapterId(int id) {
        List<Quiz> list = new ArrayList<>();
        try {
            String sql = "select q.quizID,q.quizName,q.passRate,q.status  from Quiz q\n"
                    + "where q.chapterID =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1), rs.getNString(2), rs.getInt(3), rs.getBoolean(4)));//add a quiz detail to list
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateQuiz(int qid, String quizName, double passRate) {
        try {
            String sql = "Update Quiz set quizName = ?, passRate =? where quizID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setNString(1, quizName);
            stm.setDouble(2, passRate);
            stm.setInt(3, qid);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateStatus(int id, boolean status) {
        try {
            String sql = "Update Quiz set status=? where quizID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();
            return true;

        } catch (SQLException e) {
        }
        return false;
    }

    public boolean getQuizStatus(int qid) {
        try {
            String sql = "select q.status from Quiz q where q.quizID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getBoolean(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean InsertNewQuiz(String quizName, double passRate, int chapterID) {
        try {
            String sql = "Insert into Quiz(chapterID, quizName,passRate, position) values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, chapterID);
            stm.setNString(2, quizName);
            stm.setDouble(3, passRate);
            QuizDAO dao = new QuizDAO();
            stm.setInt(4, dao.getMaxPositionOfQuiz(chapterID) + 1);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int getMaxPositionOfQuiz(int chapterId) {
        try {
            String sql = "select max(position)  from Quiz where chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, chapterId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public boolean deleteQuiz(int quizID) {
        try {
            String sql = "delete from Quiz where quizID =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean checkOwnerQuiz(int quizID, int expertID) {
        try {
            String sql = "select * from Course c, Chapter ch, Quiz q \n"
                    + "where c.courseID=ch.courseID and ch.chapterID = q.chapterID\n"
                    + "and c.expertID = ? and q.quizID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, quizID);
            stm.setInt(1, expertID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkOwnerChapter(int chapterID, int expertId) {
        try {
            String sql = "select * from Course c, Chapter ch\n"
                    + "where c.courseID=ch.courseID \n"
                    + "and c.expertID = ? and ch.chapterID = ?";
            PreparedStatement stm  = connection.prepareStatement(sql);
            stm.setInt(1, expertId);
            stm.setInt(2, chapterID);
            ResultSet rs  = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        QuizDAO q = new QuizDAO();
        List<Quiz> list = q.getListQuizByChapterId(6);
        System.out.println(list.size());
    }
}
