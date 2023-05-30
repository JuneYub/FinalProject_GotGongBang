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

	let Flag1 = false, Flag2 = false, Flag3 = false, Flag4 = false, Flag5 = false;	// 버튼확장 체크
	
	// === 회원정보 입력 체크 === //
	let flag_input_name = false;
	let flag_input_phone = false;
	let flag_input_email = false;
	let flag_input_id = false;
	let flag_input_passwd = false;
	let flag_input_passwd_check = false;
	let id_check = false;
	let flag_input_birth = false;
	// === 회원정보 입력 체크 === //
	
	// === 이메일 인증번호 입력 체크 === //
	let code = "";
	
	// === 사용자가 작성한 이메일 === //
	let user_email = "";
	
	// 버튼 클릭시 자동적으로 상단스크롤
	function topScrollFunction() {
		  
		  window.scrollTo({top:0, behavior:'smooth'});
	}
	
	
	$(document).ready(function(){
	
		/* 네번째 화면 버튼 */
		// 보내기 버튼
     	<%-- $("button#yh_button").click(function(){
		// 폼(form)을 전송(submit)
            const frm = document.addFrm;
            frm.method = "post";
            frm.action = "<%= ctxPath%>/addEnd.action";
            frm.submit();
		/* 네번째 화면 버튼 */
     	} --%>
	
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
				</div>
				<div class="sign-up__step-body">
					<div class="sign-up__complete-content">
						<h4 class="sign-up__complete-title">회원정보</h4>
						<dl class="sign-up__complete-list">
							<dt class="sign-up__complete-term">아이디</dt>
							<dd class="sign-up__complete-description" data-field-complete="user_id"></dd>
							<dt class="sign-up__complete-term">사용자 이름</dt>
							<dd class="sign-up__complete-description" data-field-complete="user_name"></dd>
							<dt class="sign-up__complete-term">휴대전화번호</dt>
							<dd class="sign-up__complete-description" data-field-complete="user_phone"></dd>
							<dt class="sign-up__complete-term">이메일 주소</dt>
							<dd class="sign-up__complete-description" data-field-complete="user_email"></dd>
						</dl>
					</div>
				</div>
				<div class="sign-up__step-body">
					<div class="sign-up__complete-content">
						<h4 class="sign-up__complete-title">회사정보</h4>
						<dl class="sign-up__complete-list">
							<dt class="sign-up__complete-term">회사명</dt>
							<dd class="sign-up__complete-description" data-field-complete="company_name"></dd>
							<dt class="sign-up__complete-term">대표자명</dt>
							<dd class="sign-up__complete-description" data-field-complete="ceo_name"></dd>
							<dt class="sign-up__complete-term">사업자등록번호</dt>
							<dd class="sign-up__complete-description" data-field-complete="company_regNo"></dd>
						</dl>
					</div>
				</div>
				<div class="sign-up__step-buttons"><a class="sign-up__step-button button" href="<%= ctxPath%>/login.got">로그인하기</a></div>
			</div>
			<form class="sign-up__success" method="post" action="/user/sign-up-result">
				<input type="hidden" name="user_id">
				<input type="hidden" name="_csrf" value="3886e5ea-8f5a-4bb8-a876-37a0622cc718">
			</form>
			
			<form class="js-form-self-certify" method="post" action="/self-certify">
				<input type="hidden" name="user_email">
				<input type="hidden" name="_csrf" value="3886e5ea-8f5a-4bb8-a876-37a0622cc718">
				<input type="hidden" name="return_url" value="https://www.GOTGONGBANG.im/self-certify/return">
				<input type="hidden" name="cancel_url" value="https://www.GOTGONGBANG.im/self-certify/cancel">
			</form>
		</section>
</div>
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>
    <!--본문 끝 -->

</body>
</html>