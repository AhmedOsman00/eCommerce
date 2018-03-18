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
        session.beginTransaction();
        session.persist(user);
        session.getTransaction().commit();
        System.out.println("Insertion Done");
        userInserted = true;
        return userInserted;
    }

    @Override
    public User selectUser(String username, String email) {
        User user = null;
        if (session != null) {
            try {
                String hql = "from User where userName=:username and userEmail=:email";
                Query query = session.createQuery(hql);
                query.setParameter("username", username);
                query.setParameter("email", email);
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

        return userDeleted;
    }

    @Override
    public Session getCurrentSession() {
        return session;
    }
}
