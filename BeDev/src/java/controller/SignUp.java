/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import email.EmailSender;
import dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Account;
import modal.Role;
import modal.Student;

/**
 *
 * @author ACER
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

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
        request.getRequestDispatcher("//view//signup.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        AccountDAO accountDAO = new AccountDAO();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        if (!accountDAO.isEmailExist(email)) {

            int accountID = accountDAO.getNewAccountID();

//            String message = "Click this link to verify yor email " + request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - 7)
//                    + "/AccountVerification?uid=" + accountID + "&email=" + email;
            String message = "Click this link to verify yor email http://localhost:8080/BeDev/AccountVerification?uid=" + accountID + "&email=" + email;
            boolean sendEmailSuccess = EmailSender.sendMail(email, "Your email verification", message);
            if (sendEmailSuccess) {
                boolean signInSuccess = accountDAO.signup(new Student(new Account(accountID, email, password, false, new Role(3), true), name, 0, ""));
                if (signInSuccess) {
                    request.setAttribute("success", "Sign up successfully. Check email now to verify your account.");
                } else {
                    request.setAttribute("failed", "Cannot create account. Try again.");
                }
            } else {
                request.setAttribute("failed", "Cannot sent email. Create account failed.");
            }

        } else {
            request.setAttribute("failed", "Email is currently in use.");
        }
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
