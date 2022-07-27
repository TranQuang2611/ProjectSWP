/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Course;
import modal.Student;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EnrollCourse", urlPatterns = {"/EnrollCourse"})
public class EnrollCourse extends HttpServlet {
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
        try {
            HttpSession session = request.getSession();
            int courseID = Integer.parseInt(request.getParameter("courseID"));
            CourseDAO courseDAO = new CourseDAO();
            AccountDAO accountDAO = new AccountDAO();
            Course course = courseDAO.getCourseById(courseID);
            Account account = (Account) session.getAttribute("account");
            Student student = accountDAO.getStudentByAccountID(account.getAccountID());
            if (course.getMoney() > student.getCashInWallet()) {
                response.getWriter().write("Your cash is not enough to execute payment.");
                return;
            }
            courseDAO.enrollCourse(Integer.toString(courseID), student.getAccount().getAccountID());
            courseDAO.insertTransctionHistory(courseID, account.getAccountID(), course.getMoney());
            response.getWriter().write("success");
        } catch (Exception e) {
            response.getWriter().write("Cannot enroll you to course.");
        }
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
