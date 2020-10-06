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
		// 로그아웃 페이지
		// 아이디 세션 값 초기화
		session.invalidate();
	%>
	
	<script type="text/javascript">
		//alert("로그아웃");
		location.href = "../main/main.jsp";
	</script>


</body>
</html>