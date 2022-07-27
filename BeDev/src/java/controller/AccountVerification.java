/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Account;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AccountVerification", urlPatterns = {"/AccountVerification"})
public class AccountVerification extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDAO accountDAO = new AccountDAO();
        try {
            String email = request.getParameter("email");
            int id = Integer.parseInt(request.getParameter("uid"));
            Account account = new Account();
            account.setAccountID(id);
            account.setEmail(email);
            boolean valid = accountDAO.checkAccountExistByEmailAndID(account);
            if (valid) {
                boolean success = accountDAO.accountVerification(id);
                if (success) {
                    request.setAttribute("mess", "Your account is verified. Login and enjoy BeDev now.");
                } else {
                    request.setAttribute("mess", "Something went wrong. Try again later.");
                }
            } else {
                response.sendRedirect("Error");
                return;
            }
        } catch (Exception e) {
            response.sendRedirect("Error");
            return;
        }
        request.getRequestDispatcher("//view//accountverification.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
