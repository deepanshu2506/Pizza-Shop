<%-- 
    Document   : chefdash
    Created on : Dec 8, 2018, 12:06:01 PM
    Author     : pc
--%>

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
        <style>
            *{
                margin:0;
                padding:0;
            }
            
            .container{
                width: 100%;
                /*height: 400px;*/
                /*float: left;*/
                background-color: wheat;
            }
            .tables{
                width: 250px;
                height: 360px;
                background-color: white;
                border-radius: 20px;
                margin: 10px 0 0 20px;
                float: left;
                box-sizing: border-box;
                padding-top: 20px;
            }
            .tables span{
                font-size: 20px;
                margin: 0 0 0 20px;
            }
            .okbutton{
                width: 100%;
                height: 60px;
                /*position: absolute;*/
                /*margin-top: 40px;*/
                /*background-color: red;*/
               
            }
            .orderarea{
                width: 100%;
                height: 280px;
                overflow: hidden;
                overflow-y: scroll;
                /*background-color: red;*/
            }
            .okbutton button{
                width: inherit;
                height: inherit;
                border: none;
                background-color: black;
                color: white;
                font-size: 20px;
                text-transform: uppercase;
                border-radius: 0 0 20px 20px;
            }
            body{
                background: url("img/background-desktop.webp");
                background-size: 100%;
                /*background-position: fill;*/
            }
            
            .header{
                height: 50px;
                width: 100%;
                margin-top: 5px;
            }
            .header button{
                height: inherit;
                margin-right: 30px;
                float: right;
                color: white;
                background-color: black;
                font-size: 20px;
                font-weight: bold;
                letter-spacing: 1.5px;
                border : 0;
                outline: 0;
                border-radius: 30px;
                width: 150px;
            }
        </style>
    </head>
    <body>
        <%
            chef current = (chef) session.getAttribute("currentChef");
        %>
        <div class="header">
            <form action="chefLogout" method="post">
            <button type="submit">logout</button>
            </form>
        </div>
        <div class="container">
            
        </div>
        <script type="text/javascript">
            var activetables=new Array();
            var old=new Array();
            $(document).ready(function(){
                setInterval(function(){
                    $.get("cheforders",{"chefid":<%=current.getChefId()%>},function(response){
//                        console.log(old);
                        if(!(JSON.stringify(response)==JSON.stringify(old))){
//                            console.log(response);
                            $.each(response,function(key,value){
//                                console.log(key+" : "+JSON.stringify(value)); 
//                                console.log(activetables.includes(key));
                                    var singleorder=$("<div class='tables' id='"+key+"'></div>");
//                                    console.log("heyy");
                                    singleorder.append("<div class='orderarea'></div>");
                                    var singleorder_html="<span>Table No: "+key+"</span><br>";
                                    $.each(value,function(k,v){
//                                        console.log(JSON.stringify(v));
                                        singleorder_html+="<span>"+v.quantity+" x "+v.item+"<span hidden>"+JSON.stringify(v)+"</span></span><br>";
                                    });
//                                    singleorder_html+="<div class='okbutton'><button>Order Complete</button></div>"
//                                    console.log(singleorder_html);
                                    singleorder.children(".orderarea").html(singleorder_html);
                                    singleorder.append("<div class='okbutton'><button>Order Complete</button></div>");
                                    $(".container").append(singleorder);
                            });
                            $(".container").on("click",".okbutton button",function(){
                                var completeorder=new Array();
                                counter = 0;
                                $.each($(this).parent().parent().children().eq(0).children('span'),function(key,div){ 
                                    if(counter != 0){
                                        var jsonText = $(div).children().text();
                                        completeorder.push(JSON.parse(jsonText));
                                    }
                                    //                                    
                                    counter++;
                                });
                                console.log(completeorder);
                                $.get("deliverorder",{orderitems: JSON.stringify(completeorder)} , function(result){
                                    console.log(result);
                                });
                                
                               $(this).parent().parent().remove();
                            });
                            
                            
                            old=response;
                        }
                    }); 
                },900);
           });
           
           
          
        </script>
    </body>
</html>
