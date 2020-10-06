<%@page import="com.boto.gallery.GalleryDAO"%>
<%@page import="com.boto.gallery.GalleryBean"%>
<%@page import="com.boto.board.BoardBean"%>
<%@page import="com.boto.board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Boto</title>
	<meta charset="UTF-8">
	<meta name="description" content="Boto Photo Studio HTML Template">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>
	
<!-- button -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- button -->
	
	
<!-- gallery -->
	<style>
		div.gallery {
  			margin: 5px;
  			border: 1px solid #ccc;
  			float: left;
  			width: 180px;
		}

		div.gallery:hover {
  			border: 1px solid #777;
		}

		div.gallery img {
  			width: 100%;
  			height: auto;
		}

		div.desc {
  			padding: 15px;
  			text-align: center;
		}
	</style>
<!-- gallery -->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header-->
	<jsp:include page="../inc/top.jsp"/>
	<!-- Header -->
	
	<%
	// DB에서 전체 글 목록을 읽어서 가져오기
	
	String filename = request.getParameter("filename");
	String uploadPath = request.getParameter("uploadPath");
	
	// BoardDAO 객체 생성 
	GalleryDAO gdao = new GalleryDAO(); 
		
	// 테이블에 글이 있는지 없는지 판단(getBoardCount()) 
	int cnt = gdao.getGalleryCount();
		
	System.out.println("테이블에 저장된 글의 수 : " + cnt);
	

	// 페이징 처리 *********************************************************************************
		
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 8;
		
		 // 현 페이지의 페이지 값을 확인 - 연산하지 않고 표시만 하기 때문에 문자열로 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){ // 페이지 정보가 없을 경우 항상 1페이지 
			pageNum = "1";
		}
		
		// 시작 행번호 계산  1...10 / 11...20 / 21...30 / 31...40
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		// 시작 행번호 계산 - 1, 11, 21, 31, ...
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝 행번호 계산  - 10, 20, 30, ...
		int endRow = currentPage * pageSize; 
		
	// 페이징 처리 *********************************************************************************

	// 게시판의 총 글의 수를 화면에 출력
	ArrayList galleryList = null;
	
	// 게시판 글 모두 가져오기 
	if(cnt != 0){
		galleryList = gdao.getGalleryList(startRow, pageSize);
	}
	
%>
	<!-- 본문 -->
	<div class="gallery__page">
		<div class="gallery__warp" style="text-align: center;">
		<input type="button" class="btn btn-primary" value="사진올리기"  style="background-color: lightslategray;" onclick="location.href='gWriteForm.jsp'">
			<div class="row">
			  <%
               for(int i=0; i<galleryList.size(); i++){
            	 // ArrayList 한칸의 정보 -> BoardBean 객체 하나로 이동
            	 GalleryBean gb = (GalleryBean)galleryList.get(i);
               %>  
				<div class="col-lg-3 col-md-4 col-sm-6" style="width:500px; text-align:center; font-size:20px;">
				 <a href="content.jsp?bno=<%=gb.getBno() %>&pageNum=<%=pageNum %>" data-fresco-group="gallery" >
						<img src="../upload/<%=gb.getFile() %>" style="width:350px; height:350px; margin:45px 45px 45px 20px;">
						 <%=gb.getSubject() %>
				 </a>
				</div>   
			<%} %>	
			</div>
		<br><br><br>
				<div style="display: inline-block; "> 
			 <%
			 	// 다른 페이지로 이동 버튼 만들기 
			 	if(cnt != 0){
			 		
			 		// 전체 페이지수 
			 		int pageCount = cnt/pageSize + (cnt % pageSize == 0? 0:1);
			 		
			 		// 한 화면에 보여줄 페이지 번호 개수
			 		int pageBlock = 5;
			 		
			 		// 페이지 블럭의 시작 페이지 
			 		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			 		
			 		// 페이지 블럭의 끝 페이지 번호 
					int endPage = startPage + pageBlock-1;
					if(endPage > pageCount){
						endPage = pageCount;
					}
					// [이전] 버튼
					if(startPage > pageBlock){
				%>
						<a href="galleryList.jsp?pageNum=<%=startPage-pageBlock%>" class="btn btn-default" style="align:center;">이전</a>
				<% 		
					}
					
					for(int i=startPage;i<=endPage;i++){
			 	%>	
			 			<a href="galleryList.jsp?pageNum=<%=i%>" class="btn btn-default" style="align:center;"><%=i %></a>
			 	<%
					}
					
					// [다음] 버튼
					if(endPage < pageCount){
				%>
						<a href ="galleryList.jsp?pageNum=<%=startPage+pageBlock%>" class="btn btn-default" style="align:center;">다음</a>
				<% 		
					}
			 	}
			 	%>	
			 	</div>	
			<br><br><br>
 </div>
</div>
	<!-- 본문-->
	
	<!-- Footer-->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer-->

	<!--====== Javascripts & Jquery ======-->
	<script src="../js/vendor/jquery-3.2.1.min.js"></script>
	<script src="../js/jquery.slicknav.min.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/fresco.min.js"></script>
	<script src="../js/main.js"></script>

	</body>
</html>