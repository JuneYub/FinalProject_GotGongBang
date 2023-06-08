<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>
<style>
	
	
</style>

<script type="text/javascript">

	$(document).ready(function(){		
		
		$(".email-check-btn").click(function() {
			let check_input = $("#email_check_number"); // 인증번호 입력하는곳 
			
			if($("#email").val() == "") {
				alert('이메일을 입력하세요.');
				$("#email").focus();
				return;
			}
			
			if(flag_input_email == false) {
				$("#email").focus();
				return;
			}
			
			else if(check_duplicate_email == false) {
				
		    	alert('사용 가능한 이메일입니다. 인증번호를 전송하는 중입니다...');
		    	$.ajax({
						url:"<%= request.getContextPath()%>/member/email_check.got",
						data:{"email" : $("#email").val()},
						type : "GET",
						success: function(data) {
							code = data;
							user_email = $("#email").val();
							console.log("code : " + code);
							check_input.attr('disabled',false);
							alert('인증번호가 전송되었습니다.');
							
						},
						error: function(request, status, error){
				            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				        }
				}); // end of ajax--------------				    	  
			}
		}); // end of $(".email-check-btn").click(function()----------------------
		
		
		// 인증번호 비교 
		$(".login-search__button").click(function() {
			
			let inputCode = $("input#email_check_number").val();
			
			// == 이메일 공백 입력시 == //
			if( $("input#email").val().trim() == "" ) {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_email_f1").show(); // 경고 표시
				
				return;
			}
			// == 인증번호 공백 입력시 == //
			if( $("input#email_check_number").val().trim() == "" ) {
				$("input#email_check_number").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".email_check_number_f").show(); // 경고 표시
				
				return;
			}
				
			if(inputCode != code) {
				//////////////////////인증번호 오류 표시 ///////////////////////////////////
				$("input#email_check_number").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".email_check_number_f").show(); // 경고 표시
				alert("인증번호가 맞지 않습니다.");
				//////////////////////인증번호 오류 표시 ///////////////////////////////////
				
				return;
			}
			else {
				////////////////////// 인증번호 오류 복구 ///////////////////////////////////
				$("input#email_check_number").removeClass("form-input--invalid");
				$(".email_check_number_f").hide();
				
				$("#email_check_number").attr('disabled',true);
				////////////////////// 인증번호 오류 복구 ///////////////////////////////////
				
				alert("인증에 성공하였습니다.");
				
				$(".sign2").removeClass("sign-up__order-item--current");
				$(".sign3").addClass("sign-up__order-item--current");
				
				code = "";
				
				findIdEnd();
			} 
		});//end of $(".btn_next2").click(function()-----------------
	
 	});
	
	function findIdEnd() {
        window.location.href = "<%= ctxPath%>/find_id_end.got";
    }
	
</script>

<div id="content">
	<section class="login-search">
		<header class="login-search__header">
			<h2 class="login-search__title">아이디 찾기</h2>
			<p class="login-search__description">GOTGONGBANG에 등록된 이메일로 아이디를 찾을 수 있습니다.</p>
		</header>
		
		<form class="login-search__form">
			<fieldset class="login-search__filedset">

				<div class="form-field">

					<input class="form-input" type="text" id="name" name="name" title="이름 입력" placeholder="이름을 입력하세요.">
					<div class="form-field__feedback" data-field-feedback="user_name"></div>
				</div>
				<div class="form-field">

					<div class="form-field__group form-field__group--input-button">
						<input class="form-input" type="email" id="email" name="email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
						<button class="button button--outline email-check-btn" type="button">인증번호 받기</button>
					</div>
					<div class="form-field__feedback" data-field-feedback="user_email"></div>
				</div>
				<div class="form-field">

					<input class="form-input" type="text" id="email_check_number" name="auth_code" placeholder="인증번호를 입력하세요.(5분 이내)">
					<div class="form-field__feedback" data-field-feedback="auth_code"></div>
				</div>
			</fieldset>
			<div class="login-search__buttons"><a class="button button--outline login-search__button login-search__button--cancel" onclick="location.href='<%= ctxPath%>/login.got'">취소</a>
				<button class="button login-search__button login-search__button--confirm" type="button">확인</button>
			</div>
		</form>
	</section>
</div>
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>