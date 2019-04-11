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
public class orderitems {
    private int orderitemId;

    public int getOrderitemId() {
        return orderitemId;
    }

    public void setOrderitemId(int orderitemId) {
        this.orderitemId = orderitemId;
    }
    private int OrderId;
    private int itemId ;
    private int quantity;
    private int customerid;

    public orderitems() {
    }
    
    

    public orderitems(int OrderId, int itemId, int quantity, int customerid) {
        this.OrderId = OrderId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.customerid = customerid;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }
    
}
