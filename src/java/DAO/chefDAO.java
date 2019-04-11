/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Beans.chef;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pc
 */
public class chefDAO {
    Session session;
    Transaction tx;
    public chefDAO(){
        session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();        
        tx=session.beginTransaction();
    }
    
    public chef getChef(){
        Criteria c=session.createCriteria(chef.class);
        c.add(Restrictions.eq("active", 1));
        c.setMaxResults(1);
        c.addOrder(Order.asc("busytime"));
        List<chef> l=c.list();
        System.out.println(l.get(0).toString());
        session.close();
        return l.get(0);
    }
    
    
    public chef getChefById(int id){
        Criteria c=session.createCriteria(chef.class);
        c.setMaxResults(1);
        c.add(Restrictions.eq("ChefId", id));
        List<chef> l=c.list();
        return l.get(0);
    }
    
    public int getChefbusytime(int chefid){
        Criteria c=session.createCriteria(chef.class);
        c.setMaxResults(1);
        c.add(Restrictions.eq("ChefId", chefid));
        List<chef> l=c.list();
        System.out.println(l.get(0).getBusytime());
        session.close();
        return l.get(0).getBusytime();
    }
    
    public chef chefLogin(String name , String password){
        Criteria c = session.createCriteria(chef.class);
        c.setMaxResults(1);
        c.add(Restrictions.and(Restrictions.eq("ChefName", name) , Restrictions.eq("password", password)));
        List<chef> l = c.list();
        if(l.size() > 0){
            chef ch = l.get(0);
            Query query = session.createQuery("UPDATE chef set active = 1 where ChefId = :id");
            query.setParameter("id", ch.getChefId());
            System.out.println(ch.toString());
            int result = query.executeUpdate();
            tx.commit();
            session.close();
            return ch;
        }
        else{
            return null;
        }
        
    }
    
    public void chefLogout(int id){
      
            Query query = session.createQuery("UPDATE chef set active = 0 where ChefId = :id");
            query.setParameter("id", id);
            int result = query.executeUpdate();
            System.out.println("logout success");
            tx.commit();
            session.close();
        
        
    }
    public static void main(String[] args){
//        System.out.println(new chefDAO().chefLogout("Rahul Thacker"));
        new chefDAO().chefLogout(2);
        System.exit(0);
    }
}
