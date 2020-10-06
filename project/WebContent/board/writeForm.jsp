<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>


  <!-- button2 -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- button2 -->

<!-- 검색창 -->
<link href="../css/search.css" rel="stylesheet" >
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- 검색창 -->

<!-- 본문 -->

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 본문 -->

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





</head>
<body>


<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

<%
	// 아이디 저장 
	String id = (String)session.getAttribute("id");
	System.out.println("@@@w riteForm.jsp에서 id값: " +id);
	
	if(id == null){
%>
	<script type="text/javascript">
		alert("로그인 후 이용가능합니다.");
		location.href="../member/loginForm.jsp";
	</script>	
<%
	}
%>

<br><br><br>
	<!-- 본문 -->
	<div style="margin-left:20%; margin-right:20%;">

	<br><br><br><br><br>

	<div class="container">
  	<h2 style="font-size:40px">Notice of Boto Gallery</h2>
  
  	<br><br><br>
  	<div class="form-group">
  	<form action="writePro.jsp" method="post" enctype="multipart/form-data">
   	 
       <label>제목  </label> <br>
       <input type="text" class="form-control"  name="subject" style="height:40px; width:500px;"> <br>
    
       <label>작성자  </label> <br>
       <input type="text" class="form-control"  name="name" value="<%=id %>" readonly style="height:40px; width:500px;"> <br>
    
       <label >비밀번호  </label> <br> 
       <input type="password" class="form-control" name="pass" style="height:40px; width:500px;"> <br> 
   
   	<!-- 글내용 -->
   	 <div> 
       <textarea name="content" id="textarea" class="form-control" style="height:500px; width:1200px; font-size:15px;"></textarea> <br><br>
   		 </div> 
   	   <label >첨부파일  </label> <br>
       <input type="file" class="form-control" name="file" style="height:45px; width:500px; font-size:15px;"> <br>
    	<br><br>
    	<input type="submit" value="글쓰기" class="btn btn-primary" style="width:80px;height:40px; font-size:15px; background-color: lightslategray;">
    	<a href="boardList.jsp"><button type="button" class="btn btn-default" style="width:80px;height:40px; font-size:15px;">돌아가기</button></a>
  	</form>
  	</div>
	</div> 
</div>
	<!-- 본문 -->
<br><br><br><br><br>

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- footer -->


</body>
</html>