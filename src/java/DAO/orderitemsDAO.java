/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Beans.orderitems;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import java.util.*;
import org.hibernate.Query;
/**
 *
 * @author pc
 */
public class orderitemsDAO {
    Session session;
    Transaction tx;
    public orderitemsDAO(){
        session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();        
        tx=session.beginTransaction();
    }
    
    public void additem(orderitems item){
        session.save(item);
        tx.commit();
        session.close();
    }
    
    public void deliverOrder(List<orderitems> items){
        for(orderitems item : items){
            Query query = session.createQuery("UPDATE orderitems set delivered = 1 where orderitemId = :id");
            query.setParameter("id", item.getOrderitemId());
            int result = query.executeUpdate();
            System.out.println(result);
        }
        
        tx.commit();
        session.close();
    }
   
    public static void main(String[] args){
        orderitems item=new orderitems();
        item.setCustomerid(7);
        item.setItemId(1);
        item.setQuantity(3);
        item.setOrderId(6);
        new orderitemsDAO().additem(item);
        
    }
}
