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

/**
 *
 * @author casio
 * this servlet use receive data from payment to add new payment to database
 */
public class CreatePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String nameOnCard = request.getParameter("nameOnCard");
        String expiryDate = request.getParameter("expiryDate");
        boolean checked = true;
        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Customer customer = (Customer) session.getAttribute("customer");
        
        validator.clear(session);

        try {//check if the cardnumber is in the correct format
            if (!validator.validateCardNo(cardNumber)) {//validate card number format
                    session.setAttribute("cardNoErr", "cardNoErr");
                    checked = false;
                }//check if the cvv is in the correct format
            if (!validator.validateCVV(cvv)) {//validate cvv format
                    session.setAttribute("cvvErr", "cvvErr");
                    checked = false;
                }
            if(checked){
                //add payment to payment detail database
            int UserId = customer.getCustomerID();
            paymentManager.addPaymentDetail(UserId, paymentMethod, cardNumber, expiryDate, cvv, nameOnCard);
            request.getRequestDispatcher("AccountScreen.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("CreatePayment.jsp").include(request, response);
            }
        } catch (SQLException | NullPointerException ex) {
            request.getRequestDispatcher("Payment.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}