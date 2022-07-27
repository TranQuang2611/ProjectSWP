/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OptionDAO;
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
@WebServlet(name = "AddOption", urlPatterns = {"/AddOption"})
public class AddOption extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        OptionDAO optionDAO = new OptionDAO();
        int quesID = 0;
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    quesID = Integer.parseInt(request.getParameter("quesID"));
                    String content = request.getParameter("content");
                    String status = request.getParameter("status");
                    if (status.equalsIgnoreCase("true")) {
                        optionDAO.insertOption(quesID, content, 1); //add new option into database with status is true
                    } else {
                        optionDAO.insertOption(quesID, content, 0); //add new option into database with status is false
                    }
                    if (request.getParameter("check").isEmpty()) {
                        response.sendRedirect("EditOption?quesID=" + quesID);
                    } else {
                        response.sendRedirect("EditOption?quesID=" + quesID + "&check=true");
                    }
                } else {
                    response.sendRedirect("HomeControl");
                }
            } else {
                response.sendRedirect("SignIn");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("khong parse duoc");
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
