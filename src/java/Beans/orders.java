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
public class orders {
    private int OrderId;
    private int CustomerId;
    private int TotalItemQty;
    private float BillAmount;

    public orders() {
    }
    private int Table_No;
    private int chefId;
    private int active;

    public orders(int CustomerId, int TotalItemQty, float BillAmount, int Table_No, int chefId, int active) {
        this.CustomerId = CustomerId;
        this.TotalItemQty = TotalItemQty;
        this.BillAmount = BillAmount;
        this.Table_No = Table_No;
        this.chefId = chefId;
        this.active = active;
    }

    @Override
    public String toString() {
        return "orders{" + "OrderId=" + OrderId + ", CustomerId=" + CustomerId + ", TotalItemQty=" + TotalItemQty + ", BillAmount=" + BillAmount + ", Table_No=" + Table_No + ", chefId=" + chefId + ", active=" + active + '}';
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public int getTotalItemQty() {
        return TotalItemQty;
    }

    public void setTotalItemQty(int TotalItemQty) {
        this.TotalItemQty = TotalItemQty;
    }

    public float getBillAmount() {
        return BillAmount;
    }

    public void setBillAmount(float BillAmount) {
        this.BillAmount = BillAmount;
    }

    public int getTable_No() {
        return Table_No;
    }

    public void setTable_No(int Table_No) {
        this.Table_No = Table_No;
    }

    public int getChefId() {
        return chefId;
    }

    public void setChefId(int chefId) {
        this.chefId = chefId;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    
}
