<%-- 
    Document   : menu
    Created on : Nov 30, 2018, 10:18:44 AM
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
                margin-top: 20px;
                background-color: white;
                width: 92%;
                margin-left: 4%;
                height: 520px;
                box-sizing: border-box;
                padding: 5px;
                float: left;
                position: relative;
                border-radius: 10px 10px 0 0;
                overflow-y: scroll;
            }
            .cart-ribbon{
                width: 98%;
                margin-left: 1%;
                height: 68px;
                border-radius: 8px;
                background: linear-gradient(to right, #4caf50 42%, #99ff99 187%);
                float: left;
                margin-top: 10px;
                position: relative;
            }
            .cart-contents{
                width: 70%;
                height:55px; 
                float: left;
                margin-top: 6px;
                margin-left: 7px;
                color: white;
            }
            .cart-contents span:nth-child(1){
                font-size: 21px;
                font-weight: bold;
            }
            .cart-button{
                width: 22%;
                height: 50px;
                float: right;
                margin-right: 8px;
                border-radius: 30px;
                background-color: white;
                margin-top: 8px;

            }
            .cart-button span{
                color: #4caf50;
                font-size: 16.5px;
                font-weight: bold;
                line-height: 50px;
                margin-left: 2px;
            }
            .categories{
                width: 100%;
            }
            .categories li{
                height: 50px;
                list-style-type: none;
                line-height: 50px;
                font-size: 20px;border-radius: 8px;
                margin: 5px 0;
                background-color: #c7edc7;
                cursor: pointer;
                text-indent: 5px;
            }
            .categories li i{
                transform: scale(1.5);
                float: right;
                margin-right: 20px;
                margin-top: 15px;
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
            .menuitem{
                border-bottom: 1px solid black;
                line-height: 20px;
                height: 100px;
                
            }
            .itemname{
                font-size:18px;
            }
            .price{
                float: right;
                margin-right: 32px;
                margin-top: 4px;
                background-color: #4caf50;
                height: 25px;
                font-weight: bold;
                color: white;
                padding: 5px;
            }
            .ingredients{
                line-height: 8px;
                color: grey;
                margin-top: -30px;
            }
            .add-cart{
                padding: 10px;
                color: white;
                background-color: #4caf50;
                border: none;
                float: right;
                font-weight: bold;
                margin-top: 5px;
                margin-right: 20px;
                border-radius: 20px;
                cursor:pointer;
            }
            .rightpane{
                float:right;
                width:30%;
                height: 100%;
                
            }
            .leftpane{
                width: 70%;
                float: left;
            }
            .suggestions-container{
                width: 92%;
                margin-left: 4%;
                height: 50px;
                background-color: white;
                border-top: 1px solid grey;
                border-radius: 0 0 10px 10px;
                overflow-x: scroll;
            }
            .suggestions{
                width: 1000%;
            }
            .label{
                float: left;
                margin-top: 2px;
                line-height: 45px;
                font-size: 15px;
                background-color: #4caf50;
                color : white;
                border-radius: 10px;
                margin-left: 2px;
                text-indent: 5px;
                padding-left: 5px;
            }
            .quickitem{
                margin-top: 2px;
                float:left;
                width: 100px;
                height: 45px;
                border-radius: 30px;
                padding: 5px;
                box-sizing: border-box;
                color:white;
                font-weight: bold;
                text-align: center;
                background-color: #4caf50;
            }
            .quickitem:not(:first-of-type){
                float:left;
            }
        }
        .submenu{
            display: none;
        }
        .metadata{
            display: none;
        }
        .remove-cart{
            border: 0;
            background-color: #4caf50;
            color : white;
            padding: 5px;
            box-sizing: border-box;
        }
        .remove-cart:disabled{
            background-color: lightgray;
        } 
        
        </style>
    </head>
    <body>
        <div class="screen">
            <div class="main">
                <ul class="categories">
                </ul>
            </div>
            <div class="suggestions-container">
                <div class="suggestions">
                <span class="label">quick add:</span>
                </div>
            </div>
            <div class="cart-ribbon">
                <div class="cart-contents">
                    <span>Cart Value: Rs.<span id="cart-value">0</span>.00</span>
                    <br>
                    <span>Total items: <span id='cart-qty'>0</span></span>
                </div>
                <div class="cart-button">
                    <span>VIEW CART</span>
                </div>
            </div>
        </div>


        <script type="text/javascript">
            var category=new Array();
            var cart=new Array();
            var itemlist=new Array();
            var cart_subtotal=0;
            var cart_qty=0;
            $(document).ready(function(){
                $.get("getCategories",function(responseText){
                    
                    $.each(responseText,function(key,value){
                        menu_category= $("<li></li>").html(value+"<i class='material-icons'>expand_more</i>")
                        var submenu=$("<div class='submenu'></div>");

                        submenu.appendTo(menu_category);
                       category.push(menu_category);
                    });
                });
                        $.get("getItems",function(response){
                            console.log(response);
                              itemlist=response;
                            $.each(response,function(key,value){
                                value['quantity']=0;
                                var menuitem=$("<div class='menuitem'></div>");
                                var veg="";
                                if(value['veg']==0){
                                    veg="non-veg";
                                }
                                else{
                                    veg="veg";
                                }
                                var menuitem_html="<div class='leftpane'><span class='itemname'>"+value['ItemName']+"  ("+veg+")"+"</span><br>";
                                 menuitem_html+="<span class='ingredients'>"+value['ingredients']+"</span><button disabled class='remove-cart'>Cancel</button></div>";
                                 menuitem_html+="<div class='rightpane'><div class='price'>Rs."+value['price']+"</div>";
                                 menuitem_html+="<button class='add-cart'>Order Now</button></div>";
                                 menuitem_html+="<span class='metadata'>"+JSON.stringify(value)+"</span>";
                                menuitem.html(menuitem_html);
                                for(var i=0;i<category.length;i++){
                                    if(category[i].text().includes(value["Type"])){
                                        menuitem.appendTo(category[i].children("div").first());
                                    }
                                }
                            });
                            for(var i=0;i<category.length;i++){
                                category[i].appendTo(".categories");
                            }

                            
                        });
  
                        for(var i=0;i<cart.length;i++){
                            cart_subtotal+=cart[i].quantity*cart[i].price;
                            cart_qty+=cart[i].quantity;
                        }
                        $("#cart-value").text(cart_subtotal);
                        $("#cart-qty").text(cart_qty);
                        
                    
                                 
            });
            
            $(".categories").on("click","li",function(){

                $(this).children(".submenu").slideToggle("linear");
                $(".categories").children().not(this).slideToggle("linear");
            });
            
            
            $(".categories").on("click",".add-cart",function(){

               var objString=$(this).parent().parent().children(".metadata").html();

               obj=JSON.parse(objString);
            $(".suggestions").html("<span class='label'>Quick add:</span>");
            var min=0; 
            var max=itemlist.length;  
            var random =Math.floor(Math.random() * (+max - +min)) + +min; 

               for(var i=0;i<(Math.floor(Math.random()*10)+1);i++){
                   var index=Math.floor(Math.random() * (+max - +min)) + +min
                   var quickadd="<div class='quickitem'>"+itemlist[index]['ItemName']+"<em hidden>"+JSON.stringify(itemlist[index])+"</em></div>";
                   $('.suggestions').append(quickadd);
               }
               var flag=0; 
                for(var i=0;i<cart.length;i++){
                    if(obj.ItemName==cart[i].ItemName){
                        cart[i]['quantity']+=1;
                        flag=1;
                        break;
                    }
                }
                    if(flag==0){
                        obj=JSON.parse(objString);
                        obj.quantity=1;
                        cart.push(obj);
                    }
                    $(this).parent().siblings(".leftpane").children(".remove-cart").removeAttr("disabled");
                    cart_subtotal+=obj.price;
                    cart_qty+=1;
               $("#cart-value").text(cart_subtotal);
               $("#cart-qty").text(cart_qty);
               
            });
            
            $(".categories").on("click",".remove-cart",function(){
                var objString=$(this).parent().parent().children(".metadata").html();
                obj=JSON.parse(objString);
                
                for(var i=0;i<cart.length;i++){
                    if(obj.itemId==cart[i].itemId){
                        if(cart[i].quantity>1){
                            cart[i].quantity--;
                            console.log("h");
                        }
                        else{
                            cart.splice(i,1);
                            $(this).attr("disabled");
                        }
                    }
                    break;
                }
                cart_subtotal-=obj.price;
                cart_qty-=1;
                $("#cart-value").text(cart_subtotal);
                $("#cart-qty").text(cart_qty);
                console.log(cart);
            });
            
            $(".suggestions").on("click",".quickitem",function(){
                var objString=$(this).children().text();
                obj=JSON.parse(objString);
                var flag=0; 
                for(var i=0;i<cart.length;i++){
                    if(obj.ItemName==cart[i].ItemName){
                        cart[i]['quantity']+=1;
                        flag=1;
                        break;
                    }
                }
                if(flag==0){
                    obj=JSON.parse(objString);
                    obj.quantity=1;
                    cart.push(obj);
                }
                
                console.log(cart);
                cart_subtotal+=obj.price;
                cart_qty+=1;
                $("#cart-value").text(cart_subtotal);
                $("#cart-qty").text(cart_qty);   
            });
            $(".cart-button span").click(function(){
                setCookie("cart",JSON.stringify(cart),1);
                url_redirect({url:'cart.jsp'});
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
