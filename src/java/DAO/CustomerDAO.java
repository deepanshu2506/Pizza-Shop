/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Beans.Customers;
import java.util.*;  
 
import org.hibernate.*;  
import org.hibernate.cfg.Configuration;



/**
 *
 * @author pc
 */
public class CustomerDAO {
    private Session CustomerSession;
    private Transaction tx;
    private Customers customer;
    private int customerID;
    private final static String updateQuery="update Customers set UserName= :user , phoneNo= :phone , Address= :add , email= :mail, Gender= :gen where UserID= :custid" ;
    public CustomerDAO(Customers cust){
        CustomerSession=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        tx=CustomerSession.beginTransaction();
        this.customer=cust;
    }
     public CustomerDAO(){
        CustomerSession=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        tx=CustomerSession.beginTransaction();
        this.customer=null;
    }
    public int add(){
        System.out.println(checkExistance());
        if(checkExistance()){
            CustomerSession.save(customer);
            customerID=customer.getUserID();
            System.out.println("done");
        }
        else{
            
        }
        tx.commit();
        CustomerSession.close();
        return customerID;
    }
    
    private boolean checkExistance()
    {
        Query query=CustomerSession.createQuery("from Customers where UserName = :name and phoneNo = :phone");  
        query.setParameter("name",customer.getUserName());
        query.setParameter("phone",customer.getPhoneNo());
        List<Customers> dbCustomers=query.list();
        if (dbCustomers.size()==0){
            return true;
        }
        else{
            customerID=dbCustomers.get(0).getUserID();
            return false;
        }
    }           
  
    public Customers getCustomerById(int customerId){
        Query query=CustomerSession.createQuery("from Customers where UserID= :custid");
        query.setParameter("custid",customerId);
        customer=(Customers)query.list().get(0);
        CustomerSession.close();
        return customer;
        
    }
    public int getCustomerIdByUsername(String username){
        Query query=CustomerSession.createQuery("from Customers where UserName= :user");
        query.setParameter("user",username);
        customer=(Customers)query.list().get(0);
        return customer.getUserID();
    }
    
    public void updateCustomer(){
        Query query=CustomerSession.createQuery(updateQuery);
        query.setParameter("user",customer.getUserName());
        query.setParameter("phone",customer.getPhoneNo());
        query.setParameter("add",customer.getAddress());
        query.setParameter("mail",customer.getemail());
        query.setParameter("gen",customer.getGender());
        query.setParameter("custid",customer.getUserID());
        int status=query.executeUpdate();
        tx.commit();
        CustomerSession.close();
    }
    
}
