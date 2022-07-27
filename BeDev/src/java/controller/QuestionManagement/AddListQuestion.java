/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.QuestionManagement;

import dao.QuestionDAO;
import dao.QuizDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Expert;
import modal.Quiz;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddListQuestion", urlPatterns = {"/expert/AddListQuestion"})

public class AddListQuestion extends HttpServlet {

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
        request.getRequestDispatcher("/view/addListQuestion.jsp").forward(request, response);
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
        QuizDAO quizDAO = new QuizDAO();
        modal.Quiz quiz = new Quiz();
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    Expert expert = (Expert) session.getAttribute("expert");
                    int qid = Integer.parseInt(request.getParameter("qid"));
                    quiz = quizDAO.getQuizByIdandExpertId(qid, expert.getExpertID());
                    if (quiz == null) {
                        response.sendRedirect("/Error");
                        return;
                    }
                } else {
                    response.sendRedirect("/HomeControl");
                    return;
                }
            } else {
                response.sendRedirect("/SignIn");
                return;
            }
        } catch (Exception e) {
        }
        request.setAttribute("quiz", quiz);
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
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            int qid = Integer.parseInt(request.getParameter("qid"));
            String[] content = request.getParameter("content").trim().split("///");
            for (String x : content) {
                questionDAO.insertQuestion(x, qid);                         
            }
            response.sendRedirect("ManageQuestion?qid="+qid);  
        } catch (Exception e) {
            System.out.println(e);
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
