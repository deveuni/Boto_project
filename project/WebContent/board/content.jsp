<%@page import="com.boto.comment.CommentDAO"%>
<%@page import="com.boto.comment.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.boto.board.BoardBean"%>
<%@page import="com.boto.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boto</title>

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

<!-- board -->
	<link href="../css/board2.css" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- board -->

<script src="../js/jquery-3.5.1.min.js"></script>


</head>
<body>


<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

	<%
		// 글 번호에 해당하는 글의 정보를 가져오기 
		
		// 전달된 데이터 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		String filename = request.getParameter("filename");
		//String ofilename = request.getParameter("ofilename"); */
		//String id = (String)session.getAttribute("id");
		String id = (String)request.getAttribute("id");
		String id1 = (String)session.getAttribute("id");
		
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO(); 
		
		// 글의 조회수 정보를 1증가 (updateReadCount(bno)) 
		bdao.updateReadCount(bno);
				
		
		// 글 정보를 가져오는 메서드 생성(getBoard(bno))
		BoardBean bb = bdao.getBoard(bno);
		
		// 화면(테이블)에 출력
	%>

<br><br><br>

<div style="margin-left:15%; margin-right:15%; ">

<!-- 본문 -->
     <div class="row">
        <div class="col">
           <div class="card"> 
            <div class="card-body">
              <h5 class="card-title" style="font-size:40px">Notice of Boto Gallery</h5>
              <br>
              <table class="table">
                <thead>
                  <tr>
                    <th class="bno">No.<%=bb.getBno() %></th>
                    <th class="title"><%=bb.getSubject() %></th>
                    <th class="write"><%=bb.getName() %></th>
                    <th class="date"><%=bb.getDate() %></th>
                    <th class="read"><%=bb.getReadcount() %></th>
                  </tr>
                </thead>
                <tr>
                  <td colspan="5" height="1000px" >
                	<p style="white-space: pre-line;">
	               		<%=bb.getContent() %> 
    	       		</p>
                  </td>
                </tr>
                <tr>
                	<th style="width:100px; height:30px;">첨부파일</th>
                 	<td style="width:500px; height:30px;"> <a href="file_down.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile() %></a></td>
                </tr>
              </table>
            </div>
          </div>
      </div>
      </div>

     
     <!-- 댓글 -->
     <div id="comment" >
        <table border="1" bordercolor="lightgray" style="width:1330;">
   	<!--  댓글 목록 -->   
    	<% 
     		CommentDAO dao = new CommentDAO();
    		ArrayList<CommentBean> commentList = dao.getCommentList(bno); 
    	%>  
    
        <%
		 	for(int i=0;i<commentList.size(); i++){
		 	CommentBean cb =(CommentBean)commentList.get(i);
		 %>  
            <tr>
                <!-- 아이디, 작성날짜 -->
                <td width="150">
                    <div style="text-align:center;">
                        <%=cb.getComment_id() %><br>
                        <font size="2" color="lightgray" ><%=cb.getComment_date() %></font>
                    </div>
                </td>
                <!-- 본문내용 -->
                <td width="550">
                    <div class="text_wrapper">
                        <%=cb.getComment_content() %>
                    </div>
                </td>
                <!-- 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center; padding-top:15px;">
                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->    
                   <%  if(id1.equals(cb.getComment_id())){ %>
                   		<!-- 댓글 수정 -->
                    	 <form action="cmUpdateForm.jsp?pageNum=<%=pageNum %>&bno=<%=bno %>" method="get">
                   			<input type="submit" value="수정" class="btn-pr">
                   		 	<input type="hidden" name="bno" value="<%=bno%>"> 
                   			<input type="hidden" name="comment_num" value="<%=cb.getComment_num()%>"> 
                   			<input type="hidden" name="pageNum" value="<%=pageNum%>">
                   	    </form>   
                        <!-- 댓글 수정 -->
                        
                        <!-- 댓글 삭제 -->
                        <form action ="commentdelPro.jsp?pageNum=<%=pageNum %>&comment_num=<%=cb.getComment_num() %>&bno=<%=bno %>" method="post">
	                        <input type="hidden" name="comment_num" value="<%=cb.getComment_num()%>">
    	                    <input type="hidden" name="comment_board" value="<%=bb.getBno()%>">
        	                <input type="hidden" name="bno" value="<%=bno%>">
                        
            	            <input type="submit"  class="btn-pr" value="삭제">
                        </form>
                         <!-- 댓글 삭제 -->
                    <%} %>     
                    </div>
                </td>
            </tr> 
     <%
	 	}      
	 %>
	 <!-- 댓글 목록 -->	
            
     <!-- 로그인 했을 경우만 댓글 작성가능 -->
     <% if(id1 != null){ %> 
         <tr bgcolor="#F5F5F5">
            <form action="commentPro.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>" id="writeCommentForm" method="post">
                <input type="hidden" name="comment_board" value="<%=bb.getBno()%>">
                <input type="hidden" name="comment_id" value="${sessionScope.id }">
                <td width="150">
                    <div style="text-align:center;">
                        ${sessionScope.id }
                    </div>
                </td>
                <!-- 본문 작성-->
                <td width="550">
                    <div>
                        <textarea name="comment_content" rows="4" cols="70" style="width:1000px;"></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <input type="submit" class="btn-pr" value="댓글쓰기">    
                    </div>
                </td>
            </form>
            </tr>
             <%} %> 
           <!-- 로그인 했을 경우만 댓글 작성가능 -->
        </table>
    </div>
      <!-- 댓글 -->
   
       <br>
       <div class="container" style="float: left;">
		  <div style="float: left;">	
			<a href="boardList.jsp?pageNum=<%=pageNum%>&bno=<%=bno%>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">목록보기</button></a>
		
		
		<input type="button" value="답글쓰기" class="btn btn-primary" style="background-color: lightslategray;"
		     	onclick = "location.href ='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>&pageNum=<%=pageNum%>'">
			 
		<%
			// 아이디랑 작성자가 같을 경우 글수정, 삭제 가능!
			//String id = (String)session.getAttribute("id");
			if( id1 != null && id1.equals(bb.getName())){
		
		%>	
			
			<a href="updateForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">수정하기</button></a>
			<a href="deleteForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>"><button type="button" class="btn btn-primary" style="background-color: lightslategray;">삭제하기</button></a>
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