/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;


import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.*;
import uts.asd.model.dao.PaymentManager;

/**
 *
 * @author casio
 * This servlet use to delete the payment detail
 */
public class DeletePaymentServlet extends HttpServlet {
    
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // session 
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        PaymentManager paymentManager = ( PaymentManager) session.getAttribute("paymentManager");
        int UserId = customer.getCustomerID();
        System.out.println("UserId");
        
        
        try{//delete payment detail from database
            System.out.print(UserId);
            paymentManager.deletePaymentDetail(UserId);
            //request.getRequestDispatcher("create_payment.jsp").include(request,response);
            response.sendRedirect("AccountScreen.jsp");
        } catch (SQLException ex) {
           System.out.println("error");
        }
    }  
}