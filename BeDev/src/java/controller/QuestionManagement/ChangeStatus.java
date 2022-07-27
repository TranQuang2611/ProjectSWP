/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.QuestionManagement;

import controller.*;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "ChangeStatus", urlPatterns = {"/expert/ChangeStatus"})
public class ChangeStatus extends HttpServlet {

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
        QuestionDAO questionDAO = new QuestionDAO();   
        if (session.getAttribute("account") != null) {  //check login with account session
            if (session.getAttribute("expert") != null) {
                if (request.getParameter("action") != null && request.getParameter("quesID") != null && request.getParameter("qid") != null) {
                    int quesID = Integer.parseInt(request.getParameter("quesID"));
                    int qid = Integer.parseInt(request.getParameter("qid"));
                    if (request.getParameter("action").equalsIgnoreCase("Inactive")) {
                        questionDAO.inActiveQuestion(quesID, qid);  //update status is false of the question in database by question id
                        System.out.println("noooo");
                    }
                    if (request.getParameter("action").equalsIgnoreCase("Active")) {
                        questionDAO.activeQuestion(quesID, qid);    //update status is true of the question in database by question id
                    }
                    if (request.getParameter("action").equalsIgnoreCase("Delete")) {
                        questionDAO.deleteQuestion(quesID, qid);    //delete question in database by question id
                    }
                    response.sendRedirect("/BeDev/expert/ManageQuestion?qid="+qid);
                }
            } else {
                response.sendRedirect("/HomeControl");
            }
        } else {
            response.sendRedirect("SignIn");
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
