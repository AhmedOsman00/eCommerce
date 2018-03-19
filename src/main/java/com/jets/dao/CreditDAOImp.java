package com.jets.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class CreditDAOImp implements CreditDAOInt {

    private Session session;
    private SessionFactory sessionFactory;
    private static CreditDAOImp creditDAO;

    private CreditDAOImp() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        session = sessionFactory.openSession();
    }

    public static CreditDAOImp getCreditDAO() {
        if (creditDAO == null) {
            creditDAO = new CreditDAOImp();
        }
        return creditDAO;
    }

    @Override
    public Credit getCreditCode(String code) {
        int codeValue = Integer.parseInt(code);
        Credit credit = null;
        if (session != null) {
            try {
                String hql = "from Credit where code=:creditcode";
                Query query = session.createQuery(hql);
                query.setParameter("creditcode", codeValue);

                List<Credit> list = query.list();
                if (list.size() != 0) {
                    credit = (Credit) list.get(0);
                }
            } catch (Exception exception) {
                System.out.println("Exception occurred while reading credit "
                        + exception.getMessage());
                exception.printStackTrace();
            }
        } else {
            System.out.println("DB server is down.....");
        }
        return credit;
    }

    @Override
    public boolean deleteCreditCode(String code) {
        boolean isDeleted = false;

        if (session != null) {
            try {
                session.beginTransaction();
                String hql = "delete Credit c where c.code = :codeValue";
                Query query = session.createQuery(hql);
                query.setParameter("codeValue", code);
                isDeleted = true;
                session.getTransaction().commit();
                
            } catch (Exception exception) {
                System.out.println("Exception occurred while deleting from Credit "
                        + exception.getMessage());
                exception.printStackTrace();
            }
        } else {
            System.out.println("DB server is down.....");
        }
        return isDeleted;
    }

    @Override
    public Session getCurrentSession() {
        return session;
    }

}
