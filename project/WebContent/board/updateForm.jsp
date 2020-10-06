<%@page import="com.boto.board.BoardBean"%>
<%@page import="com.boto.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

<!-- button -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- button -->

<!-- 검색창 -->
<link href="../css/search.css" rel="stylesheet" >
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- 검색창 -->


<!-- Sidebar -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Sidebar -->

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
	
	if(id == null){
%>
	<script type="text/javascript">
		alert("로그인 후 이용가능합니다.");
		location.href="../member/loginForm.jsp";
	</script>	
<%
	}
%>

<%
	// 전달된 파라미터 값 저장 (bno, pageNum)
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	// 수정할 글 정보를 가져오기
	
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	
	// 글 정보를 가져오는 메서드 
	BoardBean bb = bdao.getBoard(bno);
	
	// 수정할 정보를 출력
%>


	<!-- 본문 -->
	<div style="margin-left:20%; margin-right:20%;">

	<br><br><br><br><br>

	<div class="container">
  	<h2>Notice of Boto Gallery</h2>
  
  	<br><br><br>
  	<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
  	<input type="hidden" name="bno" value="<%=bb.getBno() %>">
  	
   	 <div class="form-group">
       <label>제목  </label> <br>
       <input type="text" class="form-control"  name="subject" value="<%=bb.getSubject() %>" style="height:40px; width:500px;"> <br>
    
       <label>작성자  </label> <br>
       <input type="text" class="form-control"  name="name" value="<%=bb.getName() %>" readonly style="height:40px; width:500px;"> <br>
    
       <label >비밀번호  </label> <br>
       <input type="password" class="form-control" name="pass" style="height:40px; width:500px;"> <br>
   
   	<!-- 글내용 -->
   		<div style="width:1000px; height:500px;">
       <textarea name="content" class="form-control"  style="height:500px; width:1000px; font-size:15px;"><%=bb.getContent() %></textarea> <br><br>
   		</div>
   	   <label >첨부파일  </label> <br>
       <input type="file" class="form-control" name="file" value="<%=bb.getFile() %>" style="height:45px; width:500px; font-size:15px;"> <br>
    	
    
    <br><br>
    
    <button type="submit" class="btn btn-primary" style="width:80px;height:40px; font-size:15px; background-color: lightslategray;">수정하기</button>
    <a href="boardList.jsp"><button type="button" class="btn btn-default" style="width:80px;height:40px; font-size:15px;">돌아가기</button></a>
    </div>
  	</form>
	</div> 
	
</div>
<!-- 본문 -->

<br><br><br><br><br>


<!-- footer -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- footer -->


</body>
</html>