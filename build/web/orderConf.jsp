<%-- 
    Document   : orderConf.jsp
    Created on : Dec 3, 2018, 8:58:06 PM
    Author     : pc
--%>

<%@page import="DAO.chefDAO"%>
<%@page import="Beans.chef"%>
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
            .main{
                float: left;
                margin-top: 100px;
                /*font-size: 30px;*/
                background-color: white;
                width: 92%;
                margin-left: 4%;
                height: 340px;
                box-sizing: border-box;
                padding: 5px;
                float: left;
                position: relative;
                border-radius: 10px;
                /*overflow-y: scroll;*/
            }
            img{
                width:100px;
                margin: 20px 0 0 37%;
            }
            h1{
                font-weight: bold;
                letter-spacing: -1px;
                /*align-items: center;*/
                text-align: center;
                /*margin: 10px 0 0 18%;*/
            }
            hr{
                width:90%;
                margin-left: 5%;
            }
            h4{
                text-align: center;
                width: 88%;
                /*align-self: center;*/
                margin-left: 6%;
            }
            .buttons{
                margin-top: 100px;
                width: 100%;
                align-content: center;
            }
            .buttons button:nth-child(1){
                margin-left: 55px;
                float:left;
            }
        }
        </style>
    </head>
    <body>
        <%chef currentchef=(chef)session.getAttribute("chef");
        
        currentchef.setBusytime(new chefDAO().getChefbusytime(currentchef.getChefId()));
        
        %>
        <div class="screen">
            <div class="main">
                <img src="img/confirm.svg"/>
                <h1>Order Confirmed</h1>
                <hr/>
                <h4>Your order is being being freshly prepared by chef <%=currentchef.getChefName()%></h4>
                <h4>It will reach to you in <%=currentchef.getBusytime()%> minutes</h4>
            </div>
            <div class="buttons">
                    <A HREF='menu.jsp'><button id="Ordermore" type="submit" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary" style="background-color: #222222;">ORDER MORE</button></a>
                    <a href='dashboard.jsp'><button id="dashboard" type="submit" style="background-color: #222222;margin-left: 20px;" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary">DASHBOARD</button></a>
                </div>
        </div>
    </body>
</html>
