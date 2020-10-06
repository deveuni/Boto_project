<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Boto </title>

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


<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
 .fade {
   -webkit-animation-name: fade; 
  -webkit-animation-duration: 6000s;
  animation-name: fade;
  animation-duration: 1.5s;
} 

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>


</head>
<body>


	<!-- Header Section -->
	<jsp:include page="../inc/top.jsp"/>
	<!-- Header Section end -->

<br><br><br><br><br>

<div class="slideshow-container">

<div class="mySlides">
  <div class="numbertext">1 / 3</div>
  <img src="1.jpg" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides">
  <div class="numbertext">2 / 3</div>
  <img src="2.jpg" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides">
  <div class="numbertext">3 / 3</div>
  <img src="3.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

<br><br><br>

<div align="center">


<table>
  <tr>
    <td style="font-size:16px;">
	<p>
현재 현대예술의 흐름은 타분야와의 융합을 통해 탈장르화하며 진화하고 있습니다. 과거 전시장 한 편에 <br>
전시된 채, 수동적으로 관람하는 예술이 아닌, 관객과 함께 숨쉬며 완성되는 현대예술은 이제 하나의 단<br>
어로 정의할 수도, 하나의 장소에 정체될 수도 없습니다. 현대예술은 예술가와 작품, 공간과의  다양한 <br>
변화를 시도하며 관객과  소통함으로써 또 하나의 문화를 창조합니다. <br><br>

Boto갤러리는 2015년 북창동에서 개관하여 2019년 역삼동으로 이전 후 현재까지 다양한 전시기획을 통<br>
해 현대미술을 소개해왔습니다. Boto갤러리만의 공간적 특성을 활용하며, 작가 발굴 및 지원으로 예술적 <br>
가치와 경제적 가치를 공유할 수 있는 수평적인 예술시장을 확장시키고자 합니다. 또한 갤러리의 장소성을 <br>
극대화하여 국내외 작가들과 관객이 소통할 수 있는 또 하나의 예술문화공간이 될 것입니다. <br>
<br>
Boto갤러리는 여백의 의미를 부여하고 유희적으로 재해석할 수 있는 잠재적이고 실험적인 공간이 될 수 있으<br>
며 진화된 장소성에  Boto만의 철학을 담고 있습니다. 지속적인 전시기획과 국내외 현대 작가들과 함께하고 <br>
있는 Boto갤러리는 세계적인 컬렉터들과 하나의 문화적인 플랫폼이 되기를 희망합니다. <br>
</p>
</td>
<td></td>
<td style="font-size:14px; color: gray;">
Contemporary art continues to evolve through integration with other fields, <br>
culminating to a cross of genres. In contrast to art that consisted of trad<br>
itional exhibitions and passive viewership of the past, contemporary art com<br>
es to reach maturity and fulfillment through “living” with its audience, and <br>
can no longer be defined in a single word or remain static in one place. Now, <br>
contemporary art attempts various alternations with the artist, the work, and <br>
space and creates a new culture by communicating with its viewers.<br><br>

Boto Gallery based in Seoul, a contemporary art gallery, opened in Bukchang-dong <br>
in 2015 and has moved to Yeoksam-dong since 2019. The gallery has introduced con<br>
temporary art through various exhibitions. By utilizing the spatial characterist<br>
ics of the Gallery, we aim to expand the horizontal art market where artistic an<br>
d economic values can be shared by discovering and supporting contemporary artis<br>
ts from Korea and other countries. The Gallery has been continuously planning ex<br>
hibitions and communicating with audiences and contemporary artists.<br><br>

Boto Gallery can become an experimental space full of boundless potential, where <br>
it breathes meaning into empty spaces and allows for playful reinterpretations. <br>
To such an evolved characteristic of this space, the gallery aims to instill yet <br>
another philosophy unique to Hidden M.  With global collectors, the gallery hope<br>
s to become another cultural platform.<br>

</td>

</tr>


</table>
</div>

<br><br><br><br><br>

	<!-- Footer Section -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- Footer Section end -->



</body>
</html> 