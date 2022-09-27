/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.Item;
import uts.asd.model.dao.DBManager;

/**
 *
 * @author jackhennessy
 */
@WebServlet(name = "ItemServlet", urlPatterns = {"/ItemServlet"})
public class ItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            // same form is used for adding/updating items
            // when form is submitted check if that item exists, if not create a new item
            // otherwise update that item
        
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            Validator validate = new Validator();
            
            String ID = request.getParameter("ID");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String date = request.getParameter("date");
            String region = request.getParameter("region");
            String description = request.getParameter("description");
            
        
        if (validate.validateName(name) && validate.validateID(ID) && validate.validateDate(date)
            && validate.validateName(region)) {

        try {
            // check if item already exists
            if (manager.ItemExist(name)) {
                // update item
                manager.updateItem(Integer.valueOf(ID), name, Float.valueOf(price), Integer.valueOf(quantity), date, region, description);

            } else {
                // create a new item
                System.out.println("***********" + ID + name + price + quantity +"*************");
                manager.addItem(Integer.valueOf(ID), name, Float.valueOf(price), Integer.valueOf(quantity), date, region, description);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        } else {
            System.out.println("Invalid input");
            session.setAttribute("itemError", "itemError");
        }
            
            request.getRequestDispatcher("ItemManagement.jsp").forward(request,response);
    }
    // add changes
    
}
