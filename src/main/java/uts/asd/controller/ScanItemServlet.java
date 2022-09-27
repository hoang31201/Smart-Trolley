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
import uts.asd.model.dao.*; 
import uts.asd.model.Item;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author 61451
 */
public class ScanItemServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         HttpSession session = request.getSession();
         
         int id = Integer.parseInt(request.getParameter("id"));
         DBManager manager = (DBManager) session.getAttribute("manager");
         ArrayList<Item> scanItems = new ArrayList<Item>();
         try{
             if(id > 0){
                 scanItems = manager.FindItemViaID(id);
             } else {
                  session.setAttribute("existErr", "Please input the item Code(ID)");
                  request.getRequestDispatcher("scanItem.jsp").include(request, response);
             }
                 session.setAttribute("scanItems", scanItems);
                 request.getRequestDispatcher("itemScaned.jsp").include(request, response);
         } catch (SQLException | NullPointerException ex) {
                 Logger.getLogger(ScanItemServlet.class.getName()).log(Level.SEVERE, null, ex);
           }
      }
}
