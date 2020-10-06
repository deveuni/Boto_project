<%@page import="com.boto.member.MemberDAO"%>
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
		// 로그인 처리
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 회원 탈퇴할 아이디의 비밀번호 가져오기 
		String pass = request.getParameter("pass");
		
		// MemberDAO 객체 생성 
		MemberDAO mdao = new MemberDAO();
		
		// 페이징 처리 
		int result = mdao.deleteMember(id, pass);
		
		if(result == 1){
		
		// 회원 아이디값 초기화
		session.invalidate();
	%>
		<script type="text/javascript">
			alert("회원 탈퇴가 완료되었습니다.");
			location.href="../main/main.jsp";
		</script>
	<%
		}else if(result == 0){
	%>
		<script type ="text/javascript">
			alert("잘못된 비밀번호입니다.");
			history.back();
		</script>
	<%
		}else{
	%>	
		<script type ="text/javascript">
			alert("잘못된 아이디입니다.");
			history.back();
		</script>
	<%
		}
	%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





</body>
</html>