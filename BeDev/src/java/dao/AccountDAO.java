/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modal.Account;
import modal.Admin;
import modal.Expert;
import modal.Role;
import modal.Student;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    /**
     * This method check email is exist or not.
     *
     * @param email email need to check
     * @return true if email exist. Otherwise return false
     */
    public boolean isEmailExist(String email) {
        try {
            String sql = "select * from Account where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
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
     * This method insert a new Account as a student into database base on
     * register information
     *
     * @param student contain user information
     * @return true if insert success. Otherwise return false.
     */
    public boolean signup(Student student) {
        try {
            String sql = "insert into Account(email, password, role, accountID) values (?, ?, ?, ?); ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student.getAccount().getEmail());
            stm.setString(2, student.getAccount().getPassword());
            stm.setInt(3, student.getAccount().getRole().getRoleID());
            stm.setInt(4, student.getAccount().getAccountID());
            stm.executeUpdate();
            sql = "insert into Student(studentID, name, imageURL) values (?, ?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, student.getAccount().getAccountID());
            stm.setNString(2, student.getName());
            stm.setNString(3, "/BeDev/view/dist/images/avatar/user_avatar.png");
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * This method check account is exist or not.
     *
     * @param account
     * @return true if account exist. Otherwise return false.
     */
    public boolean checkAccountExistByEmailAndID(Account account) {
        try {
            String sql = "select * from Account where email = ? and accountID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getEmail());
            stm.setInt(2, account.getAccountID());
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
     * This method set verify attribute of account to true.
     *
     * @param id account id need to verify.
     * @return true if verify success. Otherwise return false.
     */
    public boolean accountVerification(int id) {
        try {
            String sql = "update Account set emailVerify = 1 where accountID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * This method reset user password.
     *
     * @param account account user change password.
     * @return true if change password success. Otherwise return false.
     */
    public boolean resetPassword(Account account) {
        try {
            String sql = "update Account set password = ? where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPassword());
            stm.setString(2, account.getEmail());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * this method is used to check email and password when login..
     *
     * @param email
     * @param password
     * @return a account if input is valid opposite return null.
     */
    public Account signIn(String email, String password) {
        try {
            String sql = "select * from Account a\n"
                    + "where a.email = ? and a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), new Role(rs.getInt(5)), rs.getBoolean(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method change account password if email is same as param email
     *
     * @param email user email
     * @param newPass re password user want to set
     * @return true if change password success. Otherwise return false.
     */
    public boolean changePassword(String email, String newPass) {
        try {
            String sql = "update Account  \n"
                    + "set password = ? where  email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPass);
            stm.setString(2, email);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * This method is used to get student by account ID
     *
     * @param id
     * @return a student have this id.
     */
    public Student getStudentByAccountID(int id) {
        try {
            String sql = "select * from Account a , Student s\n"
                    + "where a.accountId = s.studentId\n"
                    + "and a.accountId = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Student(new Account(id, rs.getString(2), rs.getString(3), rs.getBoolean(4), new Role(rs.getInt(5)), rs.getBoolean(6)), rs.getString(8), rs.getDouble(9), rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method is used to get expert by account id.
     *
     * @param id of account
     * @return a expert have this id
     */
    public Expert getExpertByAccountID(int id) {
        try {
            String sql = "select * from Account a , Expert e\n"
                    + "where a.accountId = e.expertId\n"
                    + "and a.accountId = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Expert(id, rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method is used to get a admin by account id.
     *
     * @param id of account.
     * @return a admin have this id
     */
    public Admin getAdminByAccountID(int id) {
        try {
            String sql = "select * from Admin a , Account acc\n"
                    + "where a.adminID = acc.accountID and a.adminID= ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Admin(new Account(id, rs.getString(6), rs.getString(7), rs.getBoolean(8), new Role(rs.getInt(9)), rs.getBoolean(10)), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method get new account ID will be generate.
     *
     * @return an integer represent for account ID.
     */
    public int getNewAccountID() {
        try {
            String sql = "select top(1) a.accountID from Account a order by a.accountID desc";
            PreparedStatement stm = connection.prepareCall(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @return an integer represent for
     */
    public int getNumbersOfUser() {
        try {
            String sql = "select count(*) from Account\n";
            PreparedStatement stm = connection.prepareCall(sql);
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
     *
     * @return an integer represent for
     */
    public int getNumbersOfExpert() {
        try {
            String sql = "select count(*) from Expert\n";
            PreparedStatement stm = connection.prepareCall(sql);
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
     *
     * @return an integer represent for
     */
    public int getNumbersOfStudent() {
        try {
            String sql = "select count(*) from Student\n";
            PreparedStatement stm = connection.prepareCall(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select  a.accountID, a.email, a.role, a.status, r.roleName \n"
                    + "from Account a , Role r where a.role= r.roleID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), new Role(rs.getInt(3), rs.getString(5)), rs.getBoolean(4));
                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;    
    }
    public boolean changeStatusAccount(int accountID, boolean status){
        try {
            String sql = "update Account set status = ? where accountID =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, accountID);
            stm.setBoolean(1, status);
             stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    public boolean getAccountStatus(int accountID){
        try {
            String sql ="select a.status from Account a where a.accountID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getBoolean(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO accountDAO = new AccountDAO();
        Expert a = accountDAO.getExpertByAccountID(2);
        Student s1 = accountDAO.getStudentByAccountID(9);
        Admin admin = accountDAO.getAdminByAccountID(1);
        Account s = accountDAO.signIn("huytqhe151216@fpt.edu.vn", "123");
        System.out.println(admin.getName());
    }

}
