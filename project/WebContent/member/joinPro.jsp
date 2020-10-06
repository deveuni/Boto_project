
<%@page import="com.boto.member.MemberDAO"%>
<%@page import="java.sql.Date"%>
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
		// 한글 처리하기 
		request.setCharacterEncoding("UTF-8");
		
		// 액션태그로 전달되는 정보 저장하기 
	%>
	
	<jsp:useBean id="mb" class="com.boto.member.MemberBean" />
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		// 날짜정보 저장하기
		mb.setReg_date(new Date(System.currentTimeMillis()));
	
		// MemberDAO 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		// 회원가입 메서드
		mdao.insertMember(mb);
	
	%>
	
	<script type="text/javascript">
	
		var tmp = confirm("회원가입 완료되었습니다. 로그인 페이지로 이동하시겠습니까?");
	
		if(tmp == true){
			location.href = "loginForm.jsp";
		}else{
			location.href = "../main/main.jsp";
		}
	
	</script>






</body>
</html>