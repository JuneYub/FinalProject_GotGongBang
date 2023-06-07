<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   String ctxPath = request.getContextPath();
%>   


<style>
	
	
	
	    
</style>

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	
	
	
	
	$(document).ready(function(){
	
	}
	
	// 버튼 클릭시 자동적으로 상단스크롤
	function topScrollFunction() {
		  
		  window.scrollTo({top:0, behavior:'smooth'});
	}
	
</script>

<body>

    <!-- 회원가입 폼 본문시작 -->
<div id="content">
		<section class="yh_sign-up">
			<header class="yh_sign-up__header">
				<h2 class="sign-up__title">회원가입</h2>
				<ol class="sign-up__order">
					<li class="sign-up__order-item sign1"><span class="sign-up__order-index">01</span><span class="sign-up__order-menu">이용약관</span></li>
					<li class="sign-up__order-item sign2"><span class="sign-up__order-index">02</span><span class="sign-up__order-menu">이메일 인증</span></li>
					<li class="sign-up__order-item sign3"><span class="sign-up__order-index">03</span><span class="sign-up__order-menu">회원정보 입력</span></li>
					<li class="sign-up__order-item sign4 sign-up__order-item--current"><span class="sign-up__order-index">05</span><span class="sign-up__order-menu">가입완료</span></li>
				</ol>
			</header>
			
				
<!-- =====================================  4 ================================================= -->				
				
			<div class="sign-up__step step4">
				<div class="sign-up__step-header">
					<h3 class="sign-up__step-title sign-up__step-title--complete">
						회원가입이 완료되었습니다.<br>
						<strong class="sign-up__step-title--point">메일로 발송된 보안키</strong>로 상품이용이 가능합니다.
					</h3>
					<br>
					<h4 style="font-size: 11pt;">회원님은 GOTGONGBANG의 모든 기능을 사용하실 수 있습니다.</h4>
				</div>
				<div class="sign-up__step-buttons"><a class="sign-up__step-button button" href="<%= ctxPath%>/login.got">로그인하기</a></div>
			</div>
		</section>
</div>
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>
    <!--본문 끝 -->

</body>