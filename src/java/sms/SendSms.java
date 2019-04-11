/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sms;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author pc
 */
public class SendSms {
    public String sendSms(String m,String s,String n) {
		try {
			
			String apiKey = "apikey=" + "	KTxZPP08jJ8-65kYbJ0TTC0fWY3FvmvfyGCZgngwxX";
			String message = "&message=" + "hello "+s+" your otp is : "+m;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "91"+n;

			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
	}
    
}
