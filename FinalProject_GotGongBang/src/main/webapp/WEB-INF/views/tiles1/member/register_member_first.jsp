<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>

<style>
	.css-1imsxus {
	    margin-bottom: 12px;
	    font-size: 15px;
	    font-weight: 500;
	    color: #555969;
	}
	
	.css-xxlgyb {
	    outline: none;
	    border-width: 1px;
	    border-style: solid;
	    box-sizing: border-box;
	    border-radius: 4px;
	    line-height: 1;
	    font-weight: 500;
	    -webkit-transition: background-color 0.3s,border-color 0.3s;
	    transition: background-color 0.3s,border-color 0.3s;
	    -webkit-text-decoration: none;
	    text-decoration: none;
	    -webkit-tap-highlight-color: transparent;
	    display: -webkit-inline-box;
	    display: -webkit-inline-flex;
	    display: -ms-inline-flexbox;
	    display: inline-flex;
	    -webkit-align-items: center;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    -ms-flex-pack: center;
	    -webkit-justify-content: center;
	    justify-content: center;
	    cursor: pointer;
	    position: relative;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    white-space: nowrap;
	    max-width: 100%;
	    width: 100%;
	    min-width: 100%;
	    max-width: 100%;
	    height: 36px;
	    font-size: 14px;
	    padding: 0 16px;
	    min-width: 64px;
	    background-color: #fff;
	    border-color: #fae57c;
	    color: #303441;
	    padding: 16px;
	    -webkit-box-pack: start;
	    -ms-flex-pack: start;
	    -webkit-justify-content: flex-start;
	    justify-content: flex-start;
	    height: -webkit-fit-content;
	    height: -moz-fit-content;
	    height: fit-content;
	    border-color: #e4e5ed;
	}
	
	.css-xxlgyb:hover {
		
		background-color: #e6e6ff;
		border-color: #ccccff;
		
	}
</style>

 
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
				<li class="sign-up__order-item sign4"><span class="sign-up__order-index">04</span><span class="sign-up__order-menu">가입완료</span></li>
			</ol>
		</header>
		
		<fieldset class="sign-up__step step1">
			<div class="sign-up__step-header">			
			<div class="css-j7qwjs e1hbznyv0">
			<h2 class="css-1ljdbip ey8vk260">GOTGONGBANG에서 어떤 서비스를<br>이용하고 싶으세요?</h2>
			<p class="css-bnp71o e1hbznyv1">원하는 회원가입 유형을 선택하세요.
			
			<div class="css-1imsxus e1hbznyv3">서비스를 의뢰하고 싶다면</div>
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb  eklkj752" onclick="location.href='<%= ctxPath%>/register_member.got'">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751">일반회원으로 가입</span>
			</button>
			
			<h2 style="height: 15px;"></h2>
								
			<div class="css-1imsxus e1hbznyv3">내 전문성을 판매하고 싶다면</div>
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb eklkj752" onclick="">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751">공방(PARTNER)회원 가입</span>
			</button>
			
		</div>
		</div>
		
	</section>
</div>

</body>