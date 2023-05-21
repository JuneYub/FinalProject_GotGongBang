<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>

<script>
//=== 스크롤 이벤트 발생시키기 시작 ====
$(window).scroll(function() {
	
	// 스크롤탑의 위치값 
    //console.log( "$(window).scrollTop() => " + $(window).scrollTop() );
	
 	// 보여주어야할 문서의 높이값(더보기를 해주므로 append 되어져서 높이가 계속 증가 될것이다)
	//console.log( "$(document).height() => " + $(document).height() );
 
	// 웹브라우저창의 높이값(디바이스마다 다르게 표현되는 고정값) 
	//console.log( "$(window).height() => " + $(window).height() );

	// 아래는 스크롤 되어진 스크롤 탑의 위치값이 웹브라우저창의 높이만큼 내려갔을 경우를 알아보는 것이다.
	console.log( "$(window).scrollTop() => " + $(window).scrollTop() );
    console.log( "$(document).height() - $(window).height() => " + ( $(document).height() - $(window).height() ) );
	
 	// 아래는 만약에 위의 값이 제대로 안나오는 경우 이벤트가 발생되는 숫자를 만들기 위해서 스크롤탑의 위치값에 +1 을 더해서 보정해준 것이다. 
  	// console.log( "$(window).scrollTop() + 1  => " + ( $(window).scrollTop() + 1  ) );
    // console.log( "$(document).height() - $(window).height() => " + ( $(document).height() - $(window).height() ) ); 

    if( $(window).scrollTop() + 1 >=  $(document).height() - $(window).height() ) {
    	
    	// 만약에 위의 값대로 잘안되면 아래의 것을 하도록한다.
    	// if( $(window).scrollTop() + 1 ) >= $(document).height() - $(window).height() )
    	// alert("기존의 문서가 끝났습니다 이제 추가 문서를 보여드립니다");
								
    }
    
    if( $(window).scrollTop() == 0 ) {
    	// 다시 처음부터 시작하도록 한다.
    	
  
    }
    
});

// === 스크롤 이벤트 발생시키기 끝 ====

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
			<p class="copywright">
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
			<p class="copywright">
				갗공방은 다양한 분야의 전문가분들과 파트너를 맺고 있습니다.<br> 
			</p>
			<ul>
				<li><div class="serInfo-intro-img"><img src="<%= ctxPath%>/resources/img/serviceInfo_laundry.png"></div></li>
				<li><div class="serInfo-intro-img"><img src="<%= ctxPath%>/resources/img/serviceInfo_mending.png"></div></li>
				<li><div class="serInfo-intro-img"><img src="<%= ctxPath%>/resources/img/serviceInfo_patch.png"></div></li>
			</ul>
		</div>
	</div>

</div>
<!--본문 끝 -->