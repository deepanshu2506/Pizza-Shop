<%-- 
    Document   : previous
    Created on : Dec 5, 2018, 12:57:29 PM
    Author     : pc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page import="Beans.items"%>
<%@page import="DAO.ordersjdbcDAO"%>
<%@page import="Beans.orderSelector"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CustomerDAO"%>
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
        <script type="text/javascript" src="scripts/cookies.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
                margin-top: 30px;
                /*font-size: 30px;*/
                background-color: white;
                width: 92%;
                margin-left: 4%;
                height: 610px;
                box-sizing: border-box;
                padding: 5px;
                float: left;
                position: relative;
                border-radius: 10px;
                overflow-y: scroll;
            }
            .orderlist{
                width: 100%;
            }
            .orders{
                height: 50px;
                list-style-type: none;
                /*text-align: center;*/
                line-height: 50px;
                /*padding-left: 10px;*/
                font-size: 20px;border-radius: 8px;
                margin: 5px 0;
                background-color: #c7edc7;
                cursor: pointer;
                text-indent: 5px;
            }
            .orders i{
                float:right;
                transform: scale(1.5);
                margin: 10px 20px 0 0;
            }
            .submenu{
                margin: 10px 0 ;
                background-color: lightyellow;
                display: none;
                width: 100%;
                font-size: 15px;
                z-index: 10;
                position: absolute;
                line-height: 15px;
            }
            .menuitem ,.menuitem-amt{
                border-bottom: 1px solid grey;
                line-height: 20px;
                padding: 10px 10px;
                /*height: 45px;*/
                font-size: 18px;
            }
            .quantity{
                /*margin-top: 20px;*/
            }
            .amount{
                float:right;
                margin-right: 10px;
                font-weight: bold;
            }
            .menuitem-amt span{
                margin-right: 10px;
            }
        }
        </style>
         
    </head>
    <body>
        
        <%
           String username=(String)session.getAttribute("username");
            int userId=new CustomerDAO().getCustomerIdByUsername(username);
            
            List<orderSelector> orderlist=new ordersjdbcDAO().getOrder(userId, 0);
            List<items> itemlist;
        %>
        <div class="screen">
            <div class="main">
                <ul class="orderlist">
                    
                    <%  if(!(orderlist.size() == 0)){
                        for(orderSelector o:orderlist){%>
                    <%
                        Date date=new Date(o.getTimeStamp().getTime());
                         SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
                        itemlist=o.getItems();
                        int net_amt=0;
                        float gst=0;
                        
                    %>
                    <li class="orders">
                         <%=formatter.format(date)%><i class='material-icons'>expand_more</i>
                        <div class="submenu">
                            <%for(items i:itemlist){%>
                                <%
                                    int quantity=i.getQuantity();
                                    int price=i.getPrice();
                                    
                                    net_amt+=quantity*price;
                                    gst=(float)0.18*net_amt;
                                %>
                                <div class="menuitem">
                                    <span class="itemname"><%=i.getItemname()%></span>
                                    <span class="amount">Rs.<%=quantity*price%>.00</span>
                                    <br style="margin-top:10px;">
                                    <span class="quantity">Quantity: <%=i.getQuantity()%></span>
                                </div>

                            <%}%>
                                    <div class="menuitem-amt">
                                    <span>Net amount: </span><span style="float:right;">Rs.<%=net_amt%>.00</span>
                                    <br>
                                    <span>GST: </span><span style="float:right;">Rs.<%=gst%>0</span>
                                    <br>
                                    <hr/>
                                    <span>Grand Total: </span><span style="float:right;">Rs.<%=net_amt+gst%>0</span>
                                </div>
                        </div>
                    </li>    
                <%}}else{%>
                <h1>NO PREVIOUS ORDERS</h1>
                <%}%>
                </ul>
        </div>
    </div>

    <script type="text/javascript">
        $(".orderlist").on("click","li",function(){
//                console.log("hello");
                $(this).children(".submenu").slideToggle("linear");
                $(".orderlist").children().not(this).slideToggle("linear");
            });
    </script>
    </body>
</html>





