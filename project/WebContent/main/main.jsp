<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Boto</title>
	<meta charset="UTF-8">
	<meta name="description" content="Boto Photo Studio HTML Template">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/slicknav.min.css"/>
	<link rel="stylesheet" href="../css/fresco.css"/>
	<link rel="stylesheet" href="../css/slick.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="../css/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section -->
	<jsp:include page="../inc/top.jsp"/>
	<!-- Header Section end -->

	<!-- Hero Section -->
	<section class="hero__section">
		<div class="hero-slider">
			<div class="slide-item">
				<a class="fresco" href="1.jpg" data-fresco-group="projects">
					<img src="1.jpg" alt="">
				</a>
			</div>
			<div class="slide-item">
				<a class="fresco" href="2.jpg" data-fresco-group="projects">
					<img src="2.jpg" alt="">
					</a>
			</div>
			<div class="slide-item">
				<a class="fresco" href="3.jpg" data-fresco-group="projects">
					<img src="3.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="4.jpg" data-fresco-group="projects">
					<img src="4.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="5.jpg" data-fresco-group="projects">
					<img src="5.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="6.jpg" data-fresco-group="projects">
					<img src="6.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="7.jpg" data-fresco-group="projects">
					<img src="7.jpg" alt="">
				</a>	
			</div>
		</div>
		<div class="hero-text-slider">
			<div class="text-item">
				<h2>Nature</h2>
				
			</div>
			<div class="text-item">
				<h2>Heartbeat</h2>
				
			</div>
			<div class="text-item">
				<h2>Blue Dreem</h2>
				
			</div>
			<div class="text-item">
				<h2>Christian Church</h2>
				
			</div>
			<div class="text-item">
				<h2> Darkness</h2>
			
			</div>
			<div class="text-item">
				<h2>Beauty with Brain</h2>

			</div>
			<div class="text-item">
				<h2>Remarkable</h2>
				
			</div>
		</div>
	</section>
	<!-- Hero Section end -->

	<!-- Footer Section -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer Section end -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!--====== Javascripts & Jquery ======-->
	<script src="../js/vendor/jquery-3.2.1.min.js"></script>
	<script src="../js/jquery.slicknav.min.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/fresco.min.js"></script>
	<script src="../js/main.js"></script>

	</body>
</html>
    