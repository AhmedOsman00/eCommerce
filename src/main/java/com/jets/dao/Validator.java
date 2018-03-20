package com.jets.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Fadwa
 */
public class Validator {

    public static final Pattern VALID_EMAIL_REGEX
            = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static final Pattern VALID_BIRTHDAY_REGEX
            = Pattern.compile("(([0-2][0-9]|3[0-1])\\-([0-1][0-2]|0[3-9])\\-([1-9][0-9]{3}))", Pattern.CASE_INSENSITIVE);

    private UserDAOInt userdao = UserDAOImp.getUserDAO();

    //returns true if the user was not found
    public boolean checkEmailUniqueness(String email) {
        boolean res= false;
        if(userdao.isEmailDuplicated(email)==false){
            res = true;
            
        }
        return res;
    }

    public boolean validateEmail(String email) {
        Matcher matcher = VALID_EMAIL_REGEX.matcher(email);
        return matcher.find();
    }

    public boolean validateBirthday(String birthday) {
        boolean res = false;
        Matcher matcher = VALID_BIRTHDAY_REGEX.matcher(birthday);
        int daysPerMonth = 0;

        if (matcher.find()) {
            String[] birthdayParts = birthday.split("-");
            //Check if the user didn't enter 00
            System.out.println("Correct Form");

            if (!birthdayParts[0].equals("00") && !birthdayParts[1].equals("00") && !birthdayParts[2].equals("0000")) {
                //Check if the day has passed
                try {
                    if (new SimpleDateFormat("dd-MM-yyyy").parse(birthday).before(new Date())) {
                        //Check if the year is valid
                        if (Integer.parseInt(birthdayParts[2]) >= 1850) {
                            //Check if the day is valid
                            System.out.println("Correct Year");
                            switch (Integer.parseInt(birthdayParts[1])) {
                                case 1:
                                case 3:
                                case 5:
                                case 7:
                                case 8:
                                case 10:
                                case 12:
                                    daysPerMonth = 31;
                                    break;
                                case 2:
                                    if (Integer.parseInt(birthdayParts[2]) % 4 == 0) {
                                        daysPerMonth = 29;
                                    } else {
                                        daysPerMonth = 28;
                                    }
                                    break;
                                case 4:
                                case 6:
                                case 9:
                                case 11:
                                    daysPerMonth = 30;
                                    break;
                            }
                            System.out.println("Days:" + daysPerMonth);
                            System.out.println("Day:" + Integer.parseInt(birthdayParts[0]));
                            if (Integer.parseInt(birthdayParts[0]) <= daysPerMonth) {
                                res = true;
                            }
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        else {
            System.out.println("Not Correct Form");
        }
        return res;
    }

    public boolean validatePassword(String password) {
        return password.length() >= 6;
    }

    public boolean validatePasswordAndConfirmPassword(String password, String confirmPassword) {
        return password.equals(confirmPassword);
    }
}
