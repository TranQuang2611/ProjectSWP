/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author Admin
 */
public class Category {

    private int categoryID;
    private String categoryName;
    private int numberCourse;

    public Category() {
    }

    public Category(int categoryID) {
        this.categoryID = categoryID;
    }

    public Category(int categoryID, String categoryName) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
    }

    public Category(int categoryID, String categoryName, int numberCourse) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.numberCourse = numberCourse;
    }
    
    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getNumberCourse() {
        return numberCourse;
    }

    public void setNumberCourse(int numberCourse) {
        this.numberCourse = numberCourse;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + '}';
    }
}
