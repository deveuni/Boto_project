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


	<%
	// 전달받은 파라미터 값 저장 
	
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="cb" class="com.boto.comment.CommentBean"/>
	<jsp:setProperty property="*" name="cb"/>
	
	<%
		// 댓글 수정 처리
		
		CommentDAO dao = new CommentDAO();
	
		int result = dao.updateComment(cb);
	
	
		if(result == 1){
			response.sendRedirect("content.jsp?pageNum="+pageNum+"&bno="+bno);
		}
	%>












</body>
</html>