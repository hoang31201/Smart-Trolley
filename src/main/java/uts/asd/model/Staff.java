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
public class Staff implements Serializable{
    private int staffID;
    private String staffEmail,staffPassword,staffFName, staffLName, staffPhoneNum,staffAddress,staffDOB, staffRole;

    public Staff(int staffID, String staffEmail, String staffPassword, String staffFirstName, String stafLastName, String staffPhoneNum,String staffAddress, String staffDOB, String staffRole) {
        this.staffID = staffID;
        this.staffEmail = staffEmail;
        this.staffPassword = staffPassword;
        this.staffFName = staffFirstName;
        this.staffLName = stafLastName;
        this.staffPhoneNum = staffPhoneNum;
        this.staffAddress=staffAddress;
        this.staffDOB = staffDOB;
        this.staffRole = staffRole;
    }

    public Staff(int staffID, String staffEmail, String staffPassword, String staffFName, String staffLName, String staffPhoneNum, String staffAddress, String staffDOB) {
        this.staffID = staffID;
        this.staffEmail = staffEmail;
        this.staffPassword = staffPassword;
        this.staffFName = staffFName;
        this.staffLName = staffLName;
        this.staffPhoneNum = staffPhoneNum;
        this.staffAddress = staffAddress;
        this.staffDOB = staffDOB;
    }
    
    

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }
    
    
    public int getStaffID() {
        return staffID;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public String getStaffFName() {
        return staffFName;
    }

    public String getStaffLName() {
        return staffLName;
    }

    public String getStaffPhoneNum() {
        return staffPhoneNum;
    }

    public String getStaffDOB() {
        return staffDOB;
    }

    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public void setStaffFName(String staffFirstName) {
        this.staffFName = staffFirstName;
    }

    public void setStafLName(String stafLastName) {
        this.staffLName = stafLastName;
    }

    public void setStaffPhoneNum(String staffPhoneNum) {
        this.staffPhoneNum = staffPhoneNum;
    }

    public void setStaffDOB(String staffDOB) {
        this.staffDOB = staffDOB;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }
    
}
