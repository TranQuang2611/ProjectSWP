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
import modal.Expert;
import modal.Question;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditQuestion", urlPatterns = {"/expert/EditQuestion"})
public class EditQuestion extends HttpServlet {

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
        request.getRequestDispatcher("/view/editQuestion.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Question question;
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    Expert expert = (Expert)session.getAttribute("expert");
                    int quesID = Integer.parseInt(request.getParameter("quesID"));
                    question = questionDAO.getQuestion(quesID,expert.getExpertID()); //get question by id of the question
                } else {
                    response.sendRedirect("/HomeControl");
                    return;
                }
            } else {
                response.sendRedirect("/SignIn");
                return;
            }
        } catch (Exception e) {
            System.out.println("Can not parse id");
            response.sendRedirect("/Error");
            return;
        }
        request.setAttribute("question", question);
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
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            int quesID = Integer.parseInt(request.getParameter("quesID"));
            int qid = Integer.parseInt(request.getParameter("qid"));
            String content = request.getParameter("content");
            String explain = request.getParameter("explain");
            System.out.println(content);
            System.out.println(explain);
            System.out.println(qid);
            System.out.println(quesID);
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    questionDAO.editQuestion(content, explain, quesID, qid); //update the question with information of question contains content, explain
                    doGet(request, response);
                } else {
                    response.sendRedirect("/HomeControl");
                }
            } else {
                response.sendRedirect("/SignIn");
            }
        } catch (Exception e) {
            System.out.println("Can not parse");
            response.sendRedirect("/Error");
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
