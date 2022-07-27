/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modal.Chapter;
import modal.Course;
import modal.Lesson;
import modal.Quiz;

/**
 *
 * @author admin
 */
public class ChapterDAO extends DBContext {

    /**
     * This method get a list chapter by course ID from database
     *
     * @return a list chapter
     */
    public List<Chapter> listChapterByCourse(String courseID) {
        List<Chapter> listChapter = new ArrayList<>();
        try {
            String sql = "select c.chapterID, c.chapterName, c.position, "
                    + "l.lessonID, l.lessonName, l.position, q.quizID, "
                    + "q.quizName, q.position from Chapter c left join Lesson l "
                    + "on c.chapterID = l.chapterID and l.status = 1 left join Quiz q "
                    + "on c.chapterID = q.chapterID and q.status = 1 "
                    + "where c.courseID = ? and c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            ResultSet rs = stm.executeQuery();
            Lesson lesson = null;
            while (rs.next()) {
                List<Lesson> listLesson = new ArrayList<>();
                if (lesson != null) {
                    listLesson.add(lesson);
                }
                Quiz quiz = new Quiz(rs.getInt(7), rs.getString(8), rs.getInt(9));
                listChapter.add(new Chapter(rs.getInt(1), rs.getString(2), rs.getInt(3), listLesson, quiz));
                listLesson.add(new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6)));
                int pos = rs.getInt(3);
                while (rs.next()) {
                    if (pos == rs.getInt(3)) {
                        listLesson.add(new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6)));
                    } else {
                        lesson = new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6));
                        break;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listChapter;
    }

    public List<Chapter> listChapterByEnrollCourse(String courseID, int studentID) {
        List<Chapter> listChapter = new ArrayList<>();
        try {
            String sql = "select c.chapterID, c.chapterName, c.position, l.lessonID, l.lessonName, l.position, q.quizID, \n"
                    + "q.quizName, q.position, ll.lessonID from Chapter c left join Lesson l on c.chapterID = l.chapterID and l.status = 1\n"
                    + "left join Quiz q on c.chapterID = q.chapterID and q.status = 1\n"
                    + "left join Lesson_Learned ll on ll.lessonID = l.lessonID and ll.studentID = ?\n"
                    + "where c.courseID = ? and c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentID);
            stm.setString(2, courseID);
            ResultSet rs = stm.executeQuery();
            Lesson lesson = null;
            while (rs.next()) {
                List<Lesson> listLesson = new ArrayList<>();
                if (lesson != null) {
                    listLesson.add(lesson);
                }
                Quiz quiz = new Quiz(rs.getInt(7), rs.getString(8), rs.getInt(9));
                listChapter.add(new Chapter(rs.getInt(1), rs.getString(2), rs.getInt(3), listLesson, quiz));
                listLesson.add(new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(10)));
                int pos = rs.getInt(3);
                while (rs.next()) {
                    if (pos == rs.getInt(3)) {
                        listLesson.add(new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(10)));
                    } else {
                        lesson = new Lesson(rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(10));
                        break;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listChapter;
    }
    public Chapter getChapterByChapterId(int id){
        Chapter c = new Chapter();
        try {
            String sql ="select c.chapterID, c.chapterName from Chapter c where chapterID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Chapter(rs.getInt(1), rs.getNString(2));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public List<Chapter> listChapterByCourseID(String courseID) {
        try {
            List<Chapter> listChapters = new ArrayList<>();
            String sql = "select ch.chapterID, ch.chapterName, ch.position, ch.status, "
                    + "c.courseID, c.courseName from Chapter ch left join Course c "
                    + "on ch.courseID = c.courseID where c.courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter(rs.getInt(1), rs.getString(2), new Course(rs.getInt(5), rs.getString(6)), rs.getInt(3), rs.getBoolean(4));
                listChapters.add(c);
            }
            return listChapters;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean checkChapterExistById(String chapterID) {
        try {
            String sql = "select chapterID from Chapter where chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, chapterID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean changeChapterStatus(String chapterID, boolean currentStatus) {
        try {
            String sql = "update Chapter set status = ? where chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentStatus ? 0 : 1);
            stm.setString(2, chapterID);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean insertChapter(String courseId, String chapterName, String chapterPosition, boolean status) {
        try {
            String sql = "insert into Chapter(chapterName, courseID, position, status) values (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, chapterName);
            stm.setString(2, courseId);
            stm.setString(3, chapterPosition);
            stm.setBoolean(4, status);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateChapter(String chapterId, String chapterName, String position, boolean status) {
        try {
            String sql = "update Chapter set chapterName = ?, position = ?, status = ? where chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, chapterName);
            stm.setString(2, position);
            stm.setBoolean(3, status);
            stm.setString(4, chapterId);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean deleteChapterById(String chapterId) {
        try {
            String sql = "delete [Option] where optionID in (select o.optionID "
                    + "from [Option] o join Question qu on qu.questionID = o.questionID "
                    + "join Quiz q on q.quizID = qu.quizID where q.chapterID = ?) "
                    + "delete Question where questionID in (select qu.questionID "
                    + "from Question qu join Quiz q on q.quizID = qu.quizID where q.chapterID = ?) "
                    + "delete Quiz where chapterID = ? "
                    + "delete Lesson where chapterID = ? "
                    + "delete Chapter where chapterID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, chapterId);
            stm.setString(2, chapterId);
            stm.setString(3, chapterId);
            stm.setString(4, chapterId);
            stm.setString(5, chapterId);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        ChapterDAO c = new ChapterDAO();
        System.out.println(c.listChapterByEnrollCourse("2", 10).get(1).getLessons().size());
    }

}
