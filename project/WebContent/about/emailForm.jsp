<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

	<!-- 헤더 푸터 -->
<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>
<!-- 헤더 푸터 -->
	
<!-- 본문 -->

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 본문 -->


  <!-- button2 -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- button2 -->


</head>
<body>

	<!-- 메일보내기 폼 -->


	<!-- header -->
		<jsp:include page="../inc/top.jsp"/>
	<!-- header -->
	
	
	<br><br>
	<div class="container">
  	<h2 style="font-size:40px">문의 하기</h2>
  	<br><br>
  	<h4>boto_1234@naver.com으로 문의하시길 바랍니다.</h4>
  
  	<br><br><br>
  	<div class="form-group">
  	<form action="emailPro.jsp" method="post" name="mailForm">
   	 
       <label> 받는 사람  </label> <br>
       <input type="text" class="form-control"  name="receiver" id="receiver" placeholder="boto_1234@naver.com" style="height:40px; width:500px;"> <br>
       
       <label> 보내는 사람  </label> <br>
       <input type="text" class="form-control"  name="sender" id="sender" placeholder="보내시는 분의 이메일 주소를 입력하세요. " style="height:40px; width:500px;"> <br>
    
       <label >제목  </label> <br> 
       <input type="text" class="form-control" name="subject" id="subject" style="height:40px; width:500px;"> <br> 
   
   	
   	 <div> 
       <textarea name="content" id="content"  class="form-control" style="height:500px; width:1200px; font-size:15px;"></textarea> <br><br>
   		 </div> 
   		
    
    <br><br>
    
    <input type="submit"  value="문의하기" class="btn btn-primary" style="width:80px;height:40px; font-size:15px; background-color: lightslategray;">
    <button type="reset" class="btn btn-default" style="width:80px;height:40px; font-size:15px;">취소하기</button>
    
  	</form>
  	</div>
	</div> 
		<!-- 본문 -->



	<!-- footer -->
		<jsp:include page="../inc/bottom.jsp"/>
	<!-- footer -->


</body>
</html>