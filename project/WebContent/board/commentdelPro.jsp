<%@page import="com.boto.comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 댓글 삭제 처리 -->

	<%
		
		// 한글처리
    	request.setCharacterEncoding("UTF-8");
	
		// 전달되는 데이터 처리 bno,passwd,pageNum
		String pageNum = request.getParameter("pageNum");
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
	
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int bno = Integer.parseInt(request.getParameter("bno"));
	
		// CommentDAO 객체 생성
		CommentDAO dao = new CommentDAO();
	
		
		int result = dao.deleteComment(comment_num);
	
	
		if(result == 1){
			response.sendRedirect("content.jsp?pageNum="+ pageNum +"&bno="+bno);
		}
	
	%>

</body>
</html>