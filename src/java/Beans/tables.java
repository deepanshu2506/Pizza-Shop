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
public class tables {
    private int  tableNo;
    private int seatingCapacity;
    private int available;

    public tables() {
    }
    

    public tables(int tableNo, int seatingCapacity, int available) {
        this.tableNo = tableNo;
        this.seatingCapacity = seatingCapacity;
        this.available = available;
    }
    
    public int getTableNo() {
        return tableNo;
    }

    public void setTableNo(int tableNo) {
        this.tableNo = tableNo;
    }

    public int getSeatingCapacity() {
        return seatingCapacity;
    }

    public void setSeatingCapacity(int seatingCapacity) {
        this.seatingCapacity = seatingCapacity;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }
   
    
}
