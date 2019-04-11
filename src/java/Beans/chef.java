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
public class chef {
    private int ChefId;
    private String ChefName;
    private String password;
    private int active;
    private int busytime;
    
    public int getChefId() {
        return ChefId;
    }

    public void setChefId(int ChefId) {
        this.ChefId = ChefId;
    }

    public String getChefName() {
        return ChefName;
    }

    public void setChefName(String ChefName) {
        this.ChefName = ChefName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getBusytime() {
        return busytime;
    }

    public void setBusytime(int busytime) {
        this.busytime = busytime;
    }

    @Override
    public String toString() {
        return "chef{" + "ChefId=" + ChefId + ", ChefName=" + ChefName + ", password=" + password + ", active=" + active + ", busytime=" + busytime + '}';
    }

    public chef() {
    }
    
    public chef(String ChefName, String password, int active,int busytime) {
        this.ChefName = ChefName;
        this.password = password;
        this.active = active;
        this.busytime=busytime;
    }
//    
}
