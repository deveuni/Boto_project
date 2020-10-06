<%@page import="com.boto.member.MemberBean"%>
<%@page import="com.boto.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Boto </title>
	<meta charset="UTF-8">
	<meta name="description" content="Boto Photo Studio HTML Template">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/> 
	<!--  <link rel="stylesheet" href="../css/update.css"/>  -->


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
	<!-- 버튼 -->
	<style type="text/css">

  .btn-pr {
  
  		display: inline-block;
  		font-weight: 400;
 		text-align: center;
  		white-space: nowrap;
  		vertical-align: middle;
 		user-select: none;
  		border: 1px solid transparent;
  		background-color: lightslategray !important;
    	padding: .375rem .75rem;
    	font-size: 1rem;
    	line-height: 1.5;
    	border-radius: .25rem;
    	color: #fff !important;
  }
</style>
	<!-- 버튼 -->
	
	
	
	
	

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section -->
	<jsp:include page="../inc/top.jsp"/>
	<!-- Header Section end -->
	
	
	<%
		// 로그인 세션
		String id = (String)session.getAttribute("id");
	
		// 로그인 안되어있으면 로그인 페이지로 이동
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		// MemberDAO 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		// 해당 아이디의 회원정보 가져오는 메서드를 MemberBean 객체에 대입
		MemberBean mb = mdao.getMember(id);
		
	%>
	
	<!-- Contact Page -->
	<section class="contact__page">
		<div class="contact__warp">
		 	<div class="row">
				<div class="col-md-6">
					<h2 style="weight:50;">회원 정보 수정</h2>
				</div>
				<br><br><br>
				
			</div> 
			<form action="updatePro.jsp" method="post"  class="contact__form">		
				<label>User ID </label>
				<input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
				<label>Password </label>
				<input type="password" name="pass" placeholder="Password">
				
				<label>Name </label>
				<input type="text" name="name" value="<%=mb.getName() %>">
				<label>Email </label>
				<input type="text" name="email" value="<%=mb.getEmail() %>" >
				<label>Birth </label>
				<input type="text" name="birth" value="<%=mb.getBirth() %>">
				<label>Gender </label>
				<input type="radio" name="gender" value="남"
				<% if(mb.getGender().equals("남")){ %>
	 				checked
	 				<% } %>
	 				style="width:50px; height:25px">남
	 			 <input type="radio" name ="gender" value="여"
	 			 	<% if(mb.getGender().equals("여")){ %>
	 				checked
	 				<% } %> 
	 			 style="width:50px; height:25px">여<br>  
				<label>Address </label><br>
				<input type="text" id="postcode" name="postcode" value="<%=mb.getPostcode() %>" style="width:120px; display:inline-block;">
				<input type="button" onclick="Postcode()" class="btn-pr" value="우편번호 찾기" style="width:120px; margin-bottom:0px; padding:0px 0px; !important;"><br><br>
				<input type="text" id="address" name="address"  value="<%=mb.getAddress()%>" style="margin-top:1px;"><br>
				<input type="text" id="detailAddress" name="detailAddress" value="<%=mb.getDetailAddress() %>" style="width:230px; display:inline-block;">
				<input type="text" id="extraAddress" name="extraAddress" value="<%=mb.getExtraAddress() %>" style="width:230px; display:inline-block;">
				<br>
				<label>Phone Number </label>
				<input type="text" name="phone" value="<%=mb.getPhone() %>">
				<label>Mobile Phone Number </label>
				<input type="text" name="mobile" value="<%=mb.getMobile()%>" >
				
				<input type="submit" value="수정하기" class="btn-pr" style="background-color: lightslategray; width:120px;">
			</form>
		</div>
	</section>
	<!-- Contact Page end -->

	<!-- Footer Section -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer Section end -->


	<!-- 우편번호 검색 -->
      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
      <!-- 우편번호 검색 -->

	<!--====== Javascripts & Jquery ======-->
	<script src="../js/vendor/jquery-3.2.1.min.js"></script>
	<script src="../js/jquery.slicknav.min.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/main.js"></script>

	</body>
</html>
    