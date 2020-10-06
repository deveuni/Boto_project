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
</head>
<body>



<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

<br><br><br>

<%
	// 로그인 처리 
	String id = (String)session.getAttribute("id");

	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
%>




<div class="blog__container comment__area">
				<h2>회원 탈퇴</h2>
				<form action="deletePro.jsp" method="post" class="comment__form">
					<div class="row">
						<div class="col-lg-6">
							<input type="text" name="id" value="<%=id %>" readonly>
						 </div>
						<br>
						<div class="col-lg-6"> 
							<input type="password" name="pass" placeholder="Password">
						</div>
						 <div class="col-lg-12">
							
							<button type="submit" class="btn btn-primary" style="color:white; background-color: lightslategray; width:80px;height:40px; font-size:15px;">회원 탈퇴</button>
						</div> 
					</div>
				</form>
			</div>



<!-- bottom -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- bottom -->


</body>
</html>