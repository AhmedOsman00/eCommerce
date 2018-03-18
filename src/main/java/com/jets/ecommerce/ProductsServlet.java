/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jets.ecommerce;

import com.jets.dao.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hossam
 */
public class ProductsServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductManager mgr = ProductManager.getProductManager();
//        ArrayList<Product> products = mgr.selectAllProducts();
        Product p = new Product("dog", 1000, "rott", 2, "https://cdn.working-dog.net/gXsRN130AhC5GaFhwpdaqwCW3SFDh_bC1VAMLu0xdBE,.jpg");
        p.setProductId(1);
        Product p2 = new Product("dog", 1000, "rott", 2, "https://cdn.working-dog.net/gXsRN130AhC5GaFhwpdaqwCW3SFDh_bC1VAMLu0xdBE,.jpg");
        p2.setProductId(2);
        ArrayList<Product> products = new ArrayList();
        products.add(p);
        products.add(p2);
        request.setAttribute("products",products);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        ProductManager mgr = ProductManager.getProductManager();
        Product viewProduct = mgr.selectProductById(id);
//        request.setAttribute("viewProduct",viewProduct);
        Product p2 = new Product("dog", 1000, "rott", 2, "https://cdn.working-dog.net/gXsRN130AhC5GaFhwpdaqwCW3SFDh_bC1VAMLu0xdBE,.jpg");
        p2.setProductId(2);
        request.setAttribute("viewProduct",p2);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

  
}
