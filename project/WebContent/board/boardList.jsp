<%@page import="com.boto.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
<!--  button -->

<!-- board -->
<link href="../css/board2.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- board -->


<!-- 헤더 푸터 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
<!-- 헤더 푸터 -->



<style type="text/css">

  .btn-pr {
	  display: inline-block;
  	  font-weight: 400;
  	  text-align: center;
  	  white-space: nowrap;
  	  vertical-align: middle;
  	  user-select: none;
  	  border: 1px solid transparent;
  	  background-color: lightslategray !important;
      padding: .375rem .75rem;
      font-size: 1rem;
      line-height: 1.5;
      border-radius: .25rem;
      color: #fff !important;
  }
</style>

</head>
<body>



<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->



<!-- 본문 -->
<div style="margin-left:15%; margin-right:15%">

<br><br><br><br>

<%

	// DB에서 전체 글 목록을 읽어서 가져오기
	
	// BoardDAO 객체 생성 
	BoardDAO bdao = new BoardDAO(); 
		
	// 테이블에 글이 있는지 없는지 판단(getBoardCount()) 
	int cnt = bdao.getBoardCount();
		
	System.out.println("테이블에 저장된 글의 수 : " + cnt);
	

	// 페이징 처리 *********************************************************************************
		
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 10;
		
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
	ArrayList boardList = null;
	
	// 게시판 글 모두 가져오기 
	if(cnt != 0){
		boardList = bdao.getBoardList(startRow, pageSize);
	}
	
%>

<!-- 게시판 -->

     <div class="row">
        <div class="col">
            <div class="card"> 
            <br>
            <div class="card-body" style="text-align: center;">
              <h5 class="card-title" style="font-size:40px">Notice of Boto Gallery</h5>
              <br><br><br>
              <table class="table" style="font-size:15px;">
                <thead>
                  <tr>
                    <th class="bno">No.</th>
                    <th class="title" style="text-align: left;">Title</th>
                    <th class="write">Writer</th>
                    <th class="date">Date</th>
                    <th class="read">Read</th>
                  </tr>
                </thead>
               <%
               for(int i=0; i<boardList.size(); i++){
            	 // ArrayList 한칸의 정보 -> BoardBean 객체 하나로 이동
            	 BoardBean bb = (BoardBean)boardList.get(i);
               
               %> 
                 <tbody>
                  <tr>
                    <td><%=bb.getBno() %></td>
                    <td style="text-align: left;">
                    <%
                    	//답글 들여쓰기
                    	int wid = 0;
                    	//답글일 때 - 일반글과 답글 구분 (level)
                    	if(bb.getRe_lev() > 0){
                    		wid = 10*bb.getRe_lev();
                    %>
                    	<img src="level.gif" width="<%=wid%> height="15">
       					<!-- <img src="re.gif"> -->
       					<img src="re.png" width="15px" height="15px">
                    <%
                    	}
                    %>
                   <a href="content.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
                    </td>
                    <td><%=bb.getName() %></td>
                    <td><%=bb.getDate() %></td>
                    <td><%=bb.getReadcount() %></td>
                   </tr> 
                </tbody>
              <%
               }
              %>  
              </table>
              
              <br><br>
              
               <div style="float: left; "> 
			   <a href="writeForm.jsp"><input type="button" class="btn-pr" value="글쓰기" style="font-size:15px;"></a>		
			   	  
		       </div>
			 	 
			  <div style="display: inline-block; font-size:15px;">
			   
			   <%
			 	// 다른 페이지로 이동 버튼 만들기 
			 	if(cnt != 0){
			 		
			 		// 전체 페이지수 
			 		int pageCount = cnt/pageSize + (cnt % pageSize == 0? 0:1);
			 		
			 		// 한 화면에 보여줄 페이지 번호 개수
			 		int pageBlock = 3;
			 		
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
						<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>" class="btn btn-default" style="font-size:15px;">이전</a>
				<% 		
					}
					
					for(int i=startPage;i<=endPage;i++){
			 	%>	
			 			<a href="boardList.jsp?pageNum=<%=i%>" class="btn btn-default" style="font-size:15px;"><%=i %></a>
			 	<%
					}
					
					// [다음] 버튼
					if(endPage < pageCount){
				%>
						<a href ="boardList.jsp?pageNum=<%=startPage+pageBlock%>" class="btn btn-default" style="font-size:15px;">다음</a>
				<% 		
					}
			 	}
			 	%>		
			 	</div>	
		    <br>
            </div>
          </div>
        </div>
       </div>
       <br>
<!-- 게시판 -->		
</div>

<br><br><br><br><br>

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- footer -->


</body>
</html>