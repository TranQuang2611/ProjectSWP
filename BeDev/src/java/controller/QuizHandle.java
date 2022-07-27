/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CourseDAO;
import dao.OptionDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Course;
import modal.Option;
import modal.Question;
import modal.Quiz;

/**
 *
 * @author ACER
 */
@WebServlet(name = "QuizHandle", urlPatterns = {"/QuizHandle"})
public class QuizHandle extends HttpServlet {

    ArrayList<Question> questionList;

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
        request.getRequestDispatcher("//view//quizhandle.jsp").forward(request, response);

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
        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            int quizID = Integer.parseInt(request.getParameter("qid"));
            int courseID = Integer.parseInt(request.getParameter("cid"));
            Quiz quiz = quizDAO.getQuizByID(quizID);
            ArrayList<Question> questionList = questionDAO.getQuestionByQuizID(quizID);
            request.setAttribute("questionList", questionList);
            request.setAttribute("courseID", courseID);
            request.setAttribute("quiz", quiz);
        } catch (Exception e) {
            response.sendRedirect("Error");
            return;
        }

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
        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        HttpSession session = request.getSession();
        OptionDAO optionDAO = new OptionDAO();

        double totalGrade = 0;
        try {
            Account account = (Account) session.getAttribute("account");
            int quizID = Integer.parseInt(request.getParameter("qid"));
            int courseID = Integer.parseInt(request.getParameter("cid"));

            ArrayList<Question> questionList = questionDAO.getQuestionByQuizID(quizID);
            ArrayList<Question> questionRecord = new ArrayList<>();
            for (Question question : questionList) {
                // get checked option
                String[] studentOptions = request.getParameterValues(Integer.toString(question.getQuestionID()));
                if (studentOptions == null) {   // student not answer this question
                    questionRecord.add(new Question(question.getQuestionID()));
                    continue;
                }
                ArrayList<Option> optionRecord = new ArrayList<>();
                Question q = new Question(question.getQuestionID());
                for (Option option : question.getOptionList()) {
                    if (Arrays.asList(studentOptions).contains(Integer.toString(option.getOptionID()))) {  // student option
                        if (option.isTrue()) {  // student option is true
                            totalGrade += option.getPoint();
                        }
                        optionRecord.add(new Option(option.getOptionID()));
                    }
                }
                q.setOptionList(optionRecord);
                questionRecord.add(q);
            }
            int quizRecordID = quizDAO.insertQuizRecord(account.getAccountID(), (double) Math.round(totalGrade * 100) / 100, quizID);
            if (quizRecordID == -1) {   // can't insert into database
                request.setAttribute("mess", "Cannot insert quiz record.");
                request.setAttribute("quiz", new Quiz(quizID));
                request.setAttribute("courseID", courseID);
                processRequest(request, response);
                return;
            }
            optionDAO.insertOptionRecord(questionRecord, quizRecordID);
            response.sendRedirect("QuizReview?rid=" + quizRecordID + "&qid=" + quizID + "&courseID=" + courseID);    // redirect to view result
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
