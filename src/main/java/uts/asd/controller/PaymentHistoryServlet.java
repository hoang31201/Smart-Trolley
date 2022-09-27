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
import uts.asd.model.*;
import uts.asd.model.dao.PaymentManager;
import java.util.*;


/**
 *
 * @author casio
 * This servlet use to output all payment history of a customer to Payment History page
 */
public class PaymentHistoryServlet extends HttpServlet {
    
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session    
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        int UserId = ((Customer)session.getAttribute("customer")).getCustomerID();
        try {
            if (session.getAttribute("history") != null) {
                ArrayList<PaymentHistory> history = (ArrayList<PaymentHistory>)session.getAttribute("history");
                Collections.reverse(history);
                session.setAttribute("history", history);
                request.getRequestDispatcher("PaymentHistory.jsp").include(request,response);
            }
            else {//add payment to payment history database
                ArrayList<PaymentHistory> history = paymentManager.fetchHistory(UserId);
                session.setAttribute("history", history);
                request.getRequestDispatcher("PaymentHistory.jsp").include(request,response);
            }
        }
        catch (SQLException ex) {
            request.getRequestDispatcher("navBar.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }  
}
