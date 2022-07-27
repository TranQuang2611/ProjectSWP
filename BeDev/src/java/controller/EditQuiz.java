
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

import dao.ChapterDAO;
import dao.QuizDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Chapter;
import modal.Quiz;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditQuiz", urlPatterns = {"/expert/EditQuiz"})
public class EditQuiz extends HttpServlet {

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
        request.getRequestDispatcher("//view/editQuiz.jsp").forward(request, response);
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
        int cid=1;
        if (request.getParameter("chapterID")!=null) {
            cid=Integer.parseInt(request.getParameter("chapterID"));
        }
        int qid=1;
        if (request.getParameter("quizID")!=null) {
            qid=Integer.parseInt(request.getParameter("quizID"));
        }
        ChapterDAO cdao = new ChapterDAO();
        Chapter c = cdao.getChapterByChapterId(cid);
        request.setAttribute("chapter", c);
        QuizDAO quizDAO = new QuizDAO();
        Quiz quiz = quizDAO.getQuizByID(qid);
        request.setAttribute("quiz", quiz);
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
        
        String quizName = request.getParameter("quizName");
        float passRate = Float.parseFloat(request.getParameter("passRate"));
        int qid=1;
        if (request.getParameter("quizID")!=null) {
            qid=Integer.parseInt(request.getParameter("quizID"));
        }
        System.out.println(passRate);
        QuizDAO quizDAO = new QuizDAO();
        if (quizDAO.updateQuiz(qid, quizName, passRate)) {
            doGet(request, response);
        }else{
             response.sendRedirect("Error");
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
