<%@page import="com.boto.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

<link href="../css/join.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body {text-align: center;}

</style>


</head>
<body>
	
	<br><br>
	<%
		// 아이디 중복 체크를 하기 위해 받아온 ID값 출력
		String id = request.getParameter("userid");
	
		// MemberDAO 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		// 아이디 중복 체크 메서드 - joinIdCheck(id);
		int check = mdao.joinIdCheck(id);
		
		if(check == 1){
			out.print("사용 가능한 아이디 입니다.");
	%>
		<input type="button" value="아이디 사용하기" class="btn btn-secondary" onclick="result();">
	
	<%
		}else if(check == 0){
			out.print("사용 불가능한 아이디 입니다.");
		}else{
			out.print("에러발생");
		}
	
	%>
	
	
	<fieldset>
       <form action="joinIdCheck.jsp" method="post" name="wfr">
            <br><br><label>User ID</label>
               <input type="text" name="userid" value="<%=id%>">
               <input type="submit" value="중복확인" class="btn btn-secondary"><br><br>
	   </form>
	</fieldset>
	
	
	<script type="text/javascript">
	
	function result(){
		// 중복확인창에 있는 아이디 정보를 회원가입창으로 전달하기
		opener.document.fr.id.value = document.wfr.userid.value;
		
		// 회원가입창 제어 
		opener.document.fr.id.readOnly = true;
		
		// 창닫기
		window.close();
	}
	
	

		
	
	
	
	</script>
	
	
</body>
</html>