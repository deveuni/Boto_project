<%@page import="com.boto.gallery.GalleryDAO"%>
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
		// 전달되는 데이터 처리 bno,passwd,pageNum
		String pageNum = request.getParameter("pageNum");
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pass = request.getParameter("pass");
	
		// DAO 처리객체 -> deleteBoard(글번호, 비밀번호)
		GalleryDAO gdao = new GalleryDAO();
	
		int result = gdao.deleteGallery(bno, pass);
	
		// 페이징 처리
	
		if(result == 1){
	
	%>
			<script type= "text/javascript">
				alert("삭제를 완료하였습니다.");
				location.href="galleryList.jsp?pageNum=<%=pageNum%>";
			</script>	
	<%
		}else if(result == 0){	
	%>	
			<script type= "text/javascript">
				alert("잘못된 비밀번호입니다.");
				history.back();
			</script>
	<%
		}else{
	%>	
			<script type= "text/javascript">
				alert("오류.");
				history.back();
			</script>
	<%
		}
	%>	
		
		
		
		
		
		
		
		
		
		
		
		


</body>
</html>