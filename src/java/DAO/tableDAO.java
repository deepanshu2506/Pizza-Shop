/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
 
import Beans.tables;
import java.util.List;
import org.hibernate.*;  
import org.hibernate.cfg.Configuration;
/**
 *
 * @author pc
 */
public class tableDAO {
    Session session;
    Transaction tx;
    public tableDAO(){
        session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        
                
    }
    private List<tables> getavailableTables(){
        tx=session.beginTransaction();
        Query query=session.createQuery("from tables where available=1 order by seatingCapacity DESC");
        List<tables> l=query.list();
//        for(tables t:l)
//            System.out.println(t.getTableNo());
        return l;
    }
    private void setAvailable(int tableNo,int state){
        Query query=session.createQuery("update tables set available= :state where tableNo= :tableNo");
        query.setParameter("state", state);
        query.setParameter("tableNo",tableNo);
        System.out.println(query.executeUpdate());
        try{
            tx.commit();
        }
        catch(Exception e){}
    }
    public int getTableNo(int people){
         List<tables> availableTables=getavailableTables();
         int table_nos[]=new int[5];
         int ct=0;
         for(tables t:availableTables){
//                System.out.print(t.getSeatingCapacity());
                if(people>=t.getSeatingCapacity()){
                    
                    table_nos[ct]=t.getTableNo();
                    people-=t.getSeatingCapacity();
                    System.out.println(table_nos[ct]);
                    ct++;
                }
                if(people<=1){
                    break;
                }
            }
         setAvailable(table_nos[0],0);
        
        
         return table_nos[0];
    } 
    
    public static void main(String[] args){
        new tableDAO().getTableNo(3);
    }
}
