/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.dashboard;

import com.google.gson.Gson;
import dao.EnrollDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "EnrollOverview", urlPatterns = {"/api/dashboard/EnrollOverview"})
public class EnrollOverview extends HttpServlet {

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
        HttpSession session = request.getSession();
        EnrollDAO enrollDAO = new EnrollDAO();
        Account account = (Account) session.getAttribute("account");
        String[] months = new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        String[] monthsInYear = Arrays.copyOfRange(months, 0, LocalDate.now().getMonthValue());
        int[] enroll = new int[LocalDate.now().getMonthValue()];
        if (account.getRole().getRoleID() == 2) {
            int expertId = account.getAccountID();
            enroll = enrollDAO.getEnrollOverviewThisYearOfExpert(expertId);
        } else if (account.getRole().getRoleID() == 1) {
            enroll = enrollDAO.getEnrollOverviewThisYear();
        }
        response.getWriter().write(new Gson().toJson(new Chart("Student enroll", monthsInYear, enroll)));

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
