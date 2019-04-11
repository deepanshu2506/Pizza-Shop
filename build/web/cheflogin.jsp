<%-- 
    Document   : cheflogin
    Created on : Dec 5, 2018, 9:03:59 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="mui/css/mui.css" rel="stylesheet" >

        <script type="text/javascript" src="scripts/cookies.js"></script>
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <title>JSP Page</title>
        <style>
            *{
                margin:0;
                padding:0;
            }
            body{
                background: url("img/background-desktop.webp");
                background-size: 100%;
                /*background-position: fill;*/
            }
            .container{
                width: 40%;
                height: 300px;
                background-color: white;
                margin-left:  30%;
                margin-top: -20px;
                box-sizing: border-box;
                padding: 40px 20px;
                border-radius: 30px;
            }
            #loginsubmit{
                width: 100%;
                background-color: black;
                font-size: 20px;
            }
            h1{
                height: 100px;
                text-align: center;
                color: white;
                font-size: 50px;
                letter-spacing: 1.2px;
               
            }
        </style>
    </head>
    <body>
        <h1>Chef Login</h1>
        <div class="container" >
            
            <%
                if(request.getParameter("error") != null){
            %>
                <h4 style="color:red">Invalid Credentials</h4>
            <%
                }
            %>
            <form action="cheflogin" method = "post">
                <div id="name" class="mui-textfield mui-textfield--float-label" style="">
                    <input name="name"type="text" required style="font-size: 20px;">
         	    <label style="font-size: 20px;transition: 0.2s">Full Name</label>
 		</div>
                <input type="text" hidden name="error" value =" "/>
                <div id="password" class="mui-textfield mui-textfield--float-label" style="">
                    <input name="password"type="password" required style="font-size: 20px;">
         	    <label style="font-size: 20px;transition: 0.2s">Password</label>
 		</div>
                <button id="loginsubmit" type="submit" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary" >LOG IN</button>
            </form>
        </div>
    </body>
</html>
