
<%@page import="com.boto.gallery.GalleryBean"%>
<%@page import="com.boto.gallery.GalleryDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boto</title>

<!-- 헤더 푸터 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>
<!-- 헤더 푸터 -->

<!-- board -->
<link href="../css/board2.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- board -->

</head>
<body>


<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->
<br><br><br>
	<%
		// 글 번호에 해당하는 글의 정보를 가져오기 
		
		// 전달된 데이터 저장(bno, pageNum)
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		String filename = request.getParameter("filename");
		String uploadPath = request.getParameter("uploadPath");
		
		// BoardDAO 객체 생성
		GalleryDAO gdao = new GalleryDAO(); 
		
		// 글의 조회수 정보를 1증가 (updateReadCount(bno)) 
		gdao.updateReadCount(bno);
				
		
		// 글 정보를 가져오는 메서드 생성(getBoard(bno))
		GalleryBean gb = gdao.getGallery(bno);
				
		// 화면(테이블)에 출력
	%>
	

	

<div style="margin-left:15%; margin-right:15%">

<!-- 본문 -->
     <div class="row">
        <div class="col">
           <div class="card"> 
            <div class="card-body">
              <h5 class="card-title" style="font-size:40px">Artists of Boto Gallery</h5>
              <br>
              <table class="table" >
                <thead>
                  <tr>
                    <th class="bno">No.<%=gb.getBno() %></th>
                    <th class="title"><%=gb.getSubject() %></th>
                    <th class="write"><%=gb.getName() %></th>
                    <th class="date" ><%=gb.getDate() %></th>
                    <th class="read"><%=gb.getReadcount() %></th>
                  </tr>
                </thead>
                  <tr>
                	<td colspan="5" height="1000px" >
                		<p style="white-space: pre-line;">
             	 		<a href="../upload/<%=gb.getFile() %>"><img src="../upload/<%=gb.getFile() %>" width="700px" height="700px"></a>
             	 			<%=gb.getContent() %>
                		</p>
                	</td>
                 </tr>
                 <tr>
                	<th style="width:100px; height:30px;">첨부파일</th>
                 	<td style="width:500px; height:30px;"> <a href="file_down.jsp?file_name=<%=gb.getFile()%>"><%=gb.getFile() %></a></td>
                 </tr>
              </table>
            </div>
          </div>
        </div>
       </div> 
     
       <br>
       <div class="container" style="float: left;">
       <div style="float: left;">
			<a href="galleryList.jsp?pageNum=<%=pageNum%>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">목록보기</button></a>
			 
		<%
			// 아이디랑 작성자가 같을 경우 글수정, 삭제 가능!
			String id = (String)session.getAttribute("id");
			if( id != null && id.equals(gb.getName())){
		
		%>	
			<a href="gUpdateForm.jsp?bno=<%=gb.getBno() %>&pageNum=<%=pageNum %>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">수정하기</button></a>
			<a href="gDeleteForm.jsp?bno=<%=gb.getBno() %>&pageNum=<%=pageNum %>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">삭제하기</button></a>
		<%
			}
		%>	
		</div>
		</div>
<!-- 본문 -->		
</div>

<br><br><br><br><br>

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- footer -->






























</body>
</html>