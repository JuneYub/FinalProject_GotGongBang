<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	
	
</style>

<script type="text/javascript">

	$(document).ready(function(){		
	
	
 	});
	
</script>

<div id="content">
	<section class="login-related login-related--hide">
		<header class="login-related__header">
		<h2 class="login-related__title">아이디 확인</h2>
		</header>
		<div class="login-related__content">
			<h3 class="login-related__result"><strong class="login-related__description-point"></strong> 회원님의 아이디는 <strong class="login-related__description-point"></strong> 입니다.</h3>
			<p class="login-related__info">가입 시 입력하신 정보는 로그인 후 MY > 내정보에서 확인하실 수 있습니다.</p><a class="login-related__button login-related__button--login button" href="/login">로그인 하기</a>
		</div>
		<p class="login-related__password"><span class="login-related__password-text">비밀번호를 잊으셨나요?</span><a class="login-related__password-link" href="/user/search-pw">비밀번호찾기</a></p>
	</section>
	<div class="modal modal-message modal-message--check modal-message-login">
		<div class="modal__backdrop"></div>
		<div class="modal__dialog">
			<div class="modal__container">
				<h3 class="modal-message__title">인증번호 메일 발송</h3>
				<p class="modal-message__message">메일이 오지 않을 경우 입력한 정보가 올바른지 확인해 주세요.</p>
				<button class="button modal-message__close" type="button">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>