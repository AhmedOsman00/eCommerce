package com.jets.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fadwa
 */
public class SignUpServlet extends HttpServlet {

    private Validator validator = new Validator();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text");

        try (PrintWriter out = response.getWriter()) {
            String checkParam = request.getParameter("check");

            if (checkParam.equals("email")) {

                String email = request.getParameter("email");
                if (validator.validateEmail(email)) {
                    if (validator.checkEmailUniqueness(email)) {
                        out.print("valid");
                        System.out.println("ValidEmail");
                    } else {
                        out.print("invalid");
                    }
                } else {
                    out.print("invalid");
                }

            } else if (checkParam.equals("password")) {
                String password = request.getParameter("password");
                if (validator.validatePassword(password)) {
                    System.out.println("ValidPassword");
                    out.print("valid");
                } else {
                    out.print("invalid");
                }
            } else if (checkParam.equals("confirm")) {
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmpassword");
                if (validator.validatePasswordAndConfirmPassword(password, confirmPassword)) {
                    System.out.println("Confirmed");
                    out.print("valid");
                } else {
                    out.print("invalid");
                }
            } else if (checkParam.equals("birthday")) {
                String birthday = request.getParameter("birthday");
                if (validator.validateBirthday(birthday)) {
                    out.print("valid");
                    System.out.println("Valid BD");
                } else {
                    out.print("invalid");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text");
        System.out.println("Hello Servlet Post");
        try (PrintWriter out = response.getWriter()) {   
            User newUser = new User();            
            newUser.setUserName(request.getParameter("name"));
            newUser.setUserEmail(request.getParameter("email"));
            newUser.setUserPassword(request.getParameter("password"));
            newUser.setUserBirthday(request.getParameter("birthday"));
            newUser.setUserJob(request.getParameter("job"));
            newUser.setAddress(request.getParameter("address"));
            newUser.setGender("m");
            newUser.setType("u");
            newUser.setUserCreditLimt(0.0);
            
            System.out.println(newUser.getUserName());
            
            if(UserDAOImp.getUserDAO().insertUser(newUser))
                out.print("valid");
            else
                out.print("invalid");

        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
    }

}
