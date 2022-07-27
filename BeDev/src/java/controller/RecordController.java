/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuizRecordDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.QuizRecord;
import modal.Student;

/**
 *
 * @author admin
 */
@WebServlet(name = "RecordController", urlPatterns = {"/RecordController"})
public class RecordController extends HttpServlet {

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
        request.getRequestDispatcher("//view/quizrecord.jsp").forward(request, response);
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
        QuizRecordDAO recordDAO = new QuizRecordDAO();
        try {
            int qid = Integer.parseInt(request.getParameter("qid"));
            int cid = Integer.parseInt(request.getParameter("cid"));
            if (session.getAttribute("account") !=null ) { //check login with account session
                if (session.getAttribute("student") != null) { //check student login
                    Student student = (Student) session.getAttribute("student");
                    ArrayList<QuizRecord> listRecord = recordDAO.listRecord(student.getAccount().getAccountID(), qid); // list quiz record of student in a quiz
                    
                    QuizRecord quizRecord = recordDAO.nameOfQuiz(qid); // name of quiz
                    request.setAttribute("listRecord", listRecord);
                    request.setAttribute("quizRecord", quizRecord);
                } else {
                    response.sendRedirect("Error");
                    return;
                }
            }else{
                response.sendRedirect("SignIn");
                return;
            }
            request.setAttribute("qid", qid);
        } catch (Exception e) {
            System.out.println(e.getMessage() + "Failed at RecordController");
            response.sendRedirect("Error");
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
