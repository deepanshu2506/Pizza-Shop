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
public class LoginCredentials {
    private String name;
    private String mobile;

    public LoginCredentials(String name, String mobile) {
        this.name = name;
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }
    
}
