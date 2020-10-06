<%@page import="com.boto.comment.CommentBean"%>
<%@page import="com.boto.comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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




</head>
<body>

	<!-- 댓글 수정  -->

	<%
	
	// 전달되는 정보 가져오기
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	
	CommentDAO dao = new CommentDAO();
	CommentBean cb = dao.getComment(comment_num);
	
	%>


	<div id="wrap" style="text-align:center;">
    <br>
    <b><font size="5" color="gray">댓글수정</font></b><br><br>
    <hr size="1" width="550">
    <br>
 
    <div id="commentUpdateForm">
        <form action="cmUpdatePro.jsp?pageNum=<%=pageNum %>&bno=<%=bno %>" method="get"> 
        	<input type="hidden" name="comment_num" value="<%=comment_num%>"> 
        	<input type="hidden" name="bno" value="<%=bno%>">
        	<input type="hidden" name="pageNum" value="<%=pageNum%>">      
            <textarea rows="7" cols="70" name="comment_content"><%=cb.getComment_content() %></textarea>
            <br><br>
            <input type="submit" class="btn-pr" value="등록">
            <input type="button" class="btn-pr" value="취소" onclick="history.back()">
        </form>
    </div>
	</div>    


</body>
</html>