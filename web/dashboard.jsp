    <%@page import="DAO.CustomerDAO"%>
<%@page import="Beans.Customers"%>
<%@page import="Beans.LoginCredentials"%>
<%-- 
    Document   : dashboard
    Created on : Sep 3, 2018, 11:10:53 PM
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
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            .container{
                float: left;
                margin-top: 20px;
                /*font-size: 30px;*/
                background-color: white;
                width: 90%;
                margin-left: 5%;
                /*overflow: none;*/
/*                height: 200px;*/
                box-sizing: border-box;
                padding: 10px;
                transition: 1s;
                border-radius: 10px;
            }
            .buttons{
                margin-top: 20px;
                width: 100%;
            }
            .buttons a:nth-child(1){
                margin-left: 50px;
            }
            .hamburger{
                width: 13%;
                margin:30px 0 0 20px;
                height: 60px;
                border: 2px solid white;
                border-radius: 8px;
                float: left;
                box-sizing: border-box;
                padding: 5px;
                transform: scale(0.8);

            }
            .line{
                width: 100%;
                margin-top: 8px;
                height: 5px;
                background-color: white;


            }

            .menu{
                margin-left: -61%;
                position: fixed;
                width: 60%;
                margin-top: 1.2%;
                z-index:4;
                height: 98%;
                 border:1px solid #eee;
                background-color: white;
                
                border-radius: 10px;
            }
            .menu .hamburger{
                width: 20%;
                margin: 10px 0 0 10px;
                border-color: black;
                transform: scale(0.8)
            }
            .menu .line{
                background-color: black;
            }
            .links{
                width: 100%;
                /*background-color: black;*/
                margin-top: 100px;
            }
            .links ul{
                /*height: 60%;*/
            }
            .menu .links ul li{
                list-style-type: none;
                width: 95%;
                margin-left: 2.5%;
                margin-top: 10px;
                height: 50px;
                line-height: 50px;
                font-size: 22px;
                  border:1px solid #eee;
                background:#f9f9f9;
                /*text-decoration: none;*/
                /*background-color: red;*/
                text-transform: capitalize;
                /*border: 1px solid black;*/
                border-radius: 10px;
                text-align: center;
                color: black;
                cursor: pointer;
                transition: 0.5s
            }
            .menu ul li:hover{
                background-color: black;
                color: white;
            }
            a:hover{
                text-decoration: none;
            }
            .name h3{
                text-align: center;
            }
            .container h3 , .container h5{
                text-align: center;
            }
            .container h5{
                margin-top: -10px;
                font-weight: normal;
                color: #404040
            } 
            
            
            
            
            
            .heading {
  font-size: 25px;
  margin-right: 25px;
}

.fa {
  font-size: 25px;
}

.checked {
  color: orange;
}

/* Three column layout */
.side {
  float: left;
  width: 15%;
  margin-top:10px;
}

.middle {
  margin-top:10px;
  float: left;
  width: 70%;
}

/* Place text to the right */
.right {
  text-align: right;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.row{
    border:1px solid #eee;
  border-radius: 10px;
  background:#f9f9f9;
  padding: 5px;
}

/* The bar container */
.bar-container {
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
  color: white;
}

/* Individual bars */
.bar-5 {width: 60%; height: 18px; background-color: #4CAF50;}
.bar-4 {width: 30%; height: 18px; background-color: #2196F3;}
.bar-3 {width: 10%; height: 18px; background-color: #00bcd4;}
.bar-2 {width: 4%; height: 18px; background-color: #ff9800;}
.bar-1 {width: 15%; height: 18px; background-color: #f44336;}
        }
        
        </style>
    </head>
    <body>
        <%
            Customers customer=new Customers();
            customer.setUserName((String)session.getAttribute("username"));
            customer.setPhoneNo((String)session.getAttribute("mobile"));
            CustomerDAO cdao=new CustomerDAO(customer);
            //returns userID if customer is already present.
            int customerID=cdao.add();
            session.setAttribute("userID",customerID);
        %>
        <div class="screen">
            <div class="menu">
                <div class="hamburger">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>
                <div class="links">
                    <ul>
                        <a href=""><li>HOME</li></a>
                        <li onclick="editProfile()">EDIT PROFILE</li>
                        <a href="menu.jsp"><li>ORDER NOW</li></a>
                        <a href="previous.jsp"><li>PREVIOUS ORDERS</li></a>
                        <a href="current.jsp"><li>TRACK ORDER</li></a>
                        <!--<a href=""><li>NUTRITIONAL INFO</li></a>-->
                    </ul>
                </div>
            </div>
            <div class="hamburger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </div>
            <div class="container">
                <div class="name">
                    <h3>Hello, ${username}</h3>
                </div>
                <div class="buttons">
                    <A HREF='menu.jsp'><button id="newOrder" type="submit" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary" style="background-color: #222222;">NEW ORDER</button></a>
                    <a href="pay.jsp"><button id="payBill" type="submit" style="background-color: #222222;" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary">PAY BILL</button></a>
                </div>
            </div>
                
                <div class="container" style="margin-top: 20px;">
                    <h3>Thank You for all the ratings.</h3>
                    <h5>We will surely aim to improve our service</h5>
                    <hr/>
                    
                   
                    <span style="margin-left : 33%" class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<p>3.8 average based on 45 reviews.</p>

<div class="row">
  <div class="side">
    <div>5 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-5"></div>
    </div>
  </div>
  <div class="side right">
    <div>27</div>
  </div>
  <div class="side">
    <div>4 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-4"></div>
    </div>
  </div>
  <div class="side right">
    <div>10</div>
  </div>
  <div class="side">
    <div>3 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-3"></div>
    </div>
  </div>
  <div class="side right">
    <div>2</div>
  </div>
  <div class="side">
    <div>2 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-2"></div>
    </div>
  </div>
  <div class="side right">
    <div>1</div>
  </div>
  <div class="side">
    <div>1 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-1"></div>
    </div>
  </div>
  <div class="side right">
      <div>5</div>
  </div>
</div>
                </div>   
        </div>
        <script type="text/javascript">
            var flag=0;
            $('.hamburger').click(function(){
//                $('.main').slideToggle("fast");
                if(flag==1){   
                     $(".menu").css("z-index" , "4" );
                    $('.menu').animate({
                        marginLeft: "-61%"
                       
                    },200);
                    flag=0;
                }
                else{
                    console.log("working");
                    $('.menu').animate({
                        marginLeft: "0%"
                    },200);
                    flag=1;
                }   
                });
                // $('.main .hamburger').animate({display: "block"});
                
                
                 function url_redirect(options){
                 var $form = $("<form />");
                 
                 $form.attr("action",options.url);
                 $form.attr("method",options.method);
                 
                 for (var data in options.data)
                 $form.append('<input type="hidden" name="'+data+'" value="'+options.data[data]+'" />');
                  
                 $("body").append($form);
                 $form.submit();
            }
            
            
            function editProfile(){
                url_redirect({
                   url: "EditProfile.jsp",
                   method: "post",
                   data: {}
                });
            }
        </script>
    </body>
</html>
