/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CourseDAO;
import dao.EnrollDAO;
import dao.ExpertDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;
import modal.Course;
import modal.Expert;
import modal.Student;
import modal.Transaction;

/**
 *
 * @author admin
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {

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
        request.getRequestDispatcher("//view/studentProfile.jsp").forward(request, response);
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
        CourseDAO courseDAO = new CourseDAO();
        StudentDAO studentDao = new StudentDAO();
        ExpertDAO expertDao = new ExpertDAO();
        EnrollDAO enrollDAO = new EnrollDAO();
        ArrayList<Transaction> listTransaction = new ArrayList<>();
        try {
            if (session != null && session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");

                if (account.getRole().getRoleID() == 3) { //check account is student
                    Student student = studentDao.profile(account.getAccountID()); // get profile of student         
                    int countEnroll = enrollDAO.countEnrollOfStudent(account.getAccountID()); // count enroll of student
                    listTransaction = studentDao.listTransactionByStudent(student.getAccount().getAccountID());
                    for (Transaction transaction : listTransaction) {
                    }
                    request.setAttribute("student", student);
                    request.setAttribute("countEnroll", countEnroll);                  
                    List<Course> listCourseRegisterd = new ArrayList<>();
                    int id = account.getAccountID();
                    listCourseRegisterd = courseDAO.getCourseByStudentId(id);//get list registed course  of a student.
                    request.setAttribute("listCourseRegisterd", listCourseRegisterd);
                    int numberOfCompletedCourse = 0;
                    for (Course course : listCourseRegisterd) {//get number of completed course
                        if (course.getPercentOfComplete()==1) {
                            numberOfCompletedCourse++;
                        }
                    }
                    request.setAttribute("numberOfCompletedCourse", numberOfCompletedCourse);
                    
                    request.setAttribute("listTransaction", listTransaction);
                    processRequest(request, response);
                    session.setAttribute("student", student);
                }
                if (account.getRole().getRoleID() == 2) { //check account is expert
                    Expert expert = expertDao.profile(account.getAccountID()); // get profile of expert
                    request.setAttribute("expert", expert);
                    session.setAttribute("expert", expert);
                    processRequest(request, response);
                }

            } else {
                response.sendRedirect("SignIn");
                return;
            }
        } catch (IOException e) {
            System.out.println(e);
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        EnrollDAO enrollDAO = new EnrollDAO();
        StudentDAO studentDao = new StudentDAO();
        ExpertDAO expertDao = new ExpertDAO();
        try {
            if (session != null && session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                if (account.getRole().getRoleID() == 3) { //check account is student
                    String name = request.getParameter("name");
                    studentDao.editProfile(account.getAccountID(), name); // update profile of student

                    Student student = studentDao.profile(account.getAccountID()); // get profile of student
                    int countEnroll = enrollDAO.countEnrollOfStudent(account.getAccountID()); // count enroll of student
                    session.setAttribute("student", student);
                    request.setAttribute("countEnroll", countEnroll);
                }
                if (account.getRole().getRoleID() == 2) { //check account is expert
                    String name = request.getParameter("name");
                    String phone = request.getParameter("phone");
                    String des = request.getParameter("des");
                    expertDao.editProfileExpert(account.getAccountID(), name, phone, des); // update profile of expert
                    Expert expert = expertDao.profile(account.getAccountID()); // get profile of expert
                    session.setAttribute("expert", expert);
                    request.setAttribute("expert", expert);
                }

            } else {
                response.sendRedirect("SignIn");
                return;
            }
        } catch (IOException e) {
            System.out.println(e);
        }
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
