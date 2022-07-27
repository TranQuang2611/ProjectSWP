/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modal.Chapter;
import modal.Lesson;

/**
 *
 * @author admin
 */
public class LessonDAO extends DBContext {

    public int countLessonOfCourse(int id) {
        try {
            String sql = "select count(*)  from Course c, Chapter ch, Lesson l\n"
                    + "where c.courseID = ch.courseID and ch.chapterID = l.chapterID and c.courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public Lesson getLessonDetails(String lessonID) {
        Lesson lesson = null;
        try {
            String sql = "select lessonID, lessonName, videoUrl, content from Lesson where lessonID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lessonID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                lesson = new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lesson;
    }

    public List<Lesson> getLessonByChapterId(String chapterId) {
        List<Lesson> list = new ArrayList<>();
        try {
            String sql = "select l.lessonID, l.lessonName, l.videoUrl, l.content, "
                    + "l.status, l.position, c.chapterID, c.chapterName from "
                    + "Lesson l left join Chapter c on l.chapterID = c.chapterID "
                    + "where l.chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, chapterId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getInt(6), new Chapter(rs.getInt(7), rs.getString(8))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkLessonExistById(String lessonId) {
        try {
            String sql = "select lessonID from Lesson where lessonID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lessonId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean changeCourseStatus(String lessonId, boolean currentStatus) {
        try {
            String sql = "update Lesson set status = ? where lessonID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentStatus ? 0 : 1);
            stm.setString(2, lessonId);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean insertLesson(String lessonName, String chapterId, String video, String content, String position, boolean active) {
        try {
            String sql = "insert into Lesson values (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, lessonName);
            stm.setString(2, chapterId);
            stm.setString(3, video);
            stm.setString(4, content);
            stm.setBoolean(5, active);
            stm.setString(6, position);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public void addLessonLearned(String lessonID, int studentID) {
        try {
            String sql = "insert into Lesson_Learned (studentID, lessonID) "
                    + "(select ?, ? where (select COUNT(studentID) from Lesson_Learned "
                    + "where studentID = ? and lessonID = ? group by studentID) is NULL)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentID);
            stm.setString(2, lessonID);
            stm.setInt(3, studentID);
            stm.setString(4, lessonID);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean updateLesson(String lessonId, String lessonName, String video, String content, String position, boolean active) {
        try {
            String sql = "update Lesson set lessonName = ?, videoUrl = ?, content = ?, status = ?, position = ? where lessonID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lessonName);
            stm.setString(2, video);
            stm.setString(3, content);
            stm.setString(5, position);
            stm.setBoolean(4, active);
            stm.setString(6, lessonId);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteLessonById(String lessonId) {
        try {
            String sql = "delete Lesson_Learned where lessonID = ? delete Lesson where lessonID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lessonId);
            stm.setString(2, lessonId);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
