package com.jets.dao;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Fadwa
 */
public class EditUserProfileServlet extends HttpServlet {

    String userName, userJob, userEmail, userBD, userPassword, userAddress;

    CreditDAOInt creditDAO;
    UserDAOInt userDAO;
    Credit creditCode;
    int userId;
    Session userSession;
    User currentUser;
    Credit currentCode;
    double newCreditLimit;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            System.out.println("EditServlet");
            userName = request.getParameter("userName");
            userJob = request.getParameter("userJob");
            userEmail = request.getParameter("userEmail");
            userBD = request.getParameter("userbirthday");
            userPassword = request.getParameter("userPassword");
            userAddress = request.getParameter("userAddress");
            userId = Integer.parseInt(request.getParameter("userId"));

            userDAO = UserDAOImp.getUserDAO();
            userSession = userDAO.getCurrentSession();
            currentUser = (User) userSession.get(User.class, userId);

            currentUser.setUserName(userName);
            currentUser.setUserJob(userJob);
            currentUser.setUserEmail(userEmail);
            currentUser.setUserPassword(userPassword);
            currentUser.setAddress(userAddress);

            userSession.beginTransaction();
            userSession.persist(currentUser);
            userSession.getTransaction().commit();
            out.print("ok");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
