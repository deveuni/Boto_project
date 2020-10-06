<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  
		<meta charset="UTF-8">
	<meta name="description" content="Boto Photo Studio HTML Template">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>
	
	
	<!-- button2 -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- button2 -->
	

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

    <title>Boto</title>
    
   <!--  <style>
    
    label {font-size:200px;}
    
    </style> -->
    
    <script type="text/javascript">
   
    	function check(){
    		
    		if(passFrom.pass.value == ""){
    			alert("현재 비밀번호를 입력해 주세요.");
    			passFrom.pass.focus();
    			return false;
    		}
    		
    		
    		if(passFrom.newpass1.value == ""){
    			alert("새로운 비밀번호를 입력해 주세요.");
    			passFrom.pass.focus();
    			return false;
    		}
    		
    		if(passFrom.newpass2.value == ""){
    			alert("새로운 비밀번호 확인을 입력해 주세요.");
    			passFrom.pass.focus();
    			return false;
    		}
    		
    		if(passFrom.newpass1.value != passFrom.newpass2.value){
    			alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    			passFrom.newpass1.value="";
    			passFrom.newpass2.value="";
    			passFrom.newpass1.focus();
    			
    			return false;
    		}
    		
    		
    		
    	}
    	
    	
    </script>
    
</head>
<body>



<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

<br><br>

<%
	// 로그인 처리 
	String id = (String)session.getAttribute("id");

	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
%>



	<section class="contact__page">
	<div class="contact__warp">
	<div class="row">
	<!-- <div class="blog__container comment__area"> -->
			<div class="col-md-6">
				<h2 style="weight:70; font-size:40px;">비밀번호 변경</h2>
			</div>
			</div>
			<br><br>
				
				<form action="passUpdatePro.jsp" method="post" class="contact__form" name="passFrom" onsubmit="return check()">
					<!-- <div class="row"> -->
						
						<lable style="font-size:20px;">현재 비밀번호</lable>
							<input type="password" name="pass">
						 
						<br><br>
						
						<lable style="font-size:20px;">새로운 비밀번호</lable>
							<input type="password" name="newpass1">
						
						 
						<lable style="font-size:20px;">새로운 비밀번호 확인</lable>
							<input type="password" name="newpass2">
						
						<br><br>
							
							<button type="submit" class="btn btn-primary" style="color:white; background-color: lightslategray; width:80px;height:40px; font-size:15px;" >변경</button>
							<button type="buttom" class="btn btn-primary" style="color:white; background-color: lightslategray; width:80px;height:40px; font-size:15px;" onclick="location.href='main/main.jsp'">취소</button>
						</div> 
					
				</form>
			</div>
			</div>
			<!-- </div> -->
			</section>


<!-- bottom -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- bottom -->


</body>
</html>