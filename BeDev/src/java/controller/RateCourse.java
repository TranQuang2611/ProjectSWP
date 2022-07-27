
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

import dao.RateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RateCourse", urlPatterns = {"/RateCourse"})
public class RateCourse extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int courseID = Integer.parseInt(session.getAttribute("courseID").toString());
        if (request.getParameter("rate")==null) {//if dont choose rate then do nothing
            response.sendRedirect("CourseDetails?courseID="+courseID);
            return;
        }
        int star  = Integer.parseInt(request.getParameter("rate"));//get number of star
        String contentRate = request.getParameter("contentRate");
        
        // get content of rate
        Student student = (Student) session.getAttribute("student");
        int studentId = student.getAccount().getAccountID();
        RateDAO rateDAO = new RateDAO();
        if (rateDAO.checkRated(studentId, courseID)) {//if rated then update this rate
            rateDAO.updateRate(courseID, studentId, star, contentRate);
            response.sendRedirect("CourseDetails?courseID="+courseID);
        }else{// if haven't rate then add rate
            rateDAO.rateCourse(courseID, studentId, star, contentRate);
            response.sendRedirect("CourseDetails?courseID="+courseID);
        }
        
       
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
