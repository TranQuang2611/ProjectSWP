/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.ChapterManagement;

import dao.ChapterDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditChapter", urlPatterns = {"/expert/editchapter"})
public class EditChapter extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
//        if (account.getRole().getRoleID() == 1) {
            ChapterDAO chapterDAO = new ChapterDAO();
            String courseId = request.getParameter("courseId");
            String chapterId = request.getParameter("chapterId");
            if (chapterDAO.checkChapterExistById(chapterId)) {
                String chapterName = request.getParameter("chapterName");
                
                String position = request.getParameter("position");
                String status = request.getParameter("status");
                boolean isActive = status != null;
                boolean success = chapterDAO.updateChapter(chapterId, chapterName, position, isActive);
                if (success) {
                    session.setAttribute("editChapter", "success");
                } else {
                    session.setAttribute("editChapter", "failed");
                }
                session.removeAttribute("addChapter");
            } else {
                session.setAttribute("editChapter", "failed");
            }
            response.sendRedirect("/BeDev/expert/chapter?courseId=" + courseId);
//        }
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
