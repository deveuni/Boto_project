<%@page import="com.boto.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
	
	String pageNum = request.getParameter("pageNum");
		// 전달받은 파라미터 값 저장하기 (액션태그 사용)
	%>
	<jsp:useBean id="bb" class="com.boto.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
		System.out.println(bb);
		
		// IP 정보 저장하기
		bb.setIp(request.getRemoteAddr());
		
		// BoardDAO 객체 생성 - reInsertBoard()
		BoardDAO bdao = new BoardDAO();
		bdao.reInsertBoard(bb);
		   
		   
		// 페이지 이동(글 목록)
		response.sendRedirect("boardList.jsp?pageNum="+pageNum);
	
	%>
	



</body>
</html>