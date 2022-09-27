/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Customer;
import uts.asd.model.Staff;
import uts.asd.model.dao.DBManager;
import uts.asd.controller.Validator;

/**
 *
 * @author quyda
 */
// this servlet take input information from login screen, validate it, compare to inforamtion in database
public class AccountLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validate = new Validator();
        validate.clear(session);
        try {
            if ((validate.validateEmail(email)) && (validate.validatePassword(password)) && !validate.checkEmpty(email, password)) {//email and password can not be null and must be in correct format
                Staff staff = manager.FindStaff2(email, password);
                Customer customer = manager.FindCustomer2(email, password);
                if (staff != null) {//determine the login information is for staff or customer
                    session.setAttribute("staff", staff);
                    session.setAttribute("customer", null);
                    request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                } else if (customer != null) {
                    session.setAttribute("customer", customer);
                    session.setAttribute("staff", null);
                    request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
                } else {
                    session.setAttribute("authentication", "unknow");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } else {
                session.setAttribute("authentication", "invalid");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }

        } catch (SQLException ex) {
            request.getRequestDispatcher("navBar.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
