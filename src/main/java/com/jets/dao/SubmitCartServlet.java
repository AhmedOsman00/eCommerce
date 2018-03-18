/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jets.dao;

import com.jets.ecommerce.ProductDAOInterface;
import com.jets.ecommerce.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Ahmed
 */
public class SubmitCartServlet extends HttpServlet {

    private ProductDAOInterface productDAOInterface;
    private Session session;
    private UserDAOImp userDAOImp;
    private Session userSession;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        Integer length = Integer.parseInt(request.getParameter("length"));
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        double sum = 0;
        productDAOInterface = ProductManager.getProductManager();
        session = productDAOInterface.getCurrentSession();
        userDAOImp = UserDAOImp.getUserDAO();
        userSession = userDAOImp.getCurrentSession();
       User user = (User) userSession.get(User.class, userID);
        
        for (int i = 0; i < length; i++) {
            Integer id = Integer.parseInt(request.getParameter("id" + (i + 1)));
            Integer quantity = Integer.parseInt(request.getParameter("qty" + (i + 1)));
            Product product = (Product) session.get(Product.class, id);
            //check quantity
            if (product.getProductQuantity() <= quantity) {
                product.setProductQuantity(product.getProductQuantity()-quantity);
            }
            //sum of prices
            sum = sum + product.getProductPrice();            
        }
        //check credit
        if(user.getUserCreditLimt() <= sum){
            user.setUserCreditLimt(user.getUserCreditLimt()-sum);
        }
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
