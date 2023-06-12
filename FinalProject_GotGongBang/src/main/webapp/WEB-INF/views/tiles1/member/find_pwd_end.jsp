<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>

<div id="content">
		<section class="login-search">
			<header class="login-search__header">
				<h2 class="login-search__title">비밀번호 찾기</h2>
				<p class="login-search__description">GOTGONGBANG에 등록된 이메일로 비밀번호를 찾을 수 있습니다.</p>
			</header>
			<form class="login-search__form" method="post" action="/user/search-pw-ajax">				
				<fieldset class="login-search__filedset">
					<div class="form-field">
						<input class="form-input" type="text" name="user_id" title="아이디 입력" placeholder="아이디를 입력하세요.">
						<div class="form-field__feedback" data-field-feedback="user_id"></div>
					</div>
					<div class="form-field">

						<input class="form-input" type="email" name="user_email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
						<div class="form-field__feedback" data-field-feedback="user_email"></div>
					</div>
				</fieldset>
				<div class="login-search__buttons"><a class="button button--outline login-search__button login-search__button--cancel" href="/login">취소</a>
					<button class="button login-search__button login-search__button--confirm" type="submit">확인</button>
				</div>
			</form>
		</section>
		<section class="login-related login-related--hide">
			<header class="login-related__header">
				<h2 class="login-related__title">비밀번호 재설정</h2>
			</header>
			<div class="login-related__content">
				<h3 class="login-related__result"><strong class="login-related__description-point"></strong> 계정에 등록된 메일주소로 <br> <strong class="login-related__description-point">비밀번호 재설정</strong>을 위한 이메일이 발송되었습니다.</h3>
				<p class="login-related__info">가입 시 입력하신 정보는 로그인 후 MY > 내정보에서 확인하실 수 있습니다.</p><a class="button login-related__button login-related__button--home" href="/">홈으로 이동</a>
			</div>
		</section>
		<div class="modal modal-message modal-message--alert">
			<div class="modal__backdrop"></div>
			<div class="modal__dialog">
				<div class="modal__container">
					<h3 class="modal-message__title"></h3>
					<p class="modal-message__message"></p>
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