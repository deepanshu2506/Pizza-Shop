<%-- 
    Document   : verify_Otp
    Created on : Nov 29, 2018, 1:22:06 PM
    Author     : pc
--%>

<%@page import="java.net.HttpURLConnection"%>
<%@page import="Beans.LoginCredentials"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="sms.OTPGenerator"%>
<%@page import="sms.SendSms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="mui/css/mui.css" rel="stylesheet" >
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<meta name="google-signin-client_id" content="737486437540-onplan5svi1r5sip4qo798o2627um5pn.apps.googleusercontent.com">
        <title>JSP Page</title>
    <style type="text/css">
        *{
        margin: 0;
        padding: 0;
    }
        @media screen and (max-width:500px){
            .screen{
                width: 100%;
                height: 673px;
                background: url('img/background.PNG');
                overflow: hidden;
            }
            #loginsubmit{
                width: 100%;
                font-size: 20px;
                background-color: #222222;
                border-radius: 10px;
            }
            #otp{
            margin-top: 30px;
            }
            .otpverify{
                float: left;
                margin-top: 250px;
            
                background-color: white;
                width: 90%;
                margin-left: 5%;

                box-sizing: border-box;
                padding: 10px;
                transition: 1s;
                border-radius: 10px;
            }
            .error{
                color: red;
            }
        }
    </style>
    </head>
    <body onload="check()">
        <%
            if(session.getAttribute("details")==null){
                session.setAttribute("details", new LoginCredentials(request.getParameter("name"),request.getParameter("mobile")));
            }
            if(!(request.getParameter("otpsent")=="true")){
            String otp=OTPGenerator.generate();
//            String otp ="1234";
            session.setAttribute("otp", otp);
            String number=request.getParameter("mobile");
            String people=request.getParameter("people");
            String name=request.getParameter("name");
            session.setAttribute("username",name);
            session.setAttribute("mobile",number);
            session.setAttribute("people", people);
            URL url = new URL("https://2factor.in/API/V1/2387cf95-2f99-11e9-8806-0200cd936042/SMS/"+number+"/"+otp+"/Pizza+shop");        
            HttpURLConnection uc = (HttpURLConnection)url.openConnection();
            System.out.println(uc.getResponseMessage());
            uc.disconnect();

            
            }
            %>

        <div class="screen">
            <div class="otpverify">
                    <h3 class="error"></h3>
                   
                    <div id="otp" class="mui-textfield mui-textfield--float-label" style="">
                        <input id="otpuser" type="number" required style="font-size: 20px;">
                        <label style="font-size: 20px;transition: 0.2s;margin:-20px 0">Verify OTP</label>
                    </div>
                  <button id="loginsubmit" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary" >VERIFY</button>
                   
            </div>
        </div>       

    <script type="text/javascript">
        
        $("#loginsubmit").click(function(){
            var otp=$("#otpuser").val();
            $.get("VerifyOTP",{otpuser:otp},function(responseText){
                if(responseText=="1"){
                    
                   url_redirect({
                      url:"dashboard.jsp",
                      method: "post",
                      data: {}
                   });
                }
                else{
                    $(".error").text("invalid OTP");
                }
                
 
            });
        });
        
        
        function url_redirect(options){
                 var $form = $("<form />");
                 
                 $form.attr("action",options.url);
                 $form.attr("method",options.method);
                 
                 for (var data in options.data)
                 $form.append('<input type="hidden" name="'+data+'" value="'+options.data[data]+'" />');
                  
                 $("body").append($form);
                 $form.submit();
            }
    </script>   
    </body>
</html>
