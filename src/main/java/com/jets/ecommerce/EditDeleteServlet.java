/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jets.ecommerce;

import com.jets.dao.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hossam
 */
public class EditDeleteServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int deleteId = Integer.parseInt(request.getParameter("id"));
        System.out.println(deleteId+"delete servlet");
        ProductManager mgr = ProductManager.getProductManager();
        mgr.deleteProduct(mgr.selectProductById(deleteId));
        request.getRequestDispatcher("ProductsServlet").forward(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id+"edit servlet");
        ProductManager mgr = ProductManager.getProductManager();
        Product editedProduct = mgr.selectProductById(id);
        request.setAttribute("product",editedProduct);
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
    }

    
}
