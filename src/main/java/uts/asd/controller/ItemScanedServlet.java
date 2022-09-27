/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.controller;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.model.dao.*; 
import uts.asd.model.*;
import java.util.ArrayList;

/**
 *
 * @author 61451
 */
public class ItemScanedServlet extends HttpServlet {
    @Override
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
           HttpSession session = request.getSession();
           DBManager manager = (DBManager)session.getAttribute("manager");
           
           try{
               ArrayList<Item> scItems = manager.GetItems();
               session.setAttribute("items", scItems);
               request.getRequestDispatcher("itemScaned.jsp").include(request, response);
           } catch (SQLException | NullPointerException ex) {
               
           
       }
    }
}
