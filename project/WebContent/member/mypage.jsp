<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>

<link href="../css/mypage.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

</head>
<body>

<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

<!-- Services section -->
	<section id="what-we-do" style="margin-left:15%; margin-right:10%;">
		<div class="container-fluid">
			<h2 class="section-title mb-2 h1">MY PAGE</h2>
			
					<br><br><br><br>
			<div class="row mt-5" >
				 <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4" >
					<div class="card">
						<div class="card-block block-3">
							<h3 class="card-title">회원 정보 수정</h3>
							
							<a href="updateForm.jsp" title="click" class="read-more" >click<i class="fa fa-angle-double-right ml-2"></i></a> 
						</div>
					</div>
				</div> 
				
				
	
			
			
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-3">
							<h3 class="card-title">비밀 번호 변경</h3>
						 <a href="passUpdateForm.jsp" title="click" class="read-more" >click<i class="fa fa-angle-double-right ml-2"></i></a> 
						</div>
					</div>
				</div>  
			
			 
				 <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-3">
							<h3 class="card-title">회원 탈퇴</h3>
							<a href="deleteForm.jsp" title="click" class="read-more" >click<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div> 
			
		 </div>	 
		 </div>
		 <br><br>
		 <br><br><br><br><br><br><br><br>
		 <br><br>
	</section>
	<!-- /Services section -->
	
	<br><br>
	
<!-- bottom -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- bottom -->

</body>
</html>