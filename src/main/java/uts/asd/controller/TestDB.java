package uts.asd.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;
import uts.asd.model.Customer;
import uts.asd.model.Staff;
import uts.asd.model.dao.*;

/**
 *
 * @author quyda
 */
public class TestDB {

    public static Scanner in = new Scanner(System.in);

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        new TestDB().menu();
    }

    private DBConnector connector;
    private Connection conn;
    private DBManager manager;

    public TestDB() throws ClassNotFoundException, SQLException {
        connector = new DBConnector();
        conn = connector.openConnection();
        manager = new DBManager(conn);
    }

    private void testCreate() throws SQLException {
        System.out.println("Adding customer to the database: ");
        manager.addCustomer(read("Email"),read("Password"),read("First Name"),read("Last Name"),read("Phone Num"),read("Address"),read("DOB"));
        System.out.println("Customer added successfully ");
    }

    private void testFind() throws SQLException {
        int customerID = Integer.parseInt(read("Customer ID"));
        String customerPassword = read("Customer Password");
        Customer customer = manager.FindCustomer(customerID, customerPassword);
        String exist = (customer != null) ? "Customer exists in the database" : "Customer does not exist!!!";
        System.out.println(exist);
    }
/*
    private void testUpdate() throws SQLException {
        int customerID = Integer.parseInt(read("Customer ID"));
        manager.updateCustomer(customerID,read("Customer Email"),read("Customer Password"),read("Customer Firstname"),read("Customer Lastname"),
                read("Customer PhoneNum"),read("Customer Address"),read("Customer DOB"));
        System.out.println("User details updated successfully ");
    }
*/
    private void testDelete() throws SQLException {
        int customerID = Integer.parseInt(read("Customer ID"));
        manager.deleteCustomer(customerID);
        System.out.println("User deleted successfully");
    }

    private void testDeleteItem() throws SQLException {
        manager.deleteItem("test");
    }
    
    private void testAddItem() throws SQLException {
//        manager.updateItem(9, "test2", 12, 100, "2021-1-21", "Aus", "update success!");
        System.out.println(manager.GetPayments());
    }
    
    private String read(String prompt) {
        System.out.print(prompt+": ");
        
        
        return in.next();
    }

    private String read(int prompt) {
        System.out.print(prompt + ": ");
        
        return in.next();
    }

    private void menu() throws SQLException {
        char c;
        help();       
        
        while ((c = read("Command [c/r/u/d/f/x]").charAt(0)) != 'x') {
            switch (c) {
                case 'c':                                  
                    testDeleteItem();                  
                    break;
                case 'r':
                    testFind();
                    break;
                case 'u':
                    //testUpdate();
                    break;
                case 'd':
                    testDelete();
                    break;
                case 'j':
                    testAddItem();
                    break;
                default:
                    help();
                    break;
            }
        }
    }

    private void help() {
        System.out.println("Database Operations: \n"
                + "c = Create User \n"
                + "r = Find User \n"
                + "u = Update User \n"
                + "d = Delete User \n");  
        
    }
}
