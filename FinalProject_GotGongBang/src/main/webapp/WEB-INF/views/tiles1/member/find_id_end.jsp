<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
%>

<style>
	
	
</style>

<script type="text/javascript">

	$(document).ready(function(){		
	
 	});
	
	// 아이디가 적혀있는 상태로 로그인 단계 넘어가기
	function findIdEnd(id) {
        window.location.href = "<%= ctxPath%>/login_include_id.got?id=" + id;
    }
</script>

<body>
<div id="content">
	<section class="yh_sign-up">
	<fieldset class="sign-up__step">
		<header class="yh_sign-up__header">
			<h2 class="sign-up__title">아이디 확인</h2>
		</header>				
			<div class="sign-up__step-header">			
			<div class="css-j7qwjs e1hbznyv0">
			<h2 class="css-1ljdbip ey8vk260">GOTGONGBANG에서 어떤 아이디를<br>찾고 계신가요?</h2>
			<p class="css-bnp71o e1hbznyv1">가입 시 입력하신 정보는 로그인 후 MY > 내정보에서 확인하실 수 있습니다.
			
			<div class="css-1imsxus e1hbznyv3" style="margin-top: 40px;">일반 회원으로 가입되어진 아이디</div>
			
			<c:if test="${not empty memberId}">
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb  eklkj752" onclick="findIdEnd('${memberId}')">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751"><strong class="login-related__description-point"></strong> 회원님의 아이디는 <strong class="login-related__description-point">${memberId}</strong> 입니다.</span>
			</button>
			</c:if>
			
			<c:if test="${empty memberId}">
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb  eklkj752">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751"><strong class="login-related__description-point"></strong> 회원님의 등록된 아이디가 없습니다.</span>
			</button>
			</c:if>
			
			
			<h2 style="height: 15px;"></h2>
								
								
			<div class="css-1imsxus e1hbznyv3">공방(PARTNER) 회원으로 가입되어진 아이디</div>
			
			<c:if test="${not empty partnerId}">
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb eklkj752" onclick="findIdEnd('${partnerId}')">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751"><strong class="login-related__description-point"></strong> 회원님의 아이디는 <strong class="login-related__description-point">${partnerId}</strong> 입니다.</span>
			</button>
			</c:if>
			
			<c:if test="${empty partnerId}">
			<button type="button" color="yellow" class="e1hbznyv4 css-xxlgyb eklkj752">
				<span class="button__start-icon-wrapper">
					<span role="img" color="#e4e5ed" rotate="0" class="css-nh621w e181xm9y1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
						</svg>
					</span>
				</span>
				<span class="css-1oteowz eklkj751"><strong class="login-related__description-point"></strong> 회원님의 등록된 아이디가 없습니다.</span>
			</button>
			</c:if>
				
			</div>
			</div>
		<div class="sign-up__step-buttons" style="display: grid;">
		<a class="login-related__button login-related__button--login button" href="<%= ctxPath%>/login.got">로그인 하기</a>
		<p class="login-related__password"><span class="login-related__password-text">비밀번호를 잊으셨나요?</span><a class="login-related__password-link" href="<%= ctxPath%>/find_pwd.got">비밀번호찾기</a></p>
		</div>
		</fieldset>
	</section>
</div>
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>

</body>