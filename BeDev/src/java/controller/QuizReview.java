/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDAO;
import dao.QuizDAO;
import dao.QuizRecordDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Question;
import modal.QuizRecord;
import modal.Student;

/**
 *
 * @author admin
 */
@WebServlet(name = "QuizReview", urlPatterns = {"/QuizReview"})
public class QuizReview extends HttpServlet {

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
        request.getRequestDispatcher("//view/quizreview.jsp").forward(request, response);
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
        QuizRecordDAO quizRecordDAO = new QuizRecordDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        QuizDAO quizDAO = new QuizDAO();
        try {
            int rid = Integer.parseInt(request.getParameter("rid"));
            int qid = Integer.parseInt(request.getParameter("qid"));
            String courseID = request.getParameter("courseID");
            Student student = (Student) session.getAttribute("student");
            if (session.getAttribute("account") !=null ) {  //check login with account session
                if (session.getAttribute("student") != null 
                        && quizRecordDAO.checkExistQuizRecord(student.getAccount().getAccountID(), rid) != 0
                        && quizDAO.checkQuizExist(qid) != 0) { //check student login and have quiz record and quiz
                    QuizRecord quizRecord = quizRecordDAO.compareGrade(rid, qid, student.getAccount().getAccountID());  // a record contain grade and passrate of quiz in a quizrecord
                    ArrayList<Question> questionList = questionDAO.listQuestionByQuizIdAndRecordId(qid, rid); // list question of quiz (contain option of question and answer of student)
                    request.setAttribute("quizRecord", quizRecord);
                    request.setAttribute("questionList", questionList);
                } else {
                    response.sendRedirect("Error");
                    return;
                }
            }else{
                response.sendRedirect("SignIn");
                return;
            }
            request.setAttribute("courseID", courseID);
            request.setAttribute("rid", rid);
            request.setAttribute("qid", qid);          
        } catch (Exception e) {
            System.out.println(e + "Failed at QuizReview");
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
