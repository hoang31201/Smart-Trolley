/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Customer;
import uts.asd.model.dao.DBManager;
import uts.asd.controller.Validator;
import uts.asd.model.Staff;

/**
 *
 * @author quyda
 */
// this servlet take input information from either customer or staff register screen, validate it and decide whether to save it to databse or return an error message
public class AccountCreateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String Email = request.getParameter("Email");
        String FName = request.getParameter("FName");
        String LName = request.getParameter("LName");
        String Password = request.getParameter("Password");
        String Password2 = request.getParameter("Password2");
        String PhoneNum = request.getParameter("PhoneNum");
        String Address = request.getParameter("Address");
        String DOB = request.getParameter("DOB");
        String Role = request.getParameter("staffRole");
        String customerCreate = (String) session.getAttribute("customerCreate");
        String staffCreate = (String) session.getAttribute("staffCreate");
        boolean checked = true;
        Validator validate = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            validate.clear(session);//check the format
                if (customerCreate.equals("true")) {
                    if (manager.CustomerExist(Email) || manager.StaffExist(Email)) {
                        session.setAttribute("emailErr", "existed");
                        checked = false;
                    }

                } else if (staffCreate.equals("true")) {
                    if (manager.CustomerExist(Email) || manager.StaffExist(Email)) {//check if email exist
                        session.setAttribute("emailErr", "existed");
                        checked = false;
                    }
                }

                if (Email.isEmpty()) {
                    session.setAttribute("emailErr", "empty");
                    checked = false;
                } else if (!validate.validateEmail(Email)) {
                    session.setAttribute("emailErr", "emailErr");//check the format
                    checked = false;
                }

                if (DOB.equals("")) {//take current date if user did not choose DOB
                    LocalDate date = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    DOB = date.format(formatter);
                }

                if (!validate.validatePassword(Password) || !validate.validatePassword(Password2) ) {//validate password format
                    session.setAttribute("passErr", "passErr");
                    checked = false;
                }
                if (!Password.equals(Password2)) {//check if password and retype password matched
                    session.setAttribute("passErr", "noMatch");
                    checked = false;
                }
                if (!FName.isEmpty() || !LName.isEmpty()) {//both FName and LName can not be empty
                    if (!validate.validateName(FName) || !validate.validateName(LName)) {
                        session.setAttribute("nameErr", "nameErr");
                        checked = false;
                    }
                }else{               
                    session.setAttribute("nameErr", "empty");
                    checked = false;
                }

                if (!PhoneNum.isEmpty()) {//validate phone number format
                    if (!validate.validatePhone(PhoneNum)) {
                        session.setAttribute("phoneErr", "phoneErr");
                        checked = false;
                    }
                }

                if (!Address.isEmpty()) {//validate address format
                    if (!validate.validateAddress(Address)) {
                        session.setAttribute("addressErr", "addressErr");
                        checked = false;
                    }
                }

                if (!validate.validateDate(DOB)) {//validate DOB format
                    session.setAttribute("dateErr", "dateErr");
                    checked = false;
                }
                
                if (checked) {//check whether the account create is for customer or staff
                    if (customerCreate.equals("true")) {
                    manager.addCustomer(Email, Password, FName, LName, PhoneNum, Address, DOB);
                    int ID = manager.FindCustomerID(Email, Password);
                    Customer customer = new Customer(ID, Email, Password,
                            FName, LName, PhoneNum, Address, DOB);
                    session.setAttribute("customer", customer);          
                    session.setAttribute("staff",null); 
                    request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                    }else if (staffCreate.equals("true")) {
                        manager.addStaff(Email, Password, FName, LName, PhoneNum, Address, DOB,Role);
                    int ID = manager.FindStaffID(Email, Password);
                    Staff staff = new Staff(ID, Email, Password,
                            FName, LName, PhoneNum, Address, DOB,Role);
                    session.setAttribute("staff", staff);  
                    session.setAttribute("customer",null); 
                    request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                    }
                    
                } else {
                    if (customerCreate.equals("true")) {
                    request.getRequestDispatcher("CustomerRegisterScreen.jsp").include(request, response);
                    }else if (staffCreate.equals("true")) {
                    request.getRequestDispatcher("StaffRegisterScreen.jsp").include(request, response);
                    }
                }

            
            
        } catch (SQLException ex) {
            request.getRequestDispatcher("CustomerRegisterScreen.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
