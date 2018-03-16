package com.jets.dao;

import com.jets.dao.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Fadwa
 */
public class UserDAOImp implements UserDAOInt {
    private Session session;
    private SessionFactory sessionFactory;
    private static UserDAOImp userDAO;
    
    private UserDAOImp() {
        sessionFactory = new Configuration()
                .configure().buildSessionFactory();
        session = sessionFactory.openSession();
        //To close session:
        //session.close();
    }
    
    public static UserDAOImp getUserDAO() {
        if(userDAO == null)
            userDAO = new UserDAOImp();
        return userDAO;
    }
    
    @Override
    public boolean insertUser(User user) {
        boolean userInserted = false;
        try {
            session.beginTransaction();
            session.persist(user);
            session.getTransaction().commit();
            System.out.println("Insertion Done");
            userInserted = true;
            
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return userInserted;
    }

    @Override
    public User selectUser(String email) {
        User newUser = new User();
        return newUser;
    }

    @Override
    public boolean deleteUser(String email) {
        boolean userDeleted = false;
        
        return userDeleted;
    }

    @Override
    public boolean updateUser(User user) {
        boolean userUpdated = false;
        
        return userUpdated;
    }
}
