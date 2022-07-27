
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
import dao.QuizRecordDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Chapter;
import modal.Expert;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ManageQuiz", urlPatterns = {"/expert/ManageQuiz"})
public class ManageQuiz extends HttpServlet {

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
        request.getRequestDispatcher("//view/manageQuiz.jsp").forward(request, response);
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
        int chapterId = 1;
        if (request.getParameter("chapterId") != null) {
            chapterId = Integer.parseInt(request.getParameter("chapterId"));
        }
        QuizDAO quizDAO = new QuizDAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("expert") == null) {
            response.sendRedirect("/beDev/HomeControl");
            return;
        } else {
            Expert e = (Expert) session.getAttribute("expert");
            if (!quizDAO.checkOwnerChapter(chapterId, e.getExpertID())) {
                response.sendRedirect("/BeDev/HomeControl");
                return;
            } else {
                List<modal.Quiz> list = new ArrayList<>();
                list = quizDAO.getListQuizByChapterId(chapterId);
                ChapterDAO cdao = new ChapterDAO();
                Chapter c = cdao.getChapterByChapterId(chapterId);
                request.setAttribute("chapter", c);
                request.setAttribute("listQuiz", list);
                QuizRecordDAO dao = new QuizRecordDAO();
                for (modal.Quiz quiz : list) {
                    quiz.setCheckQuizrecord(dao.checkQuizRecordExist(quiz.getQuizID()));
                }
                String currrentURL = request.getRequestURI() + "?" + request.getQueryString();
                session.setAttribute("currentURL", currrentURL);
                processRequest(request, response);
            }
        }

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
