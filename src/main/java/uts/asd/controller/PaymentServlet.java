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
 * This servlet use to add payment and payment history to database
 */
public class PaymentServlet extends HttpServlet {

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
        String datePaid = request.getParameter("datePaid");
        String totalPrice = request.getParameter("totalPrice");

        PaymentManager paymentManager = (PaymentManager) session.getAttribute("paymentManager");
        Customer customer = (Customer) session.getAttribute("customer");
        validator.clear(session);

        try {
            int customerid;
            if(customer == null){
                double str1 = Double.parseDouble(totalPrice);
            paymentManager.addOrder(str1, datePaid);
            int orderId = paymentManager.getOrderId();
            paymentManager.addPayment(orderId, paymentMethod, str1, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            //add payment to payment and payment history database
            Payment payment = new Payment(paymentMethod, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            int payment_Id = paymentManager.getPaymentId(cardNumber);
            session.setAttribute("payment", payment);
            request.getRequestDispatcher("ConfirmPayment.jsp").forward(request, response);
            }
            else{
                customerid = customer.getCustomerID();

            double str1 = Double.parseDouble(totalPrice);
            paymentManager.addOrder(str1, datePaid);
            int orderId = paymentManager.getOrderId();
            paymentManager.addPayment(orderId, paymentMethod, str1, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            //add payment to payment and payment history database
            Payment payment = new Payment(paymentMethod, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            int payment_Id = paymentManager.getPaymentId(cardNumber);
            paymentManager.addHistory(customerid, payment_Id, orderId, paymentMethod, str1, cardNumber, nameOnCard, datePaid);
            session.setAttribute("payment", payment);

            request.getRequestDispatcher("ConfirmPayment.jsp").forward(request, response);
            }
        } catch (SQLException | NullPointerException ex) {
            request.getRequestDispatcher("Payment.jsp").include(request, response);
            Logger.getLogger(AccountCreateServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}