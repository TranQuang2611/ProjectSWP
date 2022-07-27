/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.dashboard;

import com.google.gson.Gson;
import dao.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Chart;

/**
 *
 * @author ACER
 */
public class EarningOverviews extends HttpServlet {

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
        HttpSession session = request.getSession();
        CourseDAO courseDAO = new CourseDAO();
        Account account = (Account) session.getAttribute("account");
        String[] months = new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        String[] monthsInYear = Arrays.copyOfRange(months, 0, LocalDate.now().getMonthValue());
        double[] earning = new double[LocalDate.now().getMonthValue()];
        if (account.getRole().getRoleID() == 2) {
            int expertId = account.getAccountID();
            earning = courseDAO.getEarningOverviewThisYearOfExpert(expertId);
        } else if (account.getRole().getRoleID() == 1) {
            earning = courseDAO.getEarningOverviewThisYear();
        }
        response.getWriter().write(new Gson().toJson(new Chart("Earnings", monthsInYear, earning)));
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
