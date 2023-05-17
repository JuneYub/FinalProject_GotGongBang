<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갗공방</title>
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/main.css">
	
	<!-- Font Awesome 5 Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	  
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	<script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 
	  
	<%--  ===== 스피너 및 datepicker 를 사용하기 위해  jquery-ui 사용하기 ===== --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css" />
	<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	
	<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
	<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>
	<link
	  rel="stylesheet"
	  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
	/>
	
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	
    <script>
    
    
    $(document).ready(function() {
    	$("div.circle-purple").css('opacity','0');
    	$("div.circle-white").css('opacity','0');
    	$("div.container-botton-copy").css('opacity','0');
    	// === 스크롤 이벤트 발생시키기 시작 ====
		$(window).scroll(function() {
			// 스크롤탑의 위치값 
		    //console.log( "$(window).scrollTop() => " + $(window).scrollTop() );
			
	        if( $(window).scrollTop() >= 270 ) {
				$("div.circle-purple").addClass('fade-in-1s');	
				$("div.circle-white").addClass('fade-in-1s');
	        }
	        if( $(window).scrollTop() >= 280 ) {
				$("div.container-botton-copy").addClass('fade-in');
	        }
		});
    	
		const swiper = new Swiper('.swiper', {
			  // Optional parameters
			  direction: 'horizontal',
			  loop: false,
		      slidesPerView: 3,
		      spaceBetween: 30,

			  // If we need pagination
			  pagination: {
			    el: '.swiper-pagination',
			    clickable:true,
			  },

			  // Navigation arrows
			  navigation: {
			    nextEl: '.swiper-button-next',
			    prevEl: '.swiper-button-prev',
			  },

			});
		
    	
    });
    
    </script>
</head>
<body>

     <!-- headr 시작 -->

    <div id="header">
        <section class="header-section">
            <div class="h1-logo">
                <h1>갗공방</h1>
            </div>
            <div class="header-nav">
                <ul>
                    <li>
                        <a class="header-nav-button">서비스 소개</a>
                    </li>
                    <li>
                        <a class="header-nav-button">수선사 찾기</a>
                    </li>
                    <li>
                        <a class="header-nav-button">견적 의뢰</a>
                    </li>
                    <li>
                        <a class="header-nav-button">문의하기</a>
                    </li>
                </ul>
                
                
                
                
            </div>

            <div class="header-member-box">
                <ul class="header-member-contents">
                    <li>
                        <a>
                          	  회원가입
                        </a>
                        <span class="txt_bar"></span>
                    </li>
                    <li>
                        <a>
                           	 로그인
                        </a>
                    </li>
                </ul>
            </div>
        </section>
    </div>

     <!-- header 끝 -->

    <!-- 본문시작 -->
    <div id="container">
        <div class="circle-purple"></div>
        <div class="circle-white"></div>
        <section>
	        <div class="container-top-animator-background">
	            <div class="container-top-copy fade-in">
	                <p>Premium Repair Services</p>
	                <p>to restore original glory</p>
	            </div>
	        </div>
	
	        <div class="container-bottom-animator-background">
	            <div class="container-botton-copy">
	                <p>내게 맞는</p>
	                <p>명품 수선사를 찾다</p>
	            </div>
	        </div>
        </section>
        
        <div id="contents">
			<p id="contents-prolist-promotional-msg">지금 바로 전문가를 찾아보세요</p>
			
			<!-- Slider main container -->
			  <div class="swiper mySwiper">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">Slide 1</div>
			      <div class="swiper-slide">Slide 2</div>
			      <div class="swiper-slide">Slide 3</div>
			      <div class="swiper-slide">Slide 4</div>
			      <div class="swiper-slide">Slide 5</div>
			      <div class="swiper-slide">Slide 6</div>
			      <div class="swiper-slide">Slide 7</div>
			      <div class="swiper-slide">Slide 8</div>
			      <div class="swiper-slide">Slide 9</div>
			    </div>
				<div class="swiper-pagination"></div>

			</div>
		


			
			
        </div>

    </div>
    <!--본문 끝 -->

     <!-- footer 시작 -->
    <div id="footer">
        <div class="footer-container">
            <div class="footer-company-info">
                <div class="footer-company-email">
                    <p>Email</p>
                    <p>test@naver.com</p>
                </div>
                <div class="footer-company-name">
                    <p>GodGongBang</p>
                </div>
            </div>
            <div class="copyright-left">
                <p>COPYRIGHT ©  finalProject Team Name. ALL RIGHTS RESERVED</p>
            </div>
        </div>
    </div>
    
     <!-- footer 끝 -->
</body>
</html>