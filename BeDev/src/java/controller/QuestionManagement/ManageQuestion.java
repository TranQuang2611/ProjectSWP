/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.QuestionManagement;

import controller.*;
import dao.CourseDAO;
import dao.OptionDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Expert;
import modal.Question;

/**
 *
 * @author admin
 */
@WebServlet(name = "ManageQuestion", urlPatterns = {"/expert/ManageQuestion"})
public class ManageQuestion extends HttpServlet {

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
        request.getRequestDispatcher("/view/manageQuestions.jsp").forward(request, response);
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
        ArrayList<Question> listQuestion = new ArrayList<>();
        QuestionDAO questionDAO = new QuestionDAO();
        QuizDAO quizDAO = new QuizDAO();
        modal.Quiz quiz = new modal.Quiz();
        int qid;
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    Expert expert = (Expert)session.getAttribute("expert");
                    qid = Integer.parseInt(request.getParameter("qid"));
                    listQuestion = questionDAO.getQuestionByQuiz(qid,expert.getExpertID());    //get question by id of the quiz
                    quiz = quizDAO.getQuizByID(qid);  //get quiz by id of the quiz
                } else {
                    response.sendRedirect("/HomeControl");
                    return;
                }
            } else {
                response.sendRedirect("/SignIn");
                return;
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("/Error");
            return;
        }
        request.setAttribute("qid", qid);
        request.setAttribute("quiz", quiz);
        request.setAttribute("listQuestion", listQuestion);
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
