<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>
<style>
	.form-input {
		margin-bottom: 10px;
	}
	
</style>

<script type="text/javascript">
	
	//=== 이메일 인증번호 입력 체크 === //
	var memberId = ""; 	// 받은 일반회원 아이디
	var partnerId = "";	// 받은 공방회원 아이디
	let code = "";
	
	// === 회원정보 입력 체크 === //
	let flag_input_name = false;
	let flag_input_email = false;
	
	// === 인증번호 받기 눌렀는지 체크 === //
	let check_duplicate_email = false;
	

	$(document).ready(function(){		
		
		$("div.loader").hide(); // CSS 로딩화면 감추기
		
		// 모든 경고표시
		$(".form-field__feedback").hide();
		
		$(".email-check-btn").click(function() {
			let check_input = $("#email_check_number"); // 인증번호 입력하는곳 
			
			if($("#email").val().trim() == "") {
				alert('이메일을 입력하세요.');
				$("#email").focus();
				return;
			}
			
			if(flag_input_email == false) {
				$("#email").focus();
				return;
			}
			
			else if(check_duplicate_email == false) {
				$("div.loader").show(); // CSS 로딩화면 감추기
		    	alert('인증번호를 발송하는 중입니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.');
		    	$.ajax({
						url:"<%= request.getContextPath()%>/member/find_id_email_check.got",
						data:{"name" : $("#name").val(),
							  "email" : $("#email").val()},
						type : "GET",
						success: function(json) {
							var result = JSON.parse(json);
					        memberId = result.memberId; 	// 받은 일반회원 아이디
					        partnerId = result.partnerId; 	// 받은 공방회원 아이디
					        code = result.emailCode;	// 코드							
					        
					        if(memberId == "" && partnerId == "") {
					        	alert("일치하는 정보가 없습니다.");
					        	check_duplicate_email == false;					 
					        }
					        else {
					        	
					        	console.log("code : " + code);								
								check_input.attr('disabled',false);
								alert('인증번호가 발송되었습니다.');
								check_duplicate_email == true;
					        }
					        
					        $("div.loader").hide(); // CSS 로딩화면 감추기
							
						},
						error: function(request, status, error){
				            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				        }
				}); // end of ajax--------------				    	  
			}
		}); // end of $(".email-check-btn").click(function()----------------------
		
		
		// 넘어가는 확인버튼 - 인증번호 비교 
		$(".login-search__button").click(function() {
			
			let inputCode = $("input#email_check_number").val();
			
			// == 이름 공백 입력시 == //
			if( $("input#name").val().trim() == "" ) {
				$("input#name").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_name_f").show(); // 경고 표시
				$("input#name").focus();
				
				return;
			}
			
			// == 이메일 공백 입력시 == //
			if( $("input#email").val().trim() == "" ) {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_email_f1").show(); // 경고 표시
				$("input#email").focus();
				
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
				
				code = "";  // 인증번호 체크 초기화
				
				findIdEnd(memberId, partnerId);  // 다음 단계로 넘어가기
			} 
		});//end of $(".login-search__button").click(function() {-----------------
				
		// 이름 blur
		$("input#name").blur( (e) => {
			// 공백일 때
			if( $(e.target).val().trim() == "" ) {
				$("input#name").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_name_f").show(); // 경고 표시
				
				flag_input_name = false;
			}
			else {
				$("input#name").removeClass("form-input--invalid");
				$(".user_name_f").hide();
				
				flag_input_name = true;
			}
		});
		
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
		});
	
 	});// end of $(document).ready(function()--------------------------
		
	// 다음 단계로 넘어가기
	function findIdEnd(memberId, partnerId) {
        window.location.href = "<%= ctxPath%>/find_id_end.got?memberId=" + memberId + "&partnerId=" + partnerId;
    }
	
</script>

<div id="content">
	<section class="login-search" style="z-index: 1;">
		<header class="login-search__header">
			<h2 class="login-search__title">아이디 찾기</h2>
			<p class="login-search__description">GOTGONGBANG에 등록된 이메일로 아이디를 찾을 수 있습니다.</p>
		</header>
		
		<form class="login-search__form">
			<fieldset class="login-search__filedset">

				<div class="form-field">

					<input class="form-input" type="text" id="name" name="name" title="이름 입력" placeholder="이름을 입력하세요.">
					<div class="form-field__feedback user_name_f" data-field-feedback="user_name"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이름을 입력해주세요.</div>
				</div>
				<div class="form-field">
				
					<div style="display: flex; position: absolute; z-index: 2; left: 46%;">
					  <div class="loader" style="margin: auto"></div>
					</div>

					<div class="form-field__group form-field__group--input-button">
						<input class="form-input" type="email" id="email" name="email" title="이메일 입력" placeholder="이메일 주소를 입력하세요.">
						<button class="button button--outline email-check-btn" type="button">인증번호 받기</button>
					</div>
					<div class="form-field__feedback user_email_f1" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일을 입력해주세요.</div>
					<div class="form-field__feedback user_email_f2" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일 형식이 올바르지 않습니다.</div>
				</div>
				<div class="form-field">

					<input class="form-input" type="text" id="email_check_number" name="auth_code" disabled="disabled" placeholder="인증번호를 입력하세요.(5분 이내)">
					<div class="form-field__feedback email_check_number_f" data-field-feedback="auth_code"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;인증번호를 정확히 입력하세요.</div>
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