<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>

<script>
AOS.init();
	
</script>

<!-- 본문시작 -->
<div id="container">
	<div class="video-theme">
		<video muted autoplay loop>
			<source src="<%= ctxPath%>/resources/img/serviceInfo_bg_movie.mov">
		</video>
		<div class="copywright">
			<p>소중한 물건이니깐<br>
			 장인들에게 맡기세요</p>
		</div>
	</div>
	
	<div class="serviceInfo-text-block">
		<div id="contents">
			<p class="copywright"  data-aos="fade-up" data-aos-duration="1000">
				갗공방은 '가죽'의 옛말인 '갗'을 
				<br>전문적으로 다루는 공방이라는 의미입니다.
				<br> 
				<br>
				저희는 명품 수선을 전문적으로 해온
				<br>다양한 업체들을 고객들에게 소개해드립니다.
			</p>
		</div>
	</div>

	<div class="serviceInfo-text-block-white">
		<div id="contents">
			<p class="copywright"  data-aos="fade-up" data-aos-duration="1000">
				갗공방은 다양한 분야의 전문가분들과 파트너를 맺고 있습니다.<br> 
			</p>
			<ul class="imgList-serviceInfo-intro"  data-aos="fade-up" data-aos-duration="1800">
				<li><div class="img-serviceInfo-intro"><img src="<%= ctxPath%>/resources/img/serviceInfo_laundry.png"></div></li>
				<li><div class="img-serviceInfo-intro"><img src="<%= ctxPath%>/resources/img/serviceInfo_mending.png"></div></li>
				<li><div class="img-serviceInfo-intro"><img src="<%= ctxPath%>/resources/img/serviceInfo_patch.png"></div></li>
			</ul>
		</div>
	</div>

</div>
<!--본문 끝 -->