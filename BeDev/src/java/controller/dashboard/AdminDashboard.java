/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.dashboard;

import dao.AccountDAO;
import dao.CourseDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class AdminDashboard extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        AccountDAO accountDAO = new AccountDAO();
        double totalEarningLastMonth = courseDAO.getEarningLastMonth();
        double totalEarning = courseDAO.getEarningTotal();
        int totalEnroll = courseDAO.countTotalEnroll();
        int numberOfUsers = accountDAO.getNumbersOfUser();
        int numberOfExperts = accountDAO.getNumbersOfExpert();
        int numberOfStudents = accountDAO.getNumbersOfStudent();
        request.setAttribute("totalEnroll", totalEnroll);
        request.setAttribute("numberOfUsers", numberOfUsers);
        request.setAttribute("numberOfExperts", numberOfExperts);
        request.setAttribute("numberOfStudents", numberOfStudents);

        request.setAttribute("totalEarningLastMonth", totalEarningLastMonth);
        request.setAttribute("totalEarningThisYear", totalEarning);
        request.getRequestDispatcher("/view/adminDashboard.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
