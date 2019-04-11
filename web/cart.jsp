<%-- 
    Document   : cart
    Created on : Dec 1, 2018, 4:47:27 PM
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
                margin-top: 20px;
                /*font-size: 30px;*/
                background-color: white;
                width: 92%;
                margin-left: 4%;
                height: 570px;
                box-sizing: border-box;
                padding: 5px;
                float: left;
                position: relative;
                border-radius: 10px;
                /*overflow-y: scroll;*/
            }
            .header h1{
            	text-align: center;
            	font-weight: bold;
            }
            .header hr{
            	margin-top: 0px;
                margin:0;
            }
            .header p{
            	margin-top: -10px;
            	color: grey;
            }
            .content{
            	overflow-y: scroll;
            }
            .cartitem:nth-child(1){
            }
            .cartitem{
            	border-bottom: 1px solid lightgray;
            	width: 100%;
                float: left;
                margin-top: 10px;
            	height: 70px;
            }
            .ItemName{
            	font-size: 20px;
            }
            .quantity{
            	font-size: 17px;
                top: 100px;
            	/*margin-top: 100px;*/
            	float: left;

            }
            .amount{
                float: right;
                font-size: 22px;
                border-radius: 10px;
                margin-top: 10px;
                padding: 3px;
                color: white;
                box-sizing: border-box;
                background-color: #4caf50;
            }
            .placeorder{
                width: 100%;
                height: 70px;
                margin-top: 13px;
                border-bottom: none;
                border: none;
                outline: none;
                background-color: #4caf50;
                color: white;
                font-size: 25px;
                font-weight: bold;
                letter-spacing: 10px;
                border-radius: 20px 20px 0 0;
            }
        }
        </style>
    </head>
    <body>
        <div class="screen">
            <div class="main">
                <div class="header">
                	<h1>Review Order</h1>
                	<hr>
                	<p>Please Check the order before placing it. As order once placed cannot be Cancelled.</p>
                	<hr>
                </div>
                <div class="content"></div>
            </div>
            <form method="post" action="createOrder">
                <input name="cart" type='text' hidden/>
                <button type="submit" class='placeorder'>ORDER NOW</button>
            </form>
                
        </div>



        <script type="text/javascript">
        	var cart=new Array();
        	$(document).ready(function(){
        		cart=getCookie("cart");
                if(cart==""){
                    cart=new Array();
                }
                else{
	                cart=JSON.parse(cart);
	                console.log(cart);
            	}
                deleteCookie("cart");
            	var cartitem;
            	for(var i=0; i<cart.length; i++){
            		cartitem=$("<div class='cartitem'></div>");
            		cartitem.append("<span class='ItemName'>"+cart[i].ItemName+"</span>");
            		cartitem.append("<span class='amount'> Rs."+(cart[i].quantity*cart[i].price)+".00 </span><br>");
            		cartitem.append("<span class='quantity'>Quantity: "+cart[i].quantity+"</span>");
            		cartitem.append("<span class='metadata' hidden>"+JSON.stringify(cart[i])+"</span>");
            		cartitem.appendTo(".content");
            	}
                $('input').val(JSON.stringify(cart));
        	});

        </script>
    </body>
</html>
