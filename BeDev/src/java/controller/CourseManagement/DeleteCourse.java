/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CourseManagement;

import dao.CourseDAO;
import dao.EnrollDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "DeleteCourse", urlPatterns = {"/expert/deletecourse"})
public class DeleteCourse extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>Delete</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        EnrollDAO enrollDAO = new EnrollDAO();
        try {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            int numberOfEnroll = enrollDAO.countNumberOfStudentEnrollByCourseId(courseId);
            if (numberOfEnroll == 0) {
                boolean deletesucess = courseDAO.deleteCourseById(courseId);
                if (deletesucess) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("Error, cannot delete course");
                }
            } else {
                response.getWriter().write("The course cannot be deleted because there are already students enroll the course");
            }
        } catch (Exception ex) {
            response.getWriter().write(ex.getMessage());
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
