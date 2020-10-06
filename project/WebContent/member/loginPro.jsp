<%@page import="com.boto.member.MemberDAO"%>
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
		// 한글 처리 
		request.setCharacterEncoding("UTF-8");

		// 전달된 파라미터 정보 저장하기 
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
	
		// MemberDAO 객체 생성 
		MemberDAO mdao = new MemberDAO();
	
		// 로그인 체크하는 메서드 - idCheck(id,pass)
		int check = mdao.idCheck(id, pass);
	
		// 페이징 처리 
		if(check == 1){
			// 로그인 성공
			// 아이디값을 세션 객체에 저장
			session.setAttribute("id", id);
		
			// 로그인 성공 시 메인페이지로 이동 
			response.sendRedirect("../main/main.jsp");
		}else if(check == 0){
	%>
			<script type="text/javascript">
				alert("잘못된 비밀번호입니다.");
				history.back();
			</script>
	<% 		
		}else{ // check == -1;
	%>
			<script type="text/javascript">
				alert("가입하지 않은 아이디입니다.");
				history.back();
			</script>
	<% 		
		}
	%>




</body>
</html>