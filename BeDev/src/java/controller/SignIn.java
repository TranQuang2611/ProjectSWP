
/*
 * Copyright(C) 2005, FPT university
 * ...
 * ...
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2018-09-10      1.0                 HuyTQ           First Implement
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Admin;
import modal.Expert;
import modal.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SignIn", urlPatterns = {"/SignIn"})
public class SignIn extends HttpServlet {

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
        request.getRequestDispatcher("//view//signin.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            response.sendRedirect("HomeControl");
            return;
        }

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
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Account account = new Account();
        account = accountDAO.signIn(email, password);
        String mess = null;
        if (account == null) {
            mess = "Invalid email or password. Please enter again.";
        } else {
            if (!account.isEmailVeriFy()) {// email have not verified.
                mess = " Please verify youre email.";
            } else {
                if (!account.isStatus()) {
                    mess ="You are banned. Contact admin for more information";
                } else {
                    if (account.getRole().getRoleID() == 3) {// account is student
                        Student student = new Student();
                        student = accountDAO.getStudentByAccountID(account.getAccountID());
                        session.setAttribute("student", student);

                    } else {
                        if (account.getRole().getRoleID() == 2) {// account is expert
                            Expert expert = new Expert();
                            expert = accountDAO.getExpertByAccountID(account.getAccountID());
                            session.setAttribute("expert", expert);
                        } else {// account is admin
                            Admin admin = new Admin();
                            admin = accountDAO.getAdminByAccountID(account.getAccountID());
                            session.setAttribute("admin", admin);
                        }

                    }
                    session.setAttribute("account", account);
                    response.sendRedirect("HomeControl");
                    return;
                }
            }
        }
        request.setAttribute("mess", mess);
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
