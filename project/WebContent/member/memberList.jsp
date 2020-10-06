<%@page import="com.boto.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.boto.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>


<!-- 헤더 푸터 -->
<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>
<!-- 헤더 푸터 -->




<!-- board -->
<link href="../css/board2.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- board -->




</head>
<body>

<!-- header -->
<jsp:include page="../inc/top.jsp"/>
<!-- header -->

<br><br>


<%
	//로그인 세션 제어 (관리자만 가능)
	String id = (String)session.getAttribute("id");

	if(id == null || !id.equals("boto")){
		response.sendRedirect("loginForm.jsp");
	}
	
	// MemberDAO 객체 생성
	
	MemberDAO mdao = new MemberDAO();
			
	// 회원 목록을 가져오는 메서드 사용 
	ArrayList memberList = mdao.getMemberList();


%>


<!-- 본문 -->
<div style="margin-left:10%; margin-right:10%">
     <div class="row"  >
        <div class="col">
            <div class="card"> 
            <br>
            <div class="card-body" style="text-align: center;">
              <h5 class="card-title" style="font-size:40px">전체 회원 목록</h5>
              <br><br><br>
              <table class="table">
                <thead>
                  <tr>
                    <th class="read">아이디</th>
                    <th class="read">비밀번호</th>
                    <th class="read">이름</th>
                    <th class="read">생년월일</th>
                    <th class="read">성별</th>
                    <th class="read">이메일</th>
                   <th class="read" width="200px">주소</th>
                    <th class="read">번호</th>
                    <th class="read">가입일</th> 
                  </tr>
                </thead>
                
                 <%
	 			for(int i=0;i<memberList.size(); i++){
	 				
	 				MemberBean mb =	(MemberBean)memberList.get(i);
	 				
	 				// 관리자 정보는 안보이게
	 				if(mb.getId().equals("boto")){
	 					continue;
	 				}
				 %>  
                
                <tbody>
                  <tr>
                    <td><%=mb.getId() %></td>
                    <td><%=mb.getPass() %></td>
                    <td><%=mb.getName() %></td>
                    <td><%=mb.getBirth() %></td>
                    <td><%=mb.getGender() %></td>
                    <td><%=mb.getEmail() %></td>
                    <td><%=mb.getAddress() %></td>
                    <td><%=mb.getMobile() %></td>
                    <td><%=mb.getReg_date() %></td> 
                   </tr> 
                </tbody> 
                <%
	 				
                }
                 %>
                </table>
		       </div>
		    <br>
            </div>
          </div>
        </div>
        </div>
                    



<br><br>

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- footer -->








</body>
</html>