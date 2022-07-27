/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CourseManagement;

import dao.CourseDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modal.Account;
import modal.Category;
import modal.Course;
import util.FileProcessor;

/**
 *
 * @author ACER
 */
@WebServlet(name = "EditCourse", urlPatterns = {"/expert/editcourse"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EditCourse extends HttpServlet {

    String FILEPATH = "/BeDev/view/dist/images/courses/";

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
        HttpSession session = request.getSession();
        FileProcessor fileProcessor = new FileProcessor();
        CourseDAO courseDAO = new CourseDAO();
        int courseId;
        try {
            courseId = Integer.parseInt(request.getParameter("courseId"));
        } catch (Exception ex) {
            session.setAttribute("editcourse", "failed");
            response.sendRedirect("/BeDev/expert/course");
            return;
        }
        Course course = courseDAO.getCourseById(courseId);
        
        String name = request.getParameter("courseName");
        String desctiption = request.getParameter("description");
        int categoryId;
        double price;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoty"));
            price = Double.parseDouble(request.getParameter("price"));
        } catch (Exception ex) {
            session.setAttribute("editcourse", "failed");
            response.sendRedirect("/BeDev/expert/course");
            return;
        }
        Part image = request.getPart("file");
        if (image.getSize() != 0) {
            fileProcessor.delete(course.getCourseImage().split("/")[course.getCourseImage().split("/").length - 1], FILEPATH);
            String filename = fileProcessor.uploadFile(image, fileProcessor.getFolderImage(request, "courses"));
            course.setCourseImage(FILEPATH + filename);
        }
        String status = request.getParameter("status");
        boolean isActive = status != null;
        course.setCourseName(name);
        course.setDescription(desctiption);
        course.setMoney(price);
        course.setStatus(isActive);
        course.setCategory(new Category(categoryId));

        boolean success = courseDAO.updateCourse(course);
        if (success) {
            session.setAttribute("editcourse", "success");
        } else {
            session.setAttribute("editcourse", "failed");
        }
        response.sendRedirect("/BeDev/expert/course");
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
