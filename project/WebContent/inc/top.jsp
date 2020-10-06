<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		// 화면 상단에 부분 
	%>
	
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 col-md-3 order-2 order-sm-1">
					<div class="header__social">
						<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
						<a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a>
						<a href="https://www.instagram.com/?hl=ko"><i class="fa fa-instagram"></i></a>
					</div>
				</div>
				<div class="col-sm-4 col-md-6 order-1  order-md-2 text-center">
					<a href="../main/main.jsp" class="site-logo">
						<img src="../img/logo.png" alt="">
					</a>
				</div>
				  <div class="col-sm-4 col-md-3 order-3 order-sm-3">
					<div class="header__switches">
					
				<%
					String id = (String)session.getAttribute("id");
					if(id != null && id.equals("boto")){
				%>
					<a href="../member/memberList.jsp">회원 전체 목록</a>
				<%
					}
				%>	
					
				<%
					// 로그인 체크 (세션 id 값이 있는지 없는지 확인)
					
					if(id == null){
				%>
					<a href="../member/loginForm.jsp">LOGIN</a> 
					<a href="../member/joinForm.jsp">JOIN</a>
				<%
					}else{
				%>	
					<a href="../member/mypage.jsp">MYPAGE</a>
					
					<a href="../member/logout.jsp">LOGOUT</a>
				<%
					}
				%>	
				
						<a href="#" class="search-switch"><i class="fa fa-search"></i></a>
						<a href="#" class="nav-switch"><i class="fa fa-bars"></i></a>
						
					</div> 
					
					</div>
				
			</div>
			<nav class="main__menu">
				<ul class="nav__menu">
					<li><a href="../main/main.jsp" class="menu--active">Home</a></li>
					<li><a href="../about/about.jsp">About</a>
					<ul class="sub__menu">
							<li><a href="../about/contact.jsp">Contact</a></li>
						</ul>
					</li>
					<li><a href="../gallery/galleryList.jsp">Artists</a></li>
					<li><a href="../exhibition/exhibition.jsp">Exhibition</a>
					</li>
					<li><a href="../board/boardList.jsp">Notice</a></li>
					
				</ul>
			</nav>
		</div>
	</header>