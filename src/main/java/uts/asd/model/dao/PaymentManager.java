/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import uts.asd.model.Payment;
import uts.asd.model.PaymentHistory;

/**
 *
 * @author casio
 * Contain all payment database method
 */
public class PaymentManager {

    private Statement st;

    public PaymentManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public int getPaymentId(String cardNumber) throws SQLException {
        int PAY_ID;
        String fetch = "select PAY_ID FROM ASD.PAYMENT WHERE CREDIT_CARD_NO =  '" + cardNumber + "'";
        ResultSet rs = st.executeQuery(fetch);
        if (rs.next()) {
            PAY_ID = rs.getInt(1);
            return PAY_ID;
        } else {
            return 0;
        }
    }

    //Find the paymentId in database -- used in Payment_DeleteServlet and Payment_EditServlet
    public Payment foundedPaymentId(int PAY_ID) throws SQLException {
        String fetch = "select * from ASD.PAYMENT WHERE PAY_ID = " + PAY_ID + " ";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            int payment_Id = rs.getInt(1);
            if (payment_Id == PAY_ID) {
                String paymentMethod = rs.getString(3);
                String cardNumber = rs.getString(4);
                String cvv = rs.getString(5);
                String nameOnCard = rs.getString(6);
                String expiryDate = rs.getString(7);
                String datePaid = rs.getString(8);
                return new Payment(paymentMethod, cardNumber, expiryDate, cvv, nameOnCard, datePaid);
            }
        }
        return null;
    }

    //Search paymnet by ID and datepaid in the database - Read one row in the database table - used in Payment_SearchServlet
    public PaymentHistory searchPaymentHistory(int PAY_ID, String datePaid) throws SQLException {
        String fetch = "SELECT * FROM ASD.PAYMENT_HISTORY WHERE PAY_ID= " + PAY_ID + " AND DATE_PAID='" + datePaid + "' ";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            int userId = rs.getInt(1);
            int paymentId = rs.getInt(2);
            String date_Paid = rs.getString(8);
            if (paymentId == PAY_ID && date_Paid.equals(datePaid)) {
                int orderId = Integer.parseInt(rs.getString(3));
                String paymentMethod = rs.getString(4);
                double totalPrice = Double.parseDouble(rs.getString(5));
                String cardNumber = rs.getString(6);
                String nameOnCard = rs.getString(7);
                return new PaymentHistory(userId, paymentId, orderId, paymentMethod, totalPrice, cardNumber, nameOnCard, date_Paid);
            }
        }
        return null;
    }
    
    public Payment searchPaymentDetail(int UserID) throws SQLException {       
       String fetch = "select * from ASD.PAYMENT_DETAIL WHERE CUSTOMER_ID= " + UserID ;
       ResultSet rs = st.executeQuery(fetch);
       
       while(rs.next()){
           int user_Id = rs.getInt(1);
           if(user_Id == UserID){
                String paymentMethod  = rs.getString(2);
                String cardNumber = rs.getString(3);
                String cvv = rs.getString(5);
                String expiryDate = rs.getString(4);
                String nameOnCard = rs.getString(6);
                return new Payment(paymentMethod, cardNumber, expiryDate,  cvv, nameOnCard);
                }
           }
       return null;   
    }

    //Add a payment-data into the database - used in PaymentServlet
    public void addPayment(int OrderId, String paymentMethod, double OrderPrice, String cardNumber, String expiryDate, String cvv, String nameOnCard, String datePaid) throws SQLException {
        String columns = "INSERT INTO ASD.PAYMENT(ORDER_ID, PAYMENT_METHOD, TOTAL_PRICE, CREDIT_CARD_NO, EXPIRY_DATE, SECURITY_NO, OWNER_NAME, DATE_PAID)";
        String values = "VALUES (" + OrderId + ",'" + paymentMethod + "'," + OrderPrice + ",'" + cardNumber + "','" + expiryDate + "','" + cvv + "','" + nameOnCard + "','" + datePaid + "')";
        st.executeUpdate(columns + values);
    }
    //Add a payment detail-data into the database - used in CreatePaymentServlet
    public void addPaymentDetail(int UserId, String paymentMethod, String cardNumber, String expiryDate, String cvv, String nameOnCard) throws SQLException {
        String columns = "INSERT INTO ASD.PAYMENT_DETAIL(CUSTOMER_ID, PAYMENT_METHOD, CREDIT_CARD_NO, EXPIRY_DATE, SECURITY_NO, OWNER_NAME)";
        String values = "VALUES (" + UserId + ",'" + paymentMethod + "','" + cardNumber + "','" + expiryDate + "','" + cvv + "','" + nameOnCard + "')";
        st.executeUpdate(columns + values);
    }

    //Update a payment details in the database - used in PaymentUpdateServlet
    public void updatePaymentDetail(int USER_ID,  String paymentMethod, String cardNumber, String expiryDate, String cvv, String nameOnCard) throws SQLException {
        String update = "UPDATE ASD.PAYMENT_DETAIL SET PAYMENT_METHOD='" + paymentMethod + "', CREDIT_CARD_NO='"
                + cardNumber + "', EXPIRY_DATE='" + expiryDate + "', SECURITY_NO ='" + cvv + "',  OWNER_NAME='" + nameOnCard + "' WHERE CUSTOMER_ID = " + USER_ID + "";
        st.executeUpdate(update);
    }

    //delete a payment from database - used in DeletePaymentServlet
    public void deletePaymentDetail(int UserId) throws SQLException {
        String delete1 = "DELETE FROM ASD.PAYMENT_DETAIL WHERE CUSTOMER_ID=" + UserId ;
        st.executeUpdate(delete1);
    }

    //shows the list of payment based on userId -- Used in Payment_ShowHistoryServlet
    public ArrayList<PaymentHistory> fetchHistory(int userId) throws SQLException {
        String fetch = "SELECT * FROM ASD.PAYMENT_HISTORY WHERE CUSTOMER_ID = " + userId + "";
        ArrayList<PaymentHistory> temp = new ArrayList();
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            int paymentId = Integer.parseInt(rs.getString(2));
            int orderId = Integer.parseInt(rs.getString(3));
            String paymentMethod = rs.getString(4);
            double totalPrice = Double.parseDouble(rs.getString(5));
            String cardNumber = rs.getString(6);
            String nameOnCard = rs.getString(7);
            String datePaid = rs.getString(8);
            temp.add(new PaymentHistory(userId, paymentId, orderId, paymentMethod, totalPrice, cardNumber, nameOnCard, datePaid));
        }
        return temp;
    }
    //add payment history to database -- Used in PaymentHistoryServlet
    public void addHistory(int userId, int paymentId, int orderId, String paymentMethod, double orderPrice,  String cardNumber, String nameOnCard, String datePaid) throws SQLException {
        String columns = "INSERT INTO ASD.PAYMENT_HISTORY(CUSTOMER_ID, PAY_ID, ORDER_ID, PAYMENT_METHOD, TOTAL_PRICE, CREDIT_CARD_NO, OWNER_NAME, DATE_PAID)";
        String values = "VALUES (" + userId + ","  + paymentId + "," + orderId + ",'" + paymentMethod + "'," + orderPrice + ",'" + cardNumber + "','" + nameOnCard + "','" + datePaid + "')";
        st.executeUpdate(columns + values);
    }
    //get the total price of the order--still develop
    public double getPrice() throws SQLException {
        double orderPrice;
        String fetch = "select MAX(ORDER_LINE_PRICE) FROM ASD.ORDER_LINE";
        ResultSet rs = st.executeQuery(fetch);
        if (rs.next()) {
            orderPrice = rs.getDouble(4);
            return orderPrice;
        } else {
            return 0;
        }
    }
    
    //add order to assigned USER
    public void addOrder(double totalPrice, String datePaid) throws SQLException {
        String columns = "INSERT INTO ASD.ORDERS(TOTAL_PRICE,ORDER_DATE)";
        String values =  "VALUES (" + totalPrice + ",'" + datePaid + "')";
        st.executeUpdate(columns + values);        
    }

    //get the order id from database -- still develop
    public int getOrderId() throws SQLException {
        int orderId;
        String fetch = "select MAX(ORDER_ID) FROM ASD.ORDERS";
        ResultSet rs = st.executeQuery(fetch);
        if (rs.next()) {
            orderId = Integer.parseInt(rs.getString(1));
            return orderId;
        } else {
            return 0;
        }
    }
    
}
