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
public class CreditChargeServlet extends HttpServlet {

    CreditDAOInt creditDAO;
    UserDAOInt userDAO;
    Credit creditCode;
    int userId;
    Session userSession;
    User currentUser;
    Credit currentCode;
    double newCreditLimit;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) { 
            
            userId = Integer.parseInt(request.getParameter("userId"));       
            
            userDAO = UserDAOImp.getUserDAO();
            userSession = userDAO.getCurrentSession();
            currentUser = (User) userSession.get(User.class, userId);
            
            creditDAO = CreditDAOImp.getCreditDAO();
            creditCode = creditDAO.getCreditCode(request.getParameter("code"));
            
            if(creditCode == null)
                out.print("wrong");
            else {
                //increase user's credit
                newCreditLimit = currentUser.getUserCreditLimt() + creditCode.getValue();
                currentUser.setUserCreditLimt(newCreditLimit);
                userSession.beginTransaction();
                userSession.persist(currentUser);
                userSession.getTransaction().commit();
                
                //delete credit code row
                creditDAO.deleteCreditCode(creditCode.toString());
                request.getSession().setAttribute("userInformation", currentUser);
                out.print(currentUser.getUserCreditLimt());
            }
        
        
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

}
