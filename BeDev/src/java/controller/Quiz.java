/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ChapterDAO;
import dao.CourseDAO;
import dao.QuizDAO;
import dao.QuizRecordDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Chapter;
import modal.Course;
import modal.QuizRecord;
import modal.Student;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Quiz", urlPatterns = {"/Quiz"})
public class Quiz extends HttpServlet {

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
        String quizID = request.getParameter("qid");
        String courseID = request.getParameter("courseID");
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            response.sendRedirect("SignIn");
            return;
        }
        //Get course by courseID
        CourseDAO courseDAO = new CourseDAO();
        Course course = courseDAO.getCourseById(courseID);
        request.setAttribute("course", course);
        //Get quiz by quizID
        QuizDAO quizDAO = new QuizDAO();
        modal.Quiz quiz = quizDAO.getQuizByID(Integer.parseInt(quizID));
        request.setAttribute("quiz", quiz);
        int numberQuestion = quizDAO.getNumberQuestionByQuizID(quizID);
        request.setAttribute("numberQuestion", numberQuestion);
        //Get receive grade by quizID and studentID
        QuizRecordDAO quizRecordDAO = new QuizRecordDAO();
        QuizRecord quizRecord = quizRecordDAO.getGrade(quizID, student.getAccount().getAccountID());
        request.setAttribute("quizRecord", quizRecord);
        //Get list chapter of course by course ID from chapterDAO
        ChapterDAO chapterDAO = new ChapterDAO();
        List<Chapter> listChapter = chapterDAO.listChapterByEnrollCourse(courseID, student.getAccount().getAccountID());
        request.setAttribute("listChapter", listChapter);
        
        
        request.getRequestDispatcher("//view//quiz.jsp").forward(request, response);
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
