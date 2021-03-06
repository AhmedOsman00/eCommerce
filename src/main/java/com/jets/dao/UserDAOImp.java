package com.jets.dao;

import java.util.List;
import org.hibernate.*;
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
        sessionFactory = new Configuration().configure().buildSessionFactory();
        session = sessionFactory.openSession();
    }

    public static UserDAOImp getUserDAO() {
        if (userDAO == null) {
            userDAO = new UserDAOImp();
        }
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
        } catch (Exception ex) {
            ///////////////////////////Temporarily
            //session.close();
            ex.printStackTrace();
        }
        return userInserted;
    }

    @Override
    public User selectUser(String email, String password) {
        User user = null;
        if (session != null) {
            try {
                String hql = "from User where userEmail=:email and userPassword=:password";
                Query query = session.createQuery(hql);
                query.setParameter("email", email);
                query.setParameter("password", password);
                List<User> list = query.list();
                if (list.size() != 0) {
                    System.out.println("user :: found");
                    user = (User) list.get(0);
                }
            } catch (Exception exception) {
                System.out.println("Exception occred while reading user data: "
                        + exception.getMessage());
                exception.printStackTrace();
            }
        } else {
            System.out.println("DB server down.....");
        }
        return user;
    }

    @Override
    public boolean deleteUser(String email) {
        boolean userDeleted = false;

        if (session != null) {
            try {
                String hql = "from User where userEmail=:email";
                Query query = session.createQuery(hql);
                query.setParameter("email", email);
                List<User> list = query.list();
                if (list.size() != 0) {
                    System.out.println("user :: found");
                    userDeleted = true;

                }
            } catch (Exception exception) {
                System.out.println("Exception occred while reading user data: "
                        + exception.getMessage());
                exception.printStackTrace();
            }
        } else {
            System.out.println("DB server down.....");
        }
        
        return userDeleted;
    }

    @Override
    public boolean isEmailDuplicated(String Email) {
        boolean emailFound = false;

        return emailFound;
    }

    @Override
    public Session getCurrentSession() {
        return session;
    }

}
