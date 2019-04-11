<%@page import="DAO.CustomerDAO"%>
<%@page import="Beans.Customers"%>
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
    <title>JSP Page</title></head>
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
                margin-top: 90px;
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
            #submit-btn{
                width: 100%;
                margin-top: 20px;
            }
    	}
    </style>
<body>
        <%
            int custId=(Integer)session.getAttribute("userID");
            Customers currentCustomer=new CustomerDAO().getCustomerById(custId);
            session.setAttribute("customerObj", currentCustomer);
        %>
	<div class="screen">
		<div class="main">
        <form method="post" action="SaveProfile">
            <%=custId%>
            <div class="mui-textfield mui-textfield--float-label">
                <input type="text" name="name" value="${username}">
                <label>Name</label>
            </div>
            <div class="mui-textfield mui-textfield--float-label">
                <input type="text" value="<%=currentCustomer.getAddress()%>" name="address">
                <label>Address</label>
            </div>
            <div class="mui-textfield mui-textfield--float-label">
                <input type="number" name="phone" value="${mobile}">
                <label>Phone number</label>
            </div>
            <div class="mui-textfield mui-textfield--float-label">
                <input type="Email" name="email" value="<%=currentCustomer.getemail()%>">
                <label>Email</label>
            </div>
             
            <div class="mui-radio" id="gender-male-div">
                <label>
                    <input type="radio" name="gender" id="gender-male" value="male">
                    Male
                </label>
              </div>
            <div class="mui-radio">
                <label>
                    <input type="radio" name="gender" id="gender-female" value="female">
                    Female
                </label>
            </div>
            <br>
            <button type="submit" id="submit-btn" class="mui-btn mui-btn--raised mui-btn--primary">Save Details</button>
        </form>
        </div>
    </div>
  
    </script>
</body>
</html>