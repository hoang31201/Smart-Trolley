/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author quyda
 */

public class Validator implements Serializable {

    private final String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";//in format of normal email address, ex. test1@hotmail.com
    private final String namePattern = "^$|(([A-za-z\\s]+)((\\s)([A-za-z\\s])+)*)";//null or normal name
    private final String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";//Minimum six characters, at least one uppercase letter, one lowercase letter, one number and one special character
    private final String datePattern = "^[0-9]{4}-(1[0-2]|0[1-9])-(3[01]|[12][0-9]|0[1-9])$";//format yyyy-mm-dd
    private final String phoneNumPattern = "[0-9]{10}";//10 digits format
    private final String addressPattern = "([A-Za-z0-9]+)((\\s)([A-za-z0-9\\s])+)*";// 10 Canterbury st
    private final String idPattern= "[0-9]+";
    private final String cardNoPattern = "[0-9]{16}";
    private final String cvvPattern = "[0-9]{3}";
    private final String expPattern = "/^(0?[1-9]|[12][0-9]|3[01])[\\/\\-](0?[1-9]|1[012])$/";
    public Validator() {
    }
    
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean checkEmpty(String a, String b) {
        return a.isEmpty() || b.isEmpty();
    }
    
    public boolean validateID(String ID) {
        return validate(idPattern, ID);
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    public boolean validateDate(String date) {
        return validate(datePattern, date);
    }

    public boolean validatePhone(String phoneNum) {
        return validate(phoneNumPattern, phoneNum);
    }

    public boolean validateAddress(String address) {
        return validate(addressPattern, address);
    }
    
    public boolean validateCardNo(String cardNo) {
        return validate(cardNoPattern, cardNo);
    }
    
    public boolean validateCVV(String CVV) {
        return validate(cvvPattern, CVV);
    }
    
    public boolean validateExp(String exp) {
        return validate(expPattern, exp);
    }
    
    public static void clear(HttpSession session) { 
        session.setAttribute("idErr", "1");
        session.setAttribute("emailErr", "1");
        session.setAttribute("passErr", "1");
        session.setAttribute("nameErr", "1");
        session.setAttribute("phoneErr", "1");
        session.setAttribute("addressErr", "1");
        session.setAttribute("dateErr", "1");
        session.setAttribute("updated", "1");
        session.setAttribute("authentication", "1");
        session.setAttribute("cardNoErr", "1");
        session.setAttribute("cvvErr", "1");
        session.setAttribute("expErr", "1");
        session.setAttribute("itemError", "1");
        session.setAttribute("deleteError", "1");
    }
}
