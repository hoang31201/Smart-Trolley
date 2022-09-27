/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.model;
import java.io.Serializable;
/**
 *
 * @author quyda
 */
public class Customer implements Serializable {
    private int customerID;
    private int customerPoint;
    private String customerEmail, customerPassword,customerFName,customerLName,customerPhoneNum, customerAddress,customerDOB;
    private boolean isStaff, isAdmin;

    public Customer(int customerID, String customerEmail, String customerPassword, String customerFName, String customerLName, String customerPhoneNum, String customerAddress, String customerDOB, boolean isStaff, boolean isAdmin) {
        this.customerID = customerID;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerFName = customerFName;
        this.customerLName = customerLName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
        this.isStaff = isStaff;
        this.isAdmin = isAdmin;
    }
 
    
    public Customer(int customerID, String customerEmail,String customerPassword,String customerFName, String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) {
        this.customerID = customerID;
        this.customerEmail = customerEmail;
        this.customerPassword=customerPassword;
        this.customerFName = customerFName;
        this.customerLName=customerLName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
        this.customerPoint = customerPoint;
    }

    public Customer(int customerID, String customerEmail, String customerFName, String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) {
        this.customerID = customerID;
        this.customerEmail = customerEmail;
        this.customerFName = customerFName;
        this.customerLName = customerLName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;    
    }
    
   public Customer(String customerEmail, String customerPassword, String customerFName,String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) {
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerFName = customerFName;
        this.customerLName=customerLName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
   }

    public Customer(int customerID, int customerPoint, String customerEmail, String customerPassword, String customerFName, String customerLName, String customerPhoneNum, String customerAddress, String customerDOB) {
        this.customerID = customerID;
        this.customerPoint = customerPoint;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerFName = customerFName;
        this.customerLName = customerLName;
        this.customerPhoneNum = customerPhoneNum;
        this.customerAddress = customerAddress;
        this.customerDOB = customerDOB;
    }

    public int getCustomerPoint() {
        return customerPoint;
    }

    public void setCustomerPoint(int customerPoint) {
        this.customerPoint = customerPoint;
    }
   
   
    public int getCustomerID() {
        return customerID;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public String getCustomerFName() {
        return customerFName;
    }
     
    public String getCustomerLName() {
        return customerLName;
    }

    public String getCustomerPhoneNum() {
        return customerPhoneNum;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public String getCustomerDOB() {
        return customerDOB;
    }

  

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public void setCustomerFName(String customerFName) {
        this.customerFName = customerFName;
    }
    
     public void setCustomerLName(String customerLName) {
        this.customerLName = customerLName;
    }
    public void setCustomerPhoneNum(String customerPhoneNum) {
        this.customerPhoneNum = customerPhoneNum;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public void setCustomerDOB(String customerDOB) {
        this.customerDOB = customerDOB;
    }
    
    public boolean isStaff() {
        return isStaff;
    }

    public void setIsStaff(boolean isStaff) {
        this.isStaff = isStaff;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
