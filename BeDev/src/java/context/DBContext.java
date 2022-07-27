/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            String user = "sa";
//            String pass = "12345";//tien
            String pass = "123456";
//            String pass = "12345678"; // Quang pass
//            String pass = "123456789";// Huy pass
//            String url = "jdbc:sqlserver://LAPTOP-TNC3HU99\\QUOCANH:1433;databaseName=OnlineLearn";//Quoc Anh
//            String url = "jdbc:sqlserver://LAPTOP-0GU2ESDG\\SQLEXPRESS:1433;databaseName=OnlineLearn";// huy;
            String url = "jdbc:sqlserver://localhost:1433;databaseName=OnlineLearn";//Tien

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBContext bContext = new DBContext();
        System.out.println(bContext.connection);
    }
}
