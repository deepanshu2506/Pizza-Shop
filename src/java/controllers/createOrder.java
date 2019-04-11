/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Beans.chef;
import Beans.orderitems;
import Beans.orders;
import Beans.tables;
import DAO.CustomerDAO;
import DAO.chefDAO;
import DAO.orderitemsDAO;
import DAO.ordersDAO;
import DAO.tableDAO;
import com.google.gson.JsonArray;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.util.*;
import org.json.simple.parser.ParseException;

/**
 *
 * @author pc
 */
public class createOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet createOrder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<div>"+request.getParameter("cart")+"</div>");
            JSONParser parser=new JSONParser();
            Object obj=parser.parse(request.getParameter("cart"));
            JSONArray array=(JSONArray)obj;
            HttpSession session=request.getSession(false);  
            
            orders order;
            int tableNo;
            chef currentchef;
            String username=(String)session.getAttribute("username");
//            String username="deepanshu";
            int userId=new CustomerDAO().getCustomerIdByUsername(username);
            out.print(userId);
//            out.println(userId);
            order=new ordersDAO().getactiveorder(userId);
            if(order==null){
//            session.setAttribute("people",9);
            out.print("heyy");
            int people=Integer.parseInt(session.getAttribute("people").toString());
//            out.println(people);
           
            tableNo=new tableDAO().getTableNo(people);
            currentchef=new chefDAO().getChef();
            order=new orders();
//            out.print(currentchef);
            }
            else{ 
                tableNo=order.getTable_No();
                currentchef=new chefDAO().getChefById(order.getChefId());
                
            }
            session.setAttribute("currchef", currentchef.getChefName());
            out.print(userId);
            order.setCustomerId(userId);
            out.print(userId);
            order.setTable_No(tableNo);
            order.setChefId(currentchef.getChefId());
            out.print("hey");
            order.setActive(1);
            order.setOrderId(new ordersDAO().getIdandAdd(order));
            out.print(order.getOrderId());
           out.print("heyyy"); 
            
            for(Object o:array){
                orderitems item=new orderitems();
                JSONObject jo=(JSONObject)o;
                out.println(jo.toString());
                item.setCustomerid(userId);
                item.setItemId(Integer.parseInt(jo.get("itemId").toString()));
                item.setQuantity(Integer.parseInt(jo.get("quantity").toString()));
                item.setOrderId(order.getOrderId());
                new orderitemsDAO().additem(item);
                out.print(item.getOrderId());
            }
            
            session.setAttribute("chef", currentchef);
            
//            out.println(billAmount);
           out.print("heyyy");
            request.getRequestDispatcher("orderConf.jsp").forward(request, response);
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(createOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(createOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
