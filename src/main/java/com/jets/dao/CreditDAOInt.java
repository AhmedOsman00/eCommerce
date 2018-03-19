package com.jets.dao;

import org.hibernate.Session;

/**
 *
 * @author Fadwa
 */
public interface CreditDAOInt {
    
    public Credit getCreditCode(String code);
    
    public boolean deleteCreditCode(String code);
    
    public Session getCurrentSession();
    
}
