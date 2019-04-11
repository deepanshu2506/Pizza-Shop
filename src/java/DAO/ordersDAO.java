/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Beans.orders;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pc
 */
public class ordersDAO {
    
    Session session;
    Transaction tx;
    public ordersDAO(){
        session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();        
        tx=session.beginTransaction();
    }
    
    public int addOrder(orders order){ 
        session.saveOrUpdate(order);
        tx.commit();
        
        return order.getOrderId();
    }
    
    public int getIdandAdd(orders order){
        int id;
        Criteria c=session.createCriteria(orders.class);
        c.add(Restrictions.and(Restrictions.eq("CustomerId", order.getCustomerId()),Restrictions.like("active", 1)));
        List<orders> l=c.list();
        if(l.size()==0){
           id = addOrder(order);
        }
        else
            id=l.get(0).getOrderId();
        session.close();
        return id;
    }
    
    public orders getactiveorder(int customerid){
        Criteria c=session.createCriteria(orders.class);
        c.add(Restrictions.and(Restrictions.eq("CustomerId", customerid),Restrictions.like("active", 1)));
        List<orders> l=c.list();
        session.close();
        if(l.size()==0){
            return null;
        }
        else{
            return l.get(0);
        }
        
    }
    
    public static void main(String[] args){
        orders order=new ordersDAO().getactiveorder(7);
        if(order!=null)
        System.out.println(order.toString());
        else
            System.out.println("null");
        
    }
}
