/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jets.ecommerce;

import com.jets.dao.Product;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ahmed
 */
public class ProductManager implements ProductDAOInterface {

    private Session session;
    private SessionFactory sessionFactory;
    private static ProductManager productManager;

    private ProductManager() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        session = sessionFactory.openSession();        
    }
    
    public static ProductManager getProductManager (){
        if(productManager == null){
            productManager = new ProductManager();            
        }
        return productManager;
    }

    @Override
    public void insertProduct(Product product) {
        session.beginTransaction();
        session.persist(product);
        session.getTransaction().commit();     
    }

    @Override
    public void deleteProduct(Product product) {
        session.beginTransaction();
        session.persist(product);//check for presistance
        session.delete(product);
        session.getTransaction().commit();
    }

    @Override
    public ArrayList<Product> selectAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        String queryStmt = "from Product";
        Query query = session.createQuery(queryStmt);
        List result = query.list();
        Iterator iterator = result.iterator();
        while (iterator.hasNext()) {
            Product product = (Product) iterator.next();
            products.add(product);
        }
        return products;
    }
    @Override
    public Product selectProductById(int id){
        Product product =  (Product) session.get(Product.class, id);
        return product;
    }
    
}
