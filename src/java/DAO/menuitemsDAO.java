/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Beans.menuitems;
import java.util.*;  
 
import org.hibernate.*;  
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projections;
import org.json.simple.JSONArray;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
/**
 *
 * @author pc
 */
public class menuitemsDAO {
     private Session menuSession;
     private Transaction tx;

    public menuitemsDAO() {
        menuSession=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        tx=menuSession.beginTransaction();
    }
    
    
    public JSONArray getCategories(){
        JSONArray j=new JSONArray();
        Criteria c=menuSession.createCriteria(menuitems.class);
        c.setProjection(Projections.property("Type"));
        List<String> l=c.list();
        for(String s:l){
            if(!j.contains(s)){
                j.add(s);
            }
        }
        menuSession.close();
        return j;
    }
    public JsonArray getItemsByType(){
        Query query=menuSession.createQuery("from menuitems");
//        query.setParameter("type",type);
        List<menuitems> items=query.list();
        Gson gson=new Gson();
        Type typeofsrc=new TypeToken<List<menuitems>>(){}.getType();
        JsonElement element=gson.toJsonTree(items,typeofsrc);
        JsonArray j=element.getAsJsonArray();
        menuSession.close();
        return j;
    }
    
    public static void main(String[] args){
        new menuitemsDAO().getItemsByType();
    }
     
}
