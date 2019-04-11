<%-- 
    Document   : index
    Created on : Sep 3, 2018, 8:36:26 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="mui/css/mui.css" rel="stylesheet" >
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<meta name="google-signin-client_id" content="737486437540-onplan5svi1r5sip4qo798o2627um5pn.apps.googleusercontent.com">
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
				width: 100%;
				height: inherit;
				
				/*position: absolute;*/
				/*background-color: red;*/
			}
			.name1{
				color: white;
				font-family: cookie;
				font-size: 70px;
				font-weight: 270 ;
				float: left;
				width: 100%;
				text-align: center;
				margin-top: 200px;
			}
			.name2{
				width: 100%;
			}
			.name2 img{
				float: left;
				margin-top: 18px;
				margin-left: 5px;
				margin-right: 5px;
				width: 50px;
			} 
			.right{
				transform: rotate(180deg);
				margin-right: 0px;
				/*margin-left: -10px;*/
				float: left;
			}
			.name2 span{
				font-family: impact;
				font-size: 52px;
				font-weight: bold;
				color: white;
				float: left;
				/*letter-spacing: 5px;*/
			}
			.name3{
				color: #222222;
				font-family: helvetica;
				width: 100%;
				font-weight: bold;
				text-align: center;
				font-size: 25px;
				float: left;
				letter-spacing: 18px;
			}
			.login{
				width: 95%;
				height: 60px;
				margin: 100px 0 0 2.5%;
				border: 2px solid white;
				border-radius: 10px;
				float: left; 
				transition: 0.3s;
			}
			.login span{
				line-height: 60px;
				width: 100%;
				color: white;
				margin-left: 40%;
				font-family: helvetica;
				font-weight: bold;
				font-size: 30px;
			}
			.login:hover{
			background-color: white;
			}
			.login:hover > span{
			color: #222222;
			}
		.loginpage{
			width: 100%;
			height: inherit;
			/*background-color: red;*/
			float: left;
		}
		#back{
			/*display: none;*/
			font-size: 50px;
			width: 60px;
			height: 60px;
			color: white;
			border: none;
			outline: none;
			background-color: transparent;
			/*background-color: red;*/
			border-radius: 30px;
			/*float: left;*/
			margin: 20px 0 0 2%;
		}
		#back i{
			font-size: 50px;
			padding-top: 5px;
		}
		#back:hover{
			background-color: white;
			color: #222222;
		}
		.loginform{
			float: left;
			margin-top: 40px;
			/*font-size: 30px;*/
			background-color: white;
			width: 90%;
			margin-left: 5%;
			height: 360px;
			box-sizing: border-box;
			padding: 10px;
			transition: 1s;
			border-radius: 10px;
		}
		#name{
			margin-top: 30px;
		}
		#Mobile{
			margin-top: 40px;
		}
		#loginsubmit{
			width: 100%;
			font-size: 20px;
			background-color: #222222;
			border-radius: 10px;
		}
	}

	</style>
</head>
<body>
<div class="screen">
	<div class="main">
		<h1 class="name1">The</h1>
		<div class="name2">
			<img src="img/left.webp">
			<span>PIZZA SHOP</span>
			<img class="right" src="img/left.webp">
		</div>
		<span class="name3">MUMBAI</span>
			<div class="login">
				<span>LOGIN</span>
			</div>			
		
	</div>
	<div class="loginpage">
		<button id="back"><i class="material-icons">arrow_back</i></button>
		<h1 style="transform: scale(0.7);margin-top: -60px;" class="name1">The</h1>
		<div style="transform: scale(0.7);margin-top: -40px;" class="name2">
			<img src="img/left.webp">
			<span>PIZZA SHOP</span>
			<img class="right" src="img/left.webp">
		</div>
		<div class="loginform">
			<form method="post" action="verify_Otp.jsp">
				<div id="name" class="mui-textfield mui-textfield--float-label" style="">
    				<input name="name"type="text" required style="font-size: 20px;">
    				<label style="font-size: 20px;transition: 0.2s;margin:-20px 0">Name</label>
  				</div>
  				<div id="Mobile" class="mui-textfield mui-textfield--float-label" style="">
    				<input name="mobile" type="number" pattern="[789][0-9]{9}" required style="font-size: 20px;">
    				<label style="font-size: 20px;transition: 0.2s;margin:-20px 0">Mobile Number</label>
  				</div>
                                <div id="Mobile" class="mui-textfield mui-textfield--float-label" style="">
    				<input name="people" type="number" max='10' required style="font-size: 20px;">
    				<label style="font-size: 20px;transition: 0.2s;margin:-20px 0">Number of people</label>
  				</div>
  				<button id="loginsubmit" type="submit" class="mui-btn mui-btn--large mui-btn--raised mui-btn--primary" >LOG IN</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('.login').hover(function(){
		$('.main').slideUp(500,function(){
		
		});
	});
	$('#back').click(function(){
		$('.main').slideDown(500);
		
	});
</script>
</body>
</html>