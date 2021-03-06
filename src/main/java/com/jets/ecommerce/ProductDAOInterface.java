/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jets.ecommerce;

import com.jets.dao.Product;
import java.util.ArrayList;
import org.hibernate.Session;

/**
 *
 * @author Ahmed
 */
public interface ProductDAOInterface {

    void insertProduct(Product product);
    void deleteProduct(Product product);
    ArrayList<Product> selectAllProducts();
    Product selectProductById(int id);
    Session getCurrentSession();
    ArrayList<Product> searchProducts(String key);
    public void updateProduct(Product editProduct) ;
}
