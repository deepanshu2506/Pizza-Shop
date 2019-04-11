/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author pc
 */
public class kitchenData {
    private int tableno;
    private int quantity;
    private int cookingtime;
    private String item;
    private int itemid;
    private int orderItemId;

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }
    

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getTableno() {
        return tableno;
    }

    public void setTableno(int tableno) {
        this.tableno = tableno;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCookingtime() {
        return cookingtime;
    }

    public void setCookingtime(int cookingtime) {
        this.cookingtime = cookingtime;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "kitchenData{" + "tableno=" + tableno + ", quantity=" + quantity + ", cookingtime=" + cookingtime + ", item=" + item + ", itemid=" + itemid + ", orderItemId=" + orderItemId + '}';
    }

   
    
    
}
