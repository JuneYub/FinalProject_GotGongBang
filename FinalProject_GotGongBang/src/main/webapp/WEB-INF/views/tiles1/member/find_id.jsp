<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>
<style>
	.login-search {
    	margin: 0 auto;
    	padding-bottom: 200px;
    	width: 588px;
	}
</style>

<div id="content">
		<section class="login-search">
			<header class="login-search__header">
				<h2 class="login-search__title">아이디 찾기</h2>
				<p class="login-search__description">HYPHEN에 등록된 이메일로 아이디를 찾을 수 있습니다.</p>
			</header>
			<form class="login-search__form" method="post" action="/user/search-id-ajax">
				<input type="hidden" name="_csrf" value="3b981f99-60cf-4efb-a9a4-aac4fbb8b58c">
				<input type="hidden" name="auth_type" value="SI">
				<fieldset class="login-search__filedset">
					<legend class="login-search__legend">아이디 찾기</legend>
					<div class="form-field">
						<h3 class="form-field__title form-field__title--hidden">이름</h3>
						<input class="form-input" type="text" name="user_name" title="이름 입력" placeholder="이름을 입력하세요.">
						<div class="form-field__feedback" data-field-feedback="user_name"></div>
					</div>
					<div class="form-field">
						<h3 class="form-field__title form-field__title--hidden">이메일</h3>
						<div class="form-field__group form-field__group--input-button">
							<input class="form-input" type="email" name="user_email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
							<button class="button button--outline" type="button">인증번호 받기</button>
						</div>
						<div class="form-field__feedback" data-field-feedback="user_email"></div>
					</div>
					<div class="form-field">
						<h3 class="form-field__title form-field__title--hidden">인증번호</h3>
						<input class="form-input" type="text" name="auth_code" placeholder="인증번호를 입력하세요.(5분 이내)">
						<div class="form-field__feedback" data-field-feedback="auth_code"></div>
					</div>
				</fieldset>
				<div class="login-search__buttons"><a class="button button--outline login-search__button login-search__button--cancel" onclick="location.href='<%= ctxPath%>/login.got'">취소</a>
					<button class="button login-search__button login-search__button--confirm" type="submit">확인</button>
				</div>
			</form>
		</section>
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