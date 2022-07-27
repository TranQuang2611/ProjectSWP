/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.OptionManagement;

import controller.*;
import dao.OptionDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Expert;
import modal.Option;
import modal.Question;

/**
 *
 * @author quang
 */
@WebServlet(name = "EditOption", urlPatterns = {"/expert/EditOption"})
public class EditOption extends HttpServlet {

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
        request.getRequestDispatcher("/view/editOption.jsp").forward(request, response);
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
        Question question = new Question();
        ArrayList<Option> listOption = new ArrayList<>();
        QuestionDAO questionDAO = new QuestionDAO();
        OptionDAO optionDAO = new OptionDAO();
        String check = null;
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    Expert expert = (Expert) session.getAttribute("expert");
                    int quesID = Integer.parseInt(request.getParameter("quesID"));
                    if (request.getParameter("check") != null) {
                        check = request.getParameter("check");
                    }
                    question = questionDAO.getQuestion(quesID, expert.getExpertID()); //get question by id of the question
                    listOption = optionDAO.listOption(quesID, expert.getExpertID()); //get list option by the question id
                } else {
                    response.sendRedirect("/HomeControl");
                    return;
                }
            } else {
                response.sendRedirect("/SignIn");
                return;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Can not parse");
        }
        request.setAttribute("check", check);
        request.setAttribute("question", question);
        request.setAttribute("listOption", listOption);
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
        OptionDAO optionDAO = new OptionDAO();
        HttpSession session = request.getSession();
        ArrayList<Option> listOption = new ArrayList<>();
        int quesID = 0;
        try {
            if (session.getAttribute("account") != null) {  //check login with account session
                if (session.getAttribute("expert") != null) {
                    Expert expert = (Expert)session.getAttribute("expert");
                    String[] listNewOption = request.getParameterValues("content"); //get the array string of parameter content
                    quesID = Integer.parseInt(request.getParameter("quesID"));
                    listOption = optionDAO.listOption(quesID,expert.getExpertID());  //get list option of the question by id of question
                    for (int i = 0; i < listOption.size(); i++) {
                        optionDAO.updateOption(listNewOption[i], listOption.get(i).getOptionID());  //update inormation of option contain content, is True, is False by id of question
                    }
                } else {
                    response.sendRedirect("HomeControl");
                    return;
                }
            } else {
                response.sendRedirect("SignIn");
                return;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Khong parse duoc");
        }
        if (!request.getParameter("check").isEmpty()) {
            response.sendRedirect("/BeDev/expert/EditOption?quesID=" + quesID + "&check=true");
        } else {
            response.sendRedirect("/BeDev/expert/EditOption?quesID=" + quesID);
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
