/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "ListItemsServlet", urlPatterns = {"/ItemManagement"})
public class ListItemsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            // same form is used for adding/updating items
            // when form is submitted check if that item exists, if not create a new item
            // otherwise update that item
        
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            
            
        try {
            // check if item already exists
            ArrayList<Item> items = new ArrayList<>();
            items = manager.GetItems();
            session.setAttribute("items", items);
        } catch (SQLException ex) {
            Logger.getLogger(ItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            request.getRequestDispatcher("ItemManagement.jsp").forward(request,response);
    }
    // add changes
    
}
