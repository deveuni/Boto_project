<%@page import="java.util.ArrayList"%>
<%@page import="com.boto.comment.CommentDAO"%>
<%@page import="com.boto.comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 댓글 입력 처리  -->

	<%
	
		// 한글 처리 
		request.setCharacterEncoding("UTF-8");
	
		// 넘어온 정보 저장
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
		String comment_id = request.getParameter("comment_id");
		String comment_content = request.getParameter("comment_content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
	
	%>
		<jsp:useBean id="cm" class="com.boto.comment.CommentBean"/>
		<jsp:setProperty property="*" name="cm"/>

	<%
	
		CommentBean comment = new CommentBean();
		CommentDAO dao = new CommentDAO();
	
		comment.setComment_board(comment_board);
		comment.setComment_id(comment_id);
		comment.setComment_content(comment_content);
	
		boolean result = dao.insertComment(comment);
	
	 	if(result){
			response.sendRedirect("content.jsp?pageNum="+ pageNum +"&bno="+bno);
		}
	
	%>
	
	
</body>
</html>