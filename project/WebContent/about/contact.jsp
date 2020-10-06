<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

	<!-- 헤더푸터 -->
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
	<!-- 헤더푸터 -->
	

	<!-- 지도위 로드뷰 -->
	 <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>
	<!-- 지도위 로드뷰 -->
	
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


	<!-- Header Section -->
	<jsp:include page="../inc/top.jsp"/>
	<!-- Header Section end -->

	
	<br><br><br>
	
	<div style="float:left; margin-left:200px;">
	<br><br>
	<h2>Boto Gallery</h2>
	<br><br>
	
	부산광역시 부산진구 동천로 109 삼한골든게이트 7층<br><br>

	TEL   051-803-0909<br>

	FAX   051-803-0979<br><br>

	MON - FRI 09:00 - 18:30<br>

	SAT       09:00 - 17:00<br><br>
	
	<a href="emailForm.jsp"><input type="button" class="btn-pr" value="Email"></a>
	</div>
	
	
	
	<!-- 지도 -->
	
	<div id="map" style="width:800px;height:500px; margin-left:45%; margin-right:10%; border:1;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bea89507d0ff40b1c47e7c4f45c9e536"></script>
	
	<script>
			 
			 var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			     mapOption = { 
			         center: new kakao.maps.LatLng(35.158587, 129.062049), // 지도의 중심좌표
			         level: 3 // 지도의 확대 레벨
			     }; 

			 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			 // 지도에 마커를 표시합니다 
			 var marker = new kakao.maps.Marker({
			     map: map, 
			     position: new kakao.maps.LatLng(35.158587, 129.062049)
			 });

			 // 커스텀 오버레이에 표시할 컨텐츠 입니다
			 // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			 // 별도의 이벤트 메소드를 제공하지 않습니다 
			 var content = '<div class="wrap">' + 
			             '    <div class="info">' + 
			             '        <div class="title">' + 
			             '            Boto Gallery' + 
			             '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			             '        </div>' + 
			             '        <div class="body">' + 
			             '               <div class="img">' +
			             '                <img src="1.jpg" width="73" height="70">' +
			             '           </div>' +
			             '            <div class="desc">' + 
			             '                <div class="ellipsis">부산 부산진구 동천로 109 7층</div>' + 
			             '                <div class="jibun ellipsis">(우) 47246 (지번) 부전동 112-3</div>' + 
			             '                 <div><a href="http://localhost:8088/project/main/main.jsp" target="_blank" class="link">홈페이지</a></div>' +  
			             '            </div>' + 
			             '        </div>' + 
			             '    </div>' +    
			             '</div>';

			 // 마커 위에 커스텀오버레이를 표시합니다
			 // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			 var overlay = new kakao.maps.CustomOverlay({
			     content: content,
			     map: map,
			     position: marker.getPosition()       
			 });

			 // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			 kakao.maps.event.addListener(marker, 'click', function() {
			     overlay.setMap(map);
			 });

			 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			 function closeOverlay() {
			     overlay.setMap(null);     
			 }
			 </script>	 
	
	<!-- 지도 -->
	
	
	
	<br><br><br>

	
	<!-- Footer Section -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer Section end -->

</body>
</html>