<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Boto | Photography HTML Template</title>
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

	<!-- Blog Page -->
	<section class="blog__page">
		<div class="blog__warp">
			<div class="row blog__grid text-white">
				<div class="col-lg-8 col-xl-9">
					<div class="row">
						<div class="col-md-8 col-lg-7 col-xl-8">
							<div class="blog__item set-bg" data-setbg="18.jpg">
								<div class="blog__content">
									<div class="blog__date">AUG 22, 2020</div>
									<h3><a href="blog-single.jsp">9 Reasons to Buy a 50mm Prime Lens & Skip the Kit Lens</a></h3>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-lg-5 col-xl-4">
							<div class="blog__item set-bg" data-setbg="333.jpg">
								<div class="blog__content">
									<div class="blog__date">DEC 18, 2019</div>
									<h4><a href="blog-single.jsp">Assorted Textures FREE Stock Photos</a></h4>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-lg-5 col-xl-4">
							<div class="blog__item set-bg" data-setbg="666.jpg">
								<div class="blog__content">
									<div class="blog__date">JUN 7, 2020</div>
									<h4><a href="blog-single.jsp">Assorted Textures FREE Stock Photos</a></h4>
								</div>
							</div>
						</div>
						<div class="col-md-8 col-lg-7 col-xl-8">
							<div class="blog__item set-bg" data-setbg="Circulation.jpg">
								<div class="blog__content">
									<div class="blog__date">OCT 22, 2018</div>
									<h3><a href="blog-single.jsp">Improve Your Portrait Photography with These Helpful Tips</a></h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3">
					<div class="blog__item blog__item--long set-bg" data-setbg="path.jpg">
						<div class="blog__content">
							<div class="blog__date">APR 1, 2019</div>
							<h4><a href="blog-single.jsp">Assorted Textures FREE Stock Photos</a></h4>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Blog Page end -->

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
	<script src="../js/main.js"></script>

	</body>
</html>