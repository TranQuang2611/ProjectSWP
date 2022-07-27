/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import modal.Course;
import modal.Enroll;
import modal.Expert;

/**
 *
 * @author admin
 */
public class EnrollDAO extends DBContext {

    public List<Enroll> countFeatureEnrollOfCourse() {
        List<Enroll> list = new ArrayList<>();
        try {
            String sql = "select top(6) c.courseID, count(*) as Number_Registed from Enroll e, Course c\n"
                    + "where e.courseID = c.courseID\n"
                    + "group by e.courseID, c.courseID\n"
                    + "order by  Number_Registed  desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Enroll(new Course(rs.getInt(1), "", "", "", null, 0, null, true), rs.getInt(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    
    /**
     *
     * @param cid
     * @return
     */
    public int countNumberOfStudentEnrollByCourseId(int cid) {
        try {
            String sql = "select count(studentID) from Enroll where courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }
    
    public int countEnrollOfCourse(int id) {
        try {
            String sql = "select count(*)  from Enroll e\n"
                    + "where e.courseID = ?";
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

    /**
     * This method is number course enrolled by student from database
     *
     * @param id is id of student
     * @return number course enrolled by student
     */
    public int countEnrollOfStudent(int id) {
        try {
            String sql = "select count(*) from Enroll e\n"
                    + "	where e.studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
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
     * This method checks if this student is already registered for this course.
     *
     * @param studentID
     * @param courseID
     * @return true if registered , false if not.
     */
    public boolean isEnroll(String courseID, int studentID) {
        try {
            String sql = "select * from Enroll where courseID = ? and studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            stm.setInt(2, studentID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param expertId
     * @return
     */
    public int[] getEnrollOverviewThisYearOfExpert(int expertId) {
        int[] enrollOverview = new int[LocalDate.now().getMonthValue()];
        try {
            String sql = "select Month(e.registeredDate), count(e.courseID)\n"
                    + "from Enroll e join Course c on e.courseID = c.courseID\n"
                    + "where c.expertID = ? and YEAR(e.registeredDate) = ? and MONTH(e.registeredDate) = ?\n"
                    + "group by Month(e.registeredDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, expertId);
            stm.setInt(2, LocalDate.now().getYear());
            for (int i = 1; i <= LocalDate.now().getMonthValue(); i++) {
                stm.setInt(3, i);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    enrollOverview[i - 1] = rs.getInt(2);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return enrollOverview;
    }

    /**
     *
     * @return
     */
    public int[] getEnrollOverviewThisYear() {
        int[] enrollOverview = new int[LocalDate.now().getMonthValue()];
        try {
            String sql = "select Month(e.registeredDate), count(e.courseID)\n"
                    + "from Enroll e join Course c on e.courseID = c.courseID\n"
                    + "where YEAR(e.registeredDate) = ? and MONTH(e.registeredDate) = ?\n"
                    + "group by Month(e.registeredDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, LocalDate.now().getYear());
            for (int i = 1; i <= LocalDate.now().getMonthValue(); i++) {
                stm.setInt(2, i);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    enrollOverview[i - 1] = rs.getInt(2);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return enrollOverview;
    }

    
    public static void main(String[] args) {
        EnrollDAO enrollDAO = new EnrollDAO();
    }

}
