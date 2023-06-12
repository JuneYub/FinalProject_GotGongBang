<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>

<style>

</style>

<script type="text/javascript">

	let flag_input_id = false;

	$(document).ready(function(){
		
		// 모든 경고표시
		$(".form-field__feedback").hide();
		
		//아이디 blur
		$("input#id").blur( (e) => {
			
			if($(e.target).val().trim() == "") {
				$("input#id").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_id_f").show(); // 경고 표시
				
				flag_input_id = false;
			}
			else {
				$("input#id").removeClass("form-input--invalid");
				$(".user_id_f").hide();
				
				flag_input_id = true;
			}
		});// end of 
		
	});


</script>

<div id="content">
		<section class="login-search">
			<header class="login-search__header">
				<h2 class="login-search__title">비밀번호 찾기</h2>
				<p class="login-search__description">GOTGONGBANG에 등록된 이메일로 비밀번호를 찾을 수 있습니다.</p>
			</header>
			<form class="login-search__form" method="post" action="/user/search-pw-ajax">
				<input type="hidden" name="_csrf" value="29fe7da9-4dea-47a5-a8d5-13c191f69ebf">
				<fieldset class="login-search__filedset">

					<div class="form-field">

						<input class="form-input" type="text" id="id" name="id" title="아이디 입력" placeholder="아이디를 입력하세요.">
						<div class="form-field__feedback user_id_f" data-field-feedback="user_name"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;아이디를 입력하세요.</div>
					</div>
					<div class="form-field">

						<input class="form-input" type="email" name="email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
						<div class="form-field__feedback" data-field-feedback="user_email"></div>
					</div>
				</fieldset>
				<div class="login-search__buttons"><a class="button button--outline login-search__button login-search__button--cancel" href="/login">취소</a>
					<button class="button login-search__button login-search__button--confirm" type="submit">확인</button>
				</div>
			</form>
		</section>
</div>	
			
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>