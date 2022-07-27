/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import email.EmailSender;
import dao.AccountDAO;
import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPassword"})
public class ResetPassword extends HttpServlet {

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
        request.getRequestDispatcher("//view//resetPassword.jsp").forward(request, response);
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

    public String generateRandomString(int len) {
        String str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%&";
        Random rnd = new Random();
        String randomString = "";
        for (int i = 0; i < len; i++) {
            randomString += str.charAt(rnd.nextInt(str.length()));
        }
        return randomString;
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
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        if (session.getAttribute("step") == null || ((int) session.getAttribute("step") == 1)) {
            String email = request.getParameter("email");
            System.out.println(email);
            boolean validEmail = accountDAO.isEmailExist(email);
            if (validEmail) {
                String verificationCode = generateRandomString(8);
                boolean sendEmailSuccess = EmailSender.sendMail(email, "Your verification code", "Your verification code is: " + verificationCode);
                if (sendEmailSuccess) {
                    session.setAttribute("email", email);
                    session.setAttribute("verifycode", verificationCode);
                    session.setAttribute("step", 2);
                    session.setMaxInactiveInterval(180);
                    request.setAttribute("mess", "Send verification code successfully. Check your email to get your verification code.");
                } else {
                    request.setAttribute("mess", "Cannot send verification code to your email.");
                }
            } else {
                request.setAttribute("mess", "Email is not valid.");
            }
        } else if ((int) session.getAttribute("step") == 2) {
            String verificationCode = request.getParameter("verifycode");
            if (session.getAttribute("verifycode") != null && session.getAttribute("verifycode").toString().equals(verificationCode)) {
                session.setAttribute("step", 3);
                session.setMaxInactiveInterval(180);
            }
        } else if ((int) session.getAttribute("step") == 3) {
            String password = request.getParameter("password");
            Account account = new Account();
            account.setEmail(session.getAttribute("email").toString());
            account.setPassword(password);
            boolean resetPasswordSuccess = accountDAO.resetPassword(account);
            if (resetPasswordSuccess) {
                request.setAttribute("mess", "Reset password successfully. SignIn now.");
            } else {
                request.setAttribute("mess", "Cannot reset password. Your old password is remain");
            }
            session.invalidate();
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
