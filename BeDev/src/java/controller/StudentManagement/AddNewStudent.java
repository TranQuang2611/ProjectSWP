/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.StudentManagement;

import dao.StudentDAO;
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
import modal.Student;
import util.FileProcessor;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddNewStudent", urlPatterns = {"/admin/addnewstudent"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddNewStudent extends HttpServlet {
    String FILEPATH = "/BeDev/view/dist/images/avatar/";
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
        StudentDAO studentDAO = new StudentDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String studentName = request.getParameter("studentName");
        String cashInWallet = request.getParameter("cashInWallet");
        Part image = request.getPart("file");
        if (image == null) {
            session.setAttribute("addStudent", "failed");
            response.sendRedirect("/BeDev/admin/student");
            return;
        }
        String filename = fileProcessor.uploadFile(image, fileProcessor.getFolderImage(request, "avatar"));
        Student student = new Student();
        student.setName(studentName);
        student.setImageURL(FILEPATH + filename);
        student.setCashInWallet(Double.parseDouble(cashInWallet));
        boolean success = studentDAO.insertStudent(student, email, password);
        if (success) {
            session.setAttribute("addStudent", "success");
        } else {
            session.setAttribute("addStudent", "failed");
        }
        session.removeAttribute("editStudent");
        response.sendRedirect("/BeDev/admin/student");
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
