/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modal.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {
    
    public List<Category> listCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select categoryID, categoryName from Category";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    /**
     * This method get list category from database and number course of each category
     * @return a list category
     */
    public List<Category> listCategoryAndNumberCourse() {
        List<Category> list = new ArrayList<>();
        String sql = "select c.categoryID, c.categoryName, count(cc.courseID) as Number_Course from Category c\n"
                + "left join Course_Category cc\n"
                + "on c.categoryID =  cc.categoryID\n"
                + "group by c.categoryID, c.categoryName";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    /**
     * This method get list category by course ID from database
     * @return a list category
     */
    public List<Category> listCategoryByCourse(String courseID) {
        List<Category> list = new ArrayList<>();
        String sql = "select cc.categoryID, c.categoryName from Course_Category cc "
                + "inner join Category c on cc.categoryID = c.categoryID where cc.courseID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
//        for (Category category : dao.listCategory()) {
//            System.out.println(category.toString());
//        }
        System.out.println(dao.listCategoryByCourse("1"));
    }
}
