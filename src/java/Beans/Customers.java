/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author pc
 */

@NamedQueries({
    @NamedQuery(
            name="loginCheck",
            query="from customers where UserName = :name and phoneNo = :phone"
    ),  
    @NamedQuery(
            name="searchById",
            query="from customers where UserID= :custid"
    )
        
})
public class Customers {
    private int UserID;
    private String UserName;
    private String phoneNo;
    private String Address;
    private String email;
    private String Gender;

    public Customers() {
    }

    public Customers(String UserName, String phoneNo, String Address, String email, String Gender) {
        this.UserName = UserName;
        this.phoneNo = phoneNo;
        this.Address = Address;
        this.email = email;
        this.Gender = Gender;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }
    
    
}
