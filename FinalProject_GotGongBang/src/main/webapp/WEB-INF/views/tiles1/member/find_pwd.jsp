<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>

<style>

</style>

<script type="text/javascript">

	//=== 회원정보 입력 체크 === //
	let flag_input_id = false;
	let flag_input_email = false;

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
		});// end of $("input#id").blur( (e) => -----------------------------
		
		
		// 이메일주소 blur
		$("input#email").blur( (e) => {
			
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	     	  
	     	const bool = regExp.test($(e.target).val());
			
			// 공백일 때
			if( $(e.target).val().trim() == "") {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_email_f2").hide();
				$(".user_email_f1").show(); // 공백 경고 표시
				
				
				flag_input_email = false;
			}
			// 형식에 맞지 않을 때
			else if(!bool) {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_email_f1").hide();
				$(".user_email_f2").show(); // 공백 경고 표시
				
				flag_input_email = false;
			}
			
			else {
				$("input#email").removeClass("form-input--invalid");
				$(".user_email_f1").hide();
				$(".user_email_f2").hide();
				
				flag_input_email = true;
			}
		});// end of $("input#email").blur( (e) => ---------------------------------
			
			
		// 넘어가는 확인버튼 - 인증번호 비교 
		$(".pwd_button").click(function() {						
			
			// == 이름 공백 입력시 == //
			if( $("input#id").val().trim() == "" ) {
				$("input#id").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_id_f").show(); // 경고 표시
				$("input#id").focus();
				
				return;
			}
			
			// == 이메일 공백 입력시 == //
			if( $("input#email").val().trim() == "" ) {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_email_f1").show(); // 경고 표시
				$("input#email").focus();
				
				return;
			}
			else {
				$.ajax({
					url:"<%= request.getContextPath()%>/confirm_through_id_email.got",
					data:{"id" : $("#id").val(),
						  "email" : $("#email").val()},
					type : "GET",
					success: function(json) {
						var result = JSON.parse(json);
						findId = result.findId; 	// 받은 아이디							
				        
				        if(findId == "") {
				        	alert("일치하는 정보가 없습니다.");
				        }
				        else {				     
				        	findPwdEnd();
				        }				        					
					},
					error: function(request, status, error){
			            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			        }
			}); // end of ajax--------------
				
			}
			
		});//end of $(".pwd_button").click(function() -----------------
		
	});// end of $(document).ready(function()
			
	// 다음 단계로 넘어가기
	function findPwdEnd() {
		window.location.href = "<%= ctxPath%>/find_pwd_end.got";
    }

</script>

<div id="content">
		<section class="login-search">
			<header class="login-search__header">
				<h2 class="login-search__title">비밀번호 찾기</h2>
				<p class="login-search__description">GOTGONGBANG에 등록된 이메일로 비밀번호를 찾을 수 있습니다.</p>
			</header>
			<form class="login-search__form" method="post" action="/user/search-pw-ajax">
				
				<fieldset class="login-search__filedset">

					<div class="form-field">

						<input class="form-input" type="text" id="id" name="id" title="아이디 입력" placeholder="아이디를 입력하세요.">
						<div class="form-field__feedback user_id_f" data-field-feedback="user_name"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;아이디를 입력하세요.</div>
					</div>
					<div class="form-field">

						<input class="form-input" type="email" id="email" name="email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
						<div class="form-field__feedback user_email_f1" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일을 입력해주세요.</div>
						<div class="form-field__feedback user_email_f2" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일 형식이 올바르지 않습니다.</div>						
					</div>
				</fieldset>
				<div class="login-search__buttons"><a class="button button--outline login-search__button login-search__button--cancel" onclick="location.href='<%= ctxPath%>/login.got'">취소</a>
					<button class="button login-search__button login-search__button--confirm pwd_button" type="button">확인</button>
				</div>
			</form>
		</section>
</div>	
			
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>