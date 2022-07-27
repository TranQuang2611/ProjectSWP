/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ChapterDAO;
import dao.CourseDAO;
import dao.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Chapter;
import modal.Course;
import modal.Lesson;
import modal.Student;

/**
 *
 * @author MrLink
 */
@WebServlet(name = "LessonView", urlPatterns = {"/LessonView"})
public class LessonView extends HttpServlet {

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
        String lessonID = request.getParameter("lessonID");
        String courseID = request.getParameter("courseID");
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            response.sendRedirect("SignIn");
            return;
        }
        //Get lesson details by lessonID
        LessonDAO lessonDAO = new LessonDAO();
        Lesson lesson = lessonDAO.getLessonDetails(lessonID);
        request.setAttribute("lessonDetails", lesson);
        //Get course by courseID
        CourseDAO courseDAO = new CourseDAO();
        Course course = courseDAO.getCourseById(courseID);
        request.setAttribute("course", course);
        //Get list chapter of course by course ID from chapterDAO
        ChapterDAO chapterDAO = new ChapterDAO();
        List<Chapter> listChapter = chapterDAO.listChapterByEnrollCourse(courseID, student.getAccount().getAccountID());
        request.setAttribute("listChapter", listChapter);
        lessonDAO.addLessonLearned(lessonID, student.getAccount().getAccountID());
        request.getRequestDispatcher("//view//watch.jsp").forward(request, response);
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
