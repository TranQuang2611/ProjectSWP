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
import java.time.LocalDateTime;
import java.util.ArrayList;
import modal.Account;
import modal.Course;
import modal.Expert;
import modal.Option;
import modal.Student;
import modal.Transaction;

/**
 *
 * @author ACER
 */
public class StudentDAO extends DBContext {

    /**
     * This method get information of a student from database
     *
     * @param id is id of student
     * @return a student
     */
    public Student profile(int id) {
        try {
            String sql = "select s.studentID, s.name, s.cashInWallet, s.imageURL, a.email from Student s, Account a\n"
                    + "	where s.studentID = a.accountID and a.accountID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Student(new Account(rs.getInt(1), rs.getString(5), "", true, null, true), rs.getString(2), rs.getDouble(3), rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method allows student update information and insert it to database
     *
     * @param id is id of student
     * @param name is name updated
     */
    public void editProfile(int id, String name) {
        try {
            String sql = "update Student\n"
                    + "	set name = ?\n"
                    + "	where studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setNString(1, name);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Student> listStudents() {
        List<Student> list = new ArrayList<>();
        try {
            String sql = "select studentID, name, cashInWallet, imageURL from Student";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Student(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean insertStudent(Student student, String email, String password) {
        try {
            String sql = "insert into Account values ((select top 1 accountID + 1 from Account order by accountID desc) ,?, ?, 1, 3, 1) "
                    + "insert into Student values ((select top 1 accountID from Account order by accountID desc) ,?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, student.getName());
            stm.setDouble(4, student.getCashInWallet());
            stm.setString(5, student.getImageURL());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean editStudent(Student student) {
        try {
            String sql = "update Student set name = ?, cashInWallet = ?, imageURL = ? where studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student.getName());
            stm.setDouble(2, student.getCashInWallet());
            stm.setString(3, student.getImageURL());
            stm.setInt(4, student.getStudentID());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Student getStudentById(String studentId) {
        try {
            String sql = "select studentID, name, cashInWallet, imageURL from Student where studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Student(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<Transaction> listTransactionByStudent(int sid) {
        ArrayList<Transaction> list = new ArrayList<>();
        try {
            String sql = "select th.*, c.courseImage, c.courseName, c.description, c.expertID, e.name from Transaction_History th, Course c, Expert e\n"
                    + "where studentID = ? and th.courseID = c.courseID and c.expertID = e.expertID\n"
                    + "order by [time] desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Transaction(rs.getInt(1), new Student(new Account(rs.getInt(2))), rs.getTimestamp(3).toLocalDateTime(), 
                        rs.getFloat(4), new Course(rs.getInt(5), rs.getString(7), rs.getString(8), rs.getString(6), null), new Expert(rs.getInt(9), rs.getString(10), null)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public boolean addMoney(double money, int studentID) {
        try {
            String sql = "Update Student set cashInWallet=cashInWallet+?\n"
                    + "where studentID =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, money);
            stm.setInt(2, studentID);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        StudentDAO dao = new StudentDAO();
        Student s = dao.profile(10);
        System.out.println(s);
    }
}
