/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.ChapterDAO;
import dao.CourseDAO;
import dao.EnrollDAO;
import dao.RateDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Category;
import modal.Chapter;
import modal.Course;
import modal.Rate;
import modal.Student;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CourseDetails", urlPatterns = {"/CourseDetails"})
public class CourseDetails extends HttpServlet {

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
        try {
            String courseID = request.getParameter("courseID");
            HttpSession session = request.getSession();
            session.setAttribute("courseID", courseID);
            Student student = (Student) session.getAttribute("student");
            //Get a course by course ID from courseDAO
            CourseDAO courseDAO = new CourseDAO();
            Course course = courseDAO.getCourseById(courseID);
            request.setAttribute("course", course);
            //Get list category by course ID from categoryDAO
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listCategory = categoryDAO.listCategoryByCourse(courseID);
            request.setAttribute("categoryOfCourse", listCategory);
            //Get list chapter of course by course ID from chapterDAO
            ChapterDAO chapterDAO = new ChapterDAO();
            List<Chapter> listChapter = chapterDAO.listChapterByCourse(courseID);
            request.setAttribute("listChapter", listChapter);
            //Get list rate of course by course ID from rateDAO
            RateDAO rateDAO = new RateDAO();
            List<Rate> listRate = rateDAO.listRateByCourse(courseID);
            request.setAttribute("listRate", listRate);
            request.setAttribute("courseID", courseID);
            //Get percent of star one, two, three, four, five and average star 
            if (!listRate.isEmpty()) {
                int sumStar = 0;
                int starOne = 0;
                int starTwo = 0;
                int starThree = 0;
                int starFour = 0;
                for (Rate rate : listRate) {
                    sumStar += rate.getStar();
                    switch (rate.getStar()) {
                        case 1:
                            starOne += 1;
                            break;
                        case 2:
                            starTwo += 1;
                            break;
                        case 3:
                            starThree += 1;
                            break;
                        case 4:
                            starFour += 1;
                            break;
                        default:
                            break;
                    }
                }
                double percentStarOne = ((double) starOne / listRate.size()) * 100;
                double percentStarTwo = ((double) starTwo / listRate.size()) * 100;
                double percentStarThree = ((double) starThree / listRate.size()) * 100;
                double percentStarFour = ((double) starFour / listRate.size()) * 100;
                double percentStarFive = 100 - percentStarOne - percentStarTwo - percentStarThree - percentStarFour;
                request.setAttribute("avgStar", sumStar / listRate.size());
                request.setAttribute("percentStarOne", String.format("%.2f", percentStarOne));
                request.setAttribute("percentStarTwo", String.format("%.2f", percentStarTwo));
                request.setAttribute("percentStarThree", String.format("%.2f", percentStarThree));
                request.setAttribute("percentStarFour", String.format("%.2f", percentStarFour));
                request.setAttribute("percentStarFive", String.format("%.2f", percentStarFive));
            } else {
                request.setAttribute("avgStar", 0);
                request.setAttribute("percentStarOne", 0);
                request.setAttribute("percentStarTwo", 0);
                request.setAttribute("percentStarThree", 0);
                request.setAttribute("percentStarFour", 0);
                request.setAttribute("percentStarFive", 0);
            }
            //Check student enroll a course
            EnrollDAO enrollDAO = new EnrollDAO();
            if (student != null) {
                boolean isEnroll = enrollDAO.isEnroll(courseID, student.getAccount().getAccountID());
                request.setAttribute("isEnroll", isEnroll);
                if (isEnroll) {
                    request.setAttribute("rate", rateDAO.getRateByStudnetIdAndCourseId(student.getAccount().getAccountID(), Integer.parseInt(courseID)));
                }
            } else {
                request.setAttribute("isEnroll", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

        //Get list course related with a course
        //List<Course> relatedCourse = courseDAO.relatedCourse(courseID, listCategory.get(0).getCategoryID());
        //request.setAttribute("relatedCourse", relatedCourse);
        request.getRequestDispatcher("//view//courseDetails.jsp").forward(request, response);
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
