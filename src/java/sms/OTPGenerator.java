/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sms;

import java.util.Random;

/**
 *
 * @author pc
 */
public class OTPGenerator {
    public static String generate(){
         int len=6;
         String numbers = "0123456789";
		// Using random method
		Random rndm_method = new Random();

		char[] password = new char[len];

		for (int i = 0; i < len; i++)
		{
			// Use of charAt() method : to get character value
			// Use of nextInt() as it is scanning the value as int
			password[i] =numbers.charAt(rndm_method.nextInt(numbers.length()));

		}
		return new String(password);
    }
}
