/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.ExpertManagement;

import dao.ExpertDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modal.Account;
import modal.Expert;
import util.FileProcessor;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditExpert", urlPatterns = {"/admin/editexpert"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EditExpert extends HttpServlet {
    String FILEPATH = "/BeDev/view/dist/images/courses/";
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
        FileProcessor fileProcessor = new FileProcessor();
        ExpertDAO expertDAO = new ExpertDAO();
        String expertId = request.getParameter("expertId");
        Expert expert = expertDAO.getExpertById(expertId);
        if (expert == null) {
            session.setAttribute("editExpert", "failed");
            response.sendRedirect("/BeDev/manage/expert");
            return;
        }
        String name = request.getParameter("expertName");
        String phone = request.getParameter("phone");
        String description = request.getParameter("description");
        Part image = request.getPart("file");
        if (image.getSize() != 0) {
            fileProcessor.delete(expert.getImg().split("/")[expert.getImg().split("/").length - 1], FILEPATH);
            String filename = fileProcessor.uploadFile(image, fileProcessor.getFolderImage(request, "instructor"));
            expert.setImg(FILEPATH + filename);
        }
        expert.setExpertName(name);
        expert.setPhone(phone);
        expert.setDescription(description);
        boolean success = expertDAO.updateExpert(expert);
        if (success) {
            session.setAttribute("editExpert", "success");
        } else {
            session.setAttribute("editExpert", "failed");
        }
        response.sendRedirect("/BeDev/admin/expert");
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
