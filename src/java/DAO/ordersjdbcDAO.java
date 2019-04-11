package DAO;
import Beans.items;
import Beans.kitchenData;
import Beans.orderSelector;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pc
 */
public class ordersjdbcDAO {
    Connection conn;
    
    public ordersjdbcDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pizzaShop","root","");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public List<orderSelector> getOrder(int id,int active){
        List<orderSelector> orderlist=new ArrayList<orderSelector>();
        try {
            
            Statement st=conn.createStatement();
            String query="select * from orders where CustomerId="+id+" and active="+active;
            ResultSet rs= st.executeQuery(query);
            while(rs.next()){
                orderSelector order=new orderSelector();
                order.setOrderId(rs.getInt("OrderId"));
                order.setTable_No(rs.getInt("Table_no"));
                order.setBillAmount(rs.getInt("BillAmount"));
                order.setTimeStamp(rs.getTimestamp("timeStamp"));
                order.setItems(getItems(order.getOrderId()));
                orderlist.add(order);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(ordersjdbcDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn.close();
                    } catch (SQLException ex) {
            Logger.getLogger(ordersjdbcDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderlist;
    }
    
    public List<items> getItems(int orderId) throws SQLException{
        String query="select orderitems.quantity,menuitems.ItemName,menuitems.price from orderitems join menuitems where orderitems.OrderId="+orderId+" and orderitems.itemId=menuitems.itemId";
        List<items> itemlist=new ArrayList<items>();
        try{
           
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                items item=new items();
                item.setQuantity(rs.getInt(1));
                item.setItemname(rs.getString(2));
                item.setPrice(rs.getInt(3));
                System.out.println(rs.getInt(1)+" "+rs.getString(2)+" " + rs.getInt(3));
                itemlist.add(item);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return itemlist;
    }
    public void changetoinactive(int orderid){
        String query="update orders set active=0 where OrderId="+orderid;
        try{
            Statement st=conn.createStatement();
            st.executeUpdate(query);
            maketableavailable(orderid);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
    }
    
    
    public void maketableavailable(int orderid) throws SQLException{
        String query="update tables set available=1 where tableNo=(select Table_No from orders where OrderId="+orderid+")" ;
        try{
            Statement st=conn.createStatement();
            st.executeUpdate(query);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        conn.close();
        
    }

    public StringBuffer getitemsbychefid(int chefid){
        String query="SELECT orders.Table_No,orderitems.quantity,menuitems.ItemName,menuitems.cooking_time,menuitems.itemId ,orderitems.orderitemId from (orders join orderitems on orders.OrderId=orderitems.OrderId)join menuitems on menuitems.itemId=orderitems.itemId where orders.chefId="+chefid +" and orderitems.delivered=0";
        StringBuffer json=new StringBuffer("{");
        Map <Integer,List<kitchenData>> data=new HashMap<Integer,List<kitchenData>>();
        try{
             Statement st=conn.createStatement();
             ResultSet rs=st.executeQuery(query);
             rs.next();
             kitchenData first=new kitchenData();
             first.setTableno(rs.getInt("Table_No"));
             first.setQuantity(rs.getInt("quantity"));
             first.setItem(rs.getString("ItemName"));
             first.setCookingtime(rs.getInt("cooking_time"));
             first.setItemid(rs.getInt("itemId"));
             first.setOrderItemId(rs.getInt("orderitemId"));
             List<kitchenData> l=new ArrayList<kitchenData>();
             l.add(first);
             data.put(first.getTableno(),l);
             
             while(rs.next()){
                   kitchenData next=new kitchenData();
                   next.setTableno(rs.getInt("Table_No"));
                   next.setQuantity(rs.getInt("quantity"));
                   next.setItem(rs.getString("ItemName"));
                   next.setCookingtime(rs.getInt("cooking_time"));
                   next.setItemid(rs.getInt("itemId"));
                   next.setOrderItemId(rs.getInt("orderitemId"));
                   int flag=0; 
                   for(Integer i:data.keySet()){
                       if(i.equals(next.getTableno())){
                           flag=1;
                           break;
                       }
                   }
                   if(flag==1){
                       data.get(next.getTableno()).add(next);
                   }
                   else{
                       List<kitchenData> ln=new ArrayList<kitchenData>();
                       ln.add(next);
                       data.put(next.getTableno(), ln);
                   }
                   
             }
             Gson gson=new Gson();
             Map<Integer,String> jsondata=new HashMap<Integer,String>();
             
             String prefix="";
            for (Map.Entry<Integer,List<kitchenData>> d : data.entrySet()) {
                Integer k=d.getKey();
                List<kitchenData> kd=d.getValue();
                Type typeofsrc=new TypeToken<List<kitchenData>>(){}.getType();
                JsonElement element=gson.toJsonTree(kd,typeofsrc);
                JsonArray j=element.getAsJsonArray();

                jsondata.put(k,j.toString());
                json.append(prefix);
                prefix=",";
                json.append("\""+k+"\":"+j.toString());
                
            }
            json.append("}");
       
             

             rs.close();
             st.close();
             conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return json;
    }   
    
    public static void main(String[] args){
        System.out.println(new ordersjdbcDAO().getOrder(7, 0));
    }
    
}
                 