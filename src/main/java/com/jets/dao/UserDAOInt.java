package com.jets.dao;

import org.hibernate.Session;

/**
 *
 * @author Fadwa
 */
public interface UserDAOInt {    
    public User selectUser (String name,String email);
    public boolean insertUser (User user);  
    public boolean deleteUser (String email);
    public boolean isEmailDuplicated (String Email);
    Session getCurrentSession();
}
