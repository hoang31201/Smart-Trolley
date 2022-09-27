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

/**
 *
 * @author quyda
 */
// this servlet take information of the account, find it in databse and delete it
public class AccountDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("staff");
        Customer customer= (Customer) session.getAttribute("customer");
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            if(staff!=null){//check whether the account want to be deleted is customer or staff account
            manager.deleteStaff(staff.getStaffID());
            session.setAttribute("staff", staff);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else if(customer!=null){
            manager.deleteCustomer(customer.getCustomerID());
            session.setAttribute("customer", customer);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            request.getRequestDispatcher("navBar.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
