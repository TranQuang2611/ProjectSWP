/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Category;
import modal.Course;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CourseListCategory", urlPatterns = {"/CourseListCategory"})
public class CourseListCategory extends HttpServlet {

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
        //Get list category from categoryDAO
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCategory = categoryDAO.listCategory();
        request.setAttribute("listCategory", listCategory);
        //Get current number page
        String pagePosition = request.getParameter("pagePosition");
        if (pagePosition == null) {
            pagePosition = "1";
        }
        request.setAttribute("pagePosition", pagePosition);
        //Number product to display in tha page
        String numberProduct = request.getParameter("numberProduct");
        if (numberProduct == null) {
            numberProduct = "4";
        }
        request.setAttribute("numberProduct", numberProduct);
        //Get list course by category ID from courseDAO
        CourseDAO courseDAO = new CourseDAO();
        String categoryID = request.getParameter("categoryID");
        List<Course> listCourse = courseDAO.listCourseCategory(categoryID);
        request.setAttribute("listCourse", listCourse);
        //Get maxinum page can display
        int pageMax = listCourse.size() / Integer.parseInt(numberProduct);
        if (listCourse.size() % Integer.parseInt(numberProduct) != 0) {
            pageMax += 1;
        }
        request.setAttribute("pageMax", pageMax);
        request.setAttribute("url", "CourseListCategory?categoryID=" + categoryID);
        request.getRequestDispatcher("//view//courseSearch.jsp").forward(request, response);
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
