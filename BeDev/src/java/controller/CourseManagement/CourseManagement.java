/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CourseManagement;

import dao.CategoryDAO;
import dao.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Category;
import modal.Course;

/**
 *
 * @author ACER
 */
public class CourseManagement extends HttpServlet {

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
        CourseDAO courseDAO = new CourseDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int expertId = account.getAccountID();
        List<Course> coursesList = courseDAO.getCoursesByExpertId(expertId);
        List<Category> categoryList = categoryDAO.listCategory();
        request.setAttribute("coursesList", coursesList);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("addCourse", session.getAttribute("addcourse"));
        request.setAttribute("editCourse", session.getAttribute("editcourse"));
        session.removeAttribute("addcourse");
        session.removeAttribute("editcourse");
        request.getRequestDispatcher("/view/courseManagement.jsp").forward(request, response);
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
