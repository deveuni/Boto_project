<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.boto.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boto</title>
</head>
<body>


	<%
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
	
		// 페이지번호 정보 처리 
		String pageNum = request.getParameter("pageNum");
		
		
		// 전달받은 파라미터 값 처리 
	%>
		<jsp:useBean id="bb" class="com.boto.board.BoardBean"/>
		<jsp:setProperty property="*" name="bb"/>
		
	<%
		// 글 수정 처리하기 
		
		// BoardDAO 객체 생성 
		BoardDAO bdao = new BoardDAO();
	
		// 글 수정 메소드 호출 - updateBoard(bb)
		int result = bdao.updateBoard(bb);
		
		
		if(result == 1){
	%>
			<script type="text/javascript">
				alert("글수정을 완료하였습니다.");
				location.href = "boardList.jsp?pageNum=<%=pageNum %>";
			</script>
	<% 
		}else if(result == 0){
			
	%>		<script type="text/javascript">
				alert("잘못된 비밀번호 입니다.");
				history.back();
		</script>	
	<%
		}else{
	%>		<script type="text/javascript">
				alert("오류입니다.");
				history.back();		
			</script>
	
	<% 
		}
	%>		
	
	
	 
		
	


</body>
</html>