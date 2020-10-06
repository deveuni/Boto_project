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
		// 로그인 체크
		String id = (String)session.getAttribute("id");
		String pass = request.getParameter("pass");
		String newpass1 = request.getParameter("newpass1");
		String newpass2 = request.getParameter("newpass2");
	
		// 로그인 아닐 시 로그인 페이지로 이동 
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
	
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 파라미터 값을 저장하기
	%>
	
	
	
	<%
	
		MemberDAO mdao = new MemberDAO();
		int check = mdao.updatePass(id, pass, newpass1);
		

		
		// 처리 결과에 따른 페이징 처리
		if(check == 1){//변경
	%>
		<script type="text/javascript">
			alert("비밀번호가 수정되었습니다.");
			location.href="logout.jsp";
		</script>
	
	<%}else if(check == 0){ %>
		<script type="text/javascript">
			alert("잘못된 비밀번호입니다.");
			history.back();
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("잘못된 비밀번호입니다.");
			history.back();
		</script>
	<%} %>	
		
		
		
	
	
	%>
	


</body>
</html>