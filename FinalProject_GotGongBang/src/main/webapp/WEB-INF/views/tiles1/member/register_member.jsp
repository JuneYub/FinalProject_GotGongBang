<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   String ctxPath = request.getContextPath();
%>   


<style>

}
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
	
	// === 약관동의 체크 === //
	let flag_check1 = false; 
	let flag_check2 = false;
	let flag_check3 = false;
	
	// 버튼 클릭시 자동적으로 상단스크롤
	function topScrollFunction() {
		  
		  window.scrollTo({top:0, behavior:'smooth'});
	}
	
	
	$(document).ready(function(){
		
		// 약관 더보기1
		$(".more1").click(function(){
			
	        
	        if(Flag1 == true) {
	        	// false 일때
	        	$(".dd1").addClass("accordion__collapse");
	        	$(".dd1").removeClass("accordion__collapse--expand");
	        	$(".div1").hide();
	        	$(".div1").removeClass("div1_h");
	        	
	        	
	        	
	        	Flag1 = false;
	        }
	        else if(Flag1 == false) {
	        	// ture 일때
	        	$(".div1").show();
	        	$(".dd1").removeClass("accordion__collapse");
	        	$(".dd1").addClass("accordion__collapse--expand");
	        	$(".more1").addClass("accordion__trigger--expand:after");
	        	

	        	Flag1 = true;
	        }
	         
	    });
		
		// 약관 더보기2
		$(".more2").click(function(){
			
	        
	        if(Flag2 == true) {
	        	// false 일때
	        	$(".dd2").addClass("accordion__collapse");
	        	$(".dd2").removeClass("accordion__collapse--expand");
	        	$(".div2").hide();
	        	
	        	
	        	Flag2 = false;
	        }
	        else if(Flag2 == false) {
	        	// ture 일때
	        	$(".div2").show();
	        	$(".dd2").removeClass("accordion__collapse");
	        	$(".dd2").addClass("accordion__collapse--expand");
	        	$(".more2").addClass("accordion__trigger--expand:after");

	        	Flag2 = true;
	        }
	         
	    });// end of $(".more2").click(function()----------------
	    		
	 	// 약관 더보기3
		$(".more3").click(function(){
			
	        
	        if(Flag3 == true) {
	        	// false 일때
	        	$(".dd3").addClass("accordion__collapse");
	        	$(".dd3").removeClass("accordion__collapse--expand");
	        	$(".div3").hide();
	        	
	        	Flag3 = false;
	        }
	        else if(Flag3 == false) {
	        	// ture 일때
	        	$(".div3").show();
	        	$(".dd3").removeClass("accordion__collapse");
	        	$(".dd3").addClass("accordion__collapse--expand");
	        	$(".more3").addClass("accordion__trigger--expand:after");

	        	Flag3 = true;
	        }
	         
	    });// end of $(".more3").click(function()----------------------
	    		
	 	// 약관 더보기4
		$(".more4").click(function(){
			
	        
	        if(Flag4 == true) {
	        	// false 일때
	        	$(".dd4").addClass("accordion__collapse");
	        	$(".dd4").removeClass("accordion__collapse--expand");
	        	$(".div4").hide();
	        	
	        	
	        	Flag4 = false;
	        }
	        else if(Flag4 == false) {
	        	// ture 일때
	        	$(".div4").show();
	        	$(".dd4").removeClass("accordion__collapse");
	        	$(".dd4").addClass("accordion__collapse--expand");
	        	$(".more4").addClass("accordion__trigger--expand:after");

	        	Flag4 = true;
	        }
	         
	    });// end of $(".more4").click(function()-------------------
		
		// 약관 더보기5
		$(".more5").click(function(){
			
	        
	        if(Flag5 == true) {
	        	// false 일때
	        	$(".dd5").addClass("accordion__collapse");
	        	$(".dd5").removeClass("accordion__collapse--expand");
	        	$(".div5").hide();
	        	
	        	
	        	Flag5 = false;
	        }
	        else if(Flag5 == false) {
	        	// ture 일때
	        	$(".div5").show();
	        	$(".dd5").removeClass("accordion__collapse");
	        	$(".dd5").addClass("accordion__collapse--expand");
	        	$(".more5").addClass("accordion__trigger--expand:after");

	        	Flag5 = true;
	        }
	         
	    });
		// 더보기 버튼 끝
//========================================================================		
		$(".step1").show();
		$(".step2").hide();
		$(".step3").hide();
		$(".step4").hide();
		$(".step5").hide();
		
		$(".form-field__feedback").hide();
//========================================================================
		
		/* ============ 버튼 및 폼 검사 시작 ============ */
		
		/* 첫번째 화면 버튼 */
		$(".btn_next1").click(function() {
			
			if( !(flag_check1 || flag_check2 || flag_check3) ) {
				$(".agree_f").show(); // 경고 표시
			}
			else {
				$(".step1").hide();
				$(".step2").show();
				
				$(".sign1").removeClass("sign-up__order-item--current");
				$(".sign2").addClass("sign-up__order-item--current");

				topScrollFunction();
			}
			
			
		});
		
		
		/* 첫번째 화면 버튼 */
		
		
		/* 두번째 화면 버튼 */
		// === .btn_next2 는 이메일 인증 체크에 위치 === //
		
		
		$(".btn_prev2").click(function() {
			
			$(".step2").hide();
			$(".step1").show();
			
			$(".sign2").removeClass("sign-up__order-item--current");
			$(".sign1").addClass("sign-up__order-item--current");
			
			topScrollFunction();
			
		});
		/* 두번째 화면 버튼 */
		
		
		/* 세번째 화면 버튼 */
		$(".btn_next3").click(function() {
			
			if(flag_input_name == false) {
				$("input#name").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_name_f").show(); // 경고 표시
    			$("input#name").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_phone == false) {
				$("input#mobile").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#mobile").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_email == false) {
				$("input#email").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#email").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_id == false) {
				$("input#user_id_pk").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#user_id_pk").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_passwd == false) {
				$("input#pwd").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#pwd").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_passwd_check == false) {
				$("input#user_passwd_check").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#user_passwd_check").focus();
    			topScrollFunction();
    			
    			return;
			}
			
			if(flag_input_birth == false) {
				$("input#birthday").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				
    			$("input#birthday").focus();
    			
    			return;
			}
			
			if($("input#post_code").val() == "") {
				$("input#post_code").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시				
    			
    			return;
			}	 		
			else {
				$("button#yh_button").click(function(){
					// 폼(form)을 전송(submit)
			            const frm = document.signup_form;
			            frm.method = "post";
			            frm.action = "<%= ctxPath%>/register.got";
			            frm.submit();
					
			     });
			}
			
		});
		
		$(".btn_prev3").click(function() {
			
			$(".step3").hide();
			$(".step2").show();
			
			$(".sign3").removeClass("sign-up__order-item--current");
			$(".sign2").addClass("sign-up__order-item--current");
			
			topScrollFunction();
			
		});
		/* 세번째 화면 버튼 */
		
		/* ================== 약관동의 체크유무 시작 ================== */
		// 약관 동의의 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
		
		 // 전체 선택 / 해제
		  $(".checkall").click(function(){
		    if($(".checkall").is(":checked")){
		      $("input[name=agree_yn]").prop("checked", true);
		      $(".checkone").addClass("form-check_click");
		      $(".checkall").addClass("form-check_click");
		      flag_check1 = true;
		      flag_check2 = true;
		      flag_check3 = true;
		      
		    }else {
		      $("input[name=agree_yn]").prop("checked", false);
		      $(".checkone").removeClass("form-check_click");
		      $(".checkall").removeClass("form-check_click");
		      flag_check1 = false;
		      flag_check2 = false;
		      flag_check3 = false;
		    }
		  });
		  
		  $(".checkone").click(function(){
		    var totalArr = $(".checkone").length;
		    var checked = $("input[name=agree_yn]:checked").length;
		    
		    if(totalArr != checked){
		      $(".checkall").prop("checked", false);
		      $(".checkall").removeClass("form-check_click");
		    }else{
		      $(".checkall").prop("checked", true);
		      $(".checkall").addClass("form-check_click");
		    }
		  });
		  
		  
		$(".check1").click(function(){
			if($(".check1").is(":checked")) {
				$(".check1").addClass("form-check_click");
				flag_check1 = true;
			}
			else {
				$(".check1").removeClass("form-check_click");
				flag_check1 = false;
			}
		});
		
		$(".check2").click(function(){
			if($(".check2").is(":checked")) {
				$(".check2").addClass("form-check_click");
				flag_check2 = true;
			}
			else {
				$(".check2").removeClass("form-check_click");
				flag_check2 = false;
			}
		});
		
		$(".check3").click(function(){
			if($(".check3").is(":checked")) {
				$(".check3").addClass("form-check_click");
				flag_check3 = true;
			}
			else {
				$(".check3").removeClass("form-check_click");
				flag_check3 = false;
			}
		});
		
		$(".check4").click(function(){
			if($(".check4").is(":checked")) {
				$(".check4").addClass("form-check_click");
			}
			else {
				$(".check4").removeClass("form-check_click");
			}
		});
		
		$(".check5").click(function(){
			if($(".check5").is(":checked")) {
				$(".check5").addClass("form-check_click");
			}
			else {
				$(".check5").removeClass("form-check_click");
			}
		});
		/* ================== 약관동의 체크유무 끝 ================== */
		
		
		
		/* ====== 이메일 인증 체크 시작 ====== */
		$(".email-check-btn").click(function() {
			let check_input = $("#email_check_number"); // 인증번호 입력하는곳 
			
			if($("#email").val() == "") {
				alert('이메일을 입력하세요.');
				$("#email").focus();
				return;
			}
			
			$.ajax({
				url:"<%= request.getContextPath()%>/member/email_check.got",
				data:{"email" : $("#email").val()},
				type : "get",
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
		}); // end of $(".email-check-btn").click(function()----------------------
		
		
		// 인증번호 비교 
		$(".btn_next2").click(function() {
			
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
				
				$(".step2").hide();
				$(".step3").show();
				
				$(".sign2").removeClass("sign-up__order-item--current");
				$(".sign3").addClass("sign-up__order-item--current");
				
				code = "";
				
				topScrollFunction();
			} 
		});//end of $(".btn_next2").click(function()-----------------
		
		/* ====== 이메일 인증 체크 끝  ====== */

		
		
		/* ====== 회원정보 폼 시작 ====== */
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
		
		
		// 휴대전화번호 blur
		$("input#mobile").blur( (e) => {
			
			const regExp = /^\d{11}$/;
			
			const bool = regExp.test($(e.target).val());
	    	  
	    	  if(!bool || $(e.target).val().trim() == "") {
	    		  // 암호가 정규표현식에 위배 된 경우
	    		  $("input#mobile").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				  $(".user_phone_f").show(); // 경고 표시
				  
				  flag_input_phone = false;
	              
	    	  }
	    	  else {
	    		  // 암호가 정규표현식에 맞는 경우
	    		  $("input#mobile").removeClass("form-input--invalid");
				  $(".user_phone_f").hide();
				  
				  flag_input_phone = true;

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
		
		
		// 아이디 blur
		$("input#user_id_pk").blur( (e) => {
			
			if($(e.target).val().trim() == "" || id_check == false) {
				$("input#user_id_pk").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_id_f").show(); // 경고 표시
				
				flag_input_id = false;
			}
			else {
				$("input#user_id_pk").removeClass("form-input--invalid");
				$(".user_id_f").hide();
				
				flag_input_id = true;
			}
		});// end of 
		
		
		$("input#user_id_pk").change(function (){
			id_check = false;
			
		});
		
		
		// 아이디 중복확인 버튼
		$(".btn_userid").click(function(){

			alert(id_check + "예" + $("input#user_id_pk").val() + "사용가능한 아이디입니다.");
			id_check = true;
			flag_input_id = true;
			$("input#user_id_pk").removeClass("form-input--invalid");
			$(".user_id_f").hide();
			
		});
		
		
		
		
		// 비밀번호 blur
		$("input#pwd").blur( (e) => {
			
			const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
	    	  
	    	const bool = regExp.test($(e.target).val());
			
			// 공백일 때
			if( $(e.target).val().trim() == "") {
				$("input#pwd").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_passwd_f2").hide();
				$(".user_passwd_f1").show(); // 공백 경고 표시
				
				
				flag_input_passwd = false;
			}
			// 형식에 맞지 않을 때
			else if(!bool) {
				$("input#pwd").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_passwd_f1").hide();
				$(".user_passwd_f2").show(); // 공백 경고 표시
				
				flag_input_passwd = false;
			}
			
			else {
				$("input#pwd").removeClass("form-input--invalid");
				$(".user_passwd_f1").hide();
				$(".user_passwd_f2").hide();
				
				flag_input_passwd = true;
			}
		});
		
		// 비밀번호확인 blur
		$("input#user_passwd_check").blur( (e) => {
			
			if( $("input#pwd").val() != $(e.target).val() ) {
				$("input#user_passwd_check").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
				$(".user_passwd_check_f").show(); // 경고 표시
				
				flag_input_passwd_check = false;
			}
			else {
				$("input#user_passwd_check").removeClass("form-input--invalid");
				$(".user_passwd_check_f").hide();
				
				flag_input_passwd_check = true;
			}
		});
		
		// 생년월일 blur
		$("input#birthday").blur( (e) => {
          
    	  const regExp = /^\d{8}$/;		// 단순 8자리
    	  
    	  const bool = regExp.test($(e.target).val());
    	  
    	  if(!bool) {
    		  // 생년월일 정규표현식에 위배 된 경우
    		  $("input#birthday").addClass("form-input--invalid"); // 유효성 검사 불합격 시 input 붉은색 표시
			  $(".user_birth_f").show(); // 경고 표시
			  
			  flag_input_birth = false;
              
    	  }
    	  else {
    		  // 생년월일 정규표현식에 맞는 경우
    		  $("input#birthday").removeClass("form-input--invalid");
			  $(".user_birth_f").hide();
			  
			  flag_input_birth = true;

    	  }
          
        });
		
		// 상세주소
		$("img#zipcodeSearch").click(function(){
     	   new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extra_address").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extra_address").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('post_code').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detail_address").focus();
	            }
	        }).open();
        });
		
		
	});// end of $(document).ready(function()------------------------
	
</script>

<body>

    <!-- 회원가입 폼 본문시작 -->
<div id="content">
		<section class="yh_sign-up">
			<header class="yh_sign-up__header">
				<h2 class="sign-up__title">회원가입</h2>
				<ol class="sign-up__order">
					<li class="sign-up__order-item sign1 sign-up__order-item--current"><span class="sign-up__order-index">01</span><span class="sign-up__order-menu">이용약관</span></li>
					<li class="sign-up__order-item sign2"><span class="sign-up__order-index">02</span><span class="sign-up__order-menu">이메일 인증</span></li>
					<li class="sign-up__order-item sign3"><span class="sign-up__order-index">03</span><span class="sign-up__order-menu">회원정보 입력</span></li>
					<li class="sign-up__order-item sign4"><span class="sign-up__order-index">05</span><span class="sign-up__order-menu">가입완료</span></li>
				</ol>
			</header>
			
			
			<form class="sign-up__form" name="signup_form">
				<!-- <input type="hidden" name="auth_type" value="SU">
				<input type="hidden" name="ci_code">
				<input type="hidden" name="user_birth_date">
				<input type="hidden" name="user_gender_code">
				<input type="hidden" name="_csrf" value="3886e5ea-8f5a-4bb8-a876-37a0622cc718">
				<input type="hidden" name="providing_agree_yn" value="Y">
				<input type="hidden" name="collection_agree_yn" value="Y"> -->
				
				
				<fieldset class="sign-up__step step1">
					<legend class="sign-up__legend">GOTGONGBANG 회원 이용약관</legend>
					<div class="sign-up__step-header">
						<h3 class="sign-up__step-title">GOTGONGBANG 회원 이용약관</h3>
						<p class="sign-up__step-description ">GOTGONGBANG 서비스이용을 위해 <br>아래 이용약관 및 정보이용에 동의해 주세요.</p>
					</div>
					<dl class="sign-up__terms-list accordion">
					<div class="sign-up__terms-item">
						<dt class="sign-up__terms-header">
							<label class="form-check">
								<input class="form-check__input checkall" type="checkbox" onclick="selectAll()" ><span class="form-check__name">전체동의</span>
							</label>
						</dt>
					</div>
						
					<div class="sign-up__terms-item accordion__item">
							<dt class="sign-up__terms-header accordion__header">
								<label class="form-check">
									<input class="form-check__input checkone check1" type="checkbox" name="agree_yn"><span class="form-check__name">갗공방 이용약관
		
								<strong class="sign-up__terms-required"> (필수)</strong>
							</span>
								</label>
								<button class="sign-up__terms-trigger accordion__trigger more1 btn" type="button"><span class="sign-up__terms-trigger-name">더보기</span></button>
							</dt>
							<dd class="sign-up__terms-collapse accordion__collapse dd1">
								<div class="sign-up__terms-body accordion__body div1 div_h1">
										<p><strong>제 1장 총칙</strong></p><p>&nbsp;</p><p>&nbsp;</p><p><strong>제 1조 목적</strong></p><p>본 약관은 ㈜하이픈코퍼레이션(이하 ‘회사’라고 합니다)이 운영하는 하이픈 홈페이지(이하 ‘홈페이지’라고 합니다)를 통하여 인터넷상에서 제공하는 서비스를 이용함에 있어 이용조건 및 절차, 회사와 이용자의 권리ㆍ의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p><p><br>&nbsp;</p><p><strong>제 2조 용어의 정의</strong></p><p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다. 본 약관에서 정의하지 않은 것은 관련 법령 및 서비스별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.</p><p>1. 정보제공서비스: 정보제공서비스란 우수한 정보자원을 회원이 원활하게 활용할 수 있도록 다양한 형식과 방식으로 제공하는 서비스로서, 홈페이지를 통하여 회사가 직접 제공하거나 회사와 별도의 계약을 맺은 제공기관이 제공하는 것을 말합니다.</p><p>2. 상품: 개별 정보제공서비스를 회원이 신청하기 용이하도록 회사가 정한 기준에 따라 묶음으로 제공하는 것을 말합니다.</p><p>3. 제공기관: 제공기관은 회사와 별도의 계약을 맺고 홈페이지를 통해 정보제공서비스를 회원에게 제공하는 법인 또는 개인을 말합니다.</p><p>4. 회원: 본 약관에서 정한 절차에 따라 회사에 가입신청을 하여 회사의 승인을 받은 법인 또는 개인을 말합니다.</p><p>5. 비회원: 회원에 가입하지 않고 서비스를 이용하는 사람을 말합니다.</p><p>6. 휴면회원: 최근 12개월 동안 홈페이지에 로그인하지 아니하였거나 고객이 선택한 해당 기간 동안 이용하지 아니한 회원을 말합니다.</p><p>7. 아이디(ID): 회원이 이 약관 및 개인정보 처리사항에 동의한 후 회사가 회원을 식별하고 서비스를 제공하기 위하여 회원에게 부여한 문자 또는 숫자의 조합으로, 회사는 아이디를 전화번호 등으로 정할 수 있습니다. 회원 1인당 한 개의 아이디만 발급 및 이용 가능합니다.</p><p>8. 비밀번호: 회원 본인 확인 및 통신상의 자신의 비밀 보호를 위하여 회원이 선정한 문자와 숫자의 조합.</p><p>9. 회원탈퇴: 서비스 개통 후 회원 또는 회사가 이용계약을 해지하는 것을 의미합니다.</p><p>10. 비즈머니: 회원이 회사로부터 발급받은 회원 계정 등에 충전 등의 방법을 통해 부여받거나 이벤트 등을 통해 적립받아 회사에게 대가를 지급하기 위해 현금처럼 사용할 수 있는 수단을 의미합니다.</p><p>11. 제휴사: 회사가 회원에게 전자금융거래 관련 서비스를 제공하기 위하여 회사와 계약을 체결하여 협력하는 제3자를 의미합니다.</p><p>12. 결제: 회원이 정보제공서비스를 이용하기 위하여 서비스에서 제공하는 결제 수단을 통해 회사에게 대가를 지급하는 것을 의미합니다.</p><p>13. 충전: 선불전자지급수단의 일정금액을 확보하기 위하여 회원이 등록한 지불수단을 통해 선불전자지급수단을 구매하거나 회사가 제공하는 서비스 등에서의 활동을 통하여 선불전자지급수단을 적립 받는 것을 말합니다.</p><p>14. 자동결제: 회원이 보유한 선불전자지급수단이 회사가 정한 기준금액에 도달하는 경우 회원이 사전에 등록한 지불수단을 통해 자동으로 충전되는 것을 말합니다.</p><p>15. 결제비밀번호: 회원이 결제시점에 사용하는 추가 인증 수단으로써 회원이 스스로 설정하여 회사에 등록한 숫자 또는 지문 등 생체정보를 말합니다. 다만, 회사는 서비스 특성에 따라 추가 인증 수단을 변경할 수 있습니다.</p><p>16. 환불: 회원이 정보제공서비스 이용 계약의 해제, 해지, 취소 등을 통해 충전한 비즈머니를 회원의 계좌로 지급받는 것을 말합니다.</p><p>17. 서비스중지: 회사가 정한 요건에 따라 일정기간 동안 서비스의 제공을 중지하는 것을 말합니다.</p><p><br>&nbsp;</p><p><strong>제 3조 약관의 효력과 변경</strong></p><p>① 본 약관은 사이트를 통해 온라인으로 공시하며, 회원이 약관의 내용에 대해 동의하고 회원가입 신청을 하여 회사의 승인이 완료된 시점부터 효력이 발생합니다.</p><p>② 회사는 필요한 경우 본 약관을 변경할 수 있습니다. 이 경우 회사는 변경되는 약관의 내용을 그 적용 전에 30일 이상의 기간(단, 부득이한 사유가 있는 경우 이 기간은 단축될 수 있습니다.) 동안 홈페이지의 공지사항을 통해 공지합니다.</p><p>③ 회사는 전 항의 공지를 할 경우 “회원이 변경에 동의하지 아니한 경우 공지를 받은 날로부터 30일 이내에 계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다.“라는 취지의 내용을 공지합니다.</p><p>④ 회원은 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 회원 탈퇴를 요청할 수 있습니다. 단, 회원이 전 항의 공지를 받은 날로부터 30일 이내에 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 봅니다.</p><p>⑤ 회사는 회원의 요청이 있는 경우 전자문서의 전송(전자우편을 이용한 전송을 포함합니다), 모사전송, 우편 또는 직접교부의 방식에 의하여 이 약관의 사본을 회원에게 교부합니다.</p><p><br>&nbsp;</p><p><strong>제 4조 약관 외 준칙</strong></p><p>① 회사는 이 약관 외에 별도의 운영정책 또는 개별약관(이하 ‘서비스 별 약관’이라 합니다)를 정할 수 있으며, 본 약관과 서비스 별 약관의 내용이 상충되는 경우에는 서비스 별 약관의 내용을 우선하여 적용합니다.</p><p>② 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회 심의규정, 정보통신 윤리강령, 기타 관련 법령의 규정에 의합니다.</p><p><br><br><br>&nbsp;</p><p><strong>제2장 서비스 제공 및 이용</strong></p><p><br>&nbsp;</p><p><strong>제 5조 이용 계약의 성립(회원 가입)</strong></p><p>① 회사와 회원간의 이용 계약은 회원으로 가입하려는 법인 또는 개인이 홈페이지에서 제공하는 이용약관 및 개인정보처리방침에 동의한다는 의사표시와 함께 소정의 회원가입신청 양식에서 요구하는 사항을 기록하여 회사에 제출하고, 회사가 이를 승인하여 회원 가입이 완료됨으로써 성립됩니다.</p><p>② 본 이용약관에 대한 동의는 회원가입 당시 해당 서비스의 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.</p><p>③ 회사는 본 서비스를 이용하는 회원에 대하여 회원 등급별로 구분하여 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.</p><p>④ 회사는 다음 각 호에 해당하는 회원가입신청에 대해서는 승인을 거절하거나 승인을 취소할 수 있습니다.</p><p><br>&nbsp;</p><p><strong>제 9조 자동결제</strong></p><p>① 자동결제의 경우 회원이 정해진 절차에 따라 회사에 이용 중지 의사를 밝히지 않을 경우 매월 계약이 갱신되는 것으로 간주하여 지속해서 요금이 청구됩니다. 자동결제를 지원하는 결제수단은 관련 업체와의 협의에 따라 변동될 수 있습니다.</p><p>② 자동결제는 고객이 지급하여야 할 요금이 있는 경우 별도의 통지 없이 고객의 지정결제수단에서 회사가 지정하는 납기일에 결제합니다. 다만, 자동결제의 경우에는 금융기관의 약관이나 약정서의 규정에도 불구하고 결제청구서, 기타 관련 증서 없이 자동결제 처리 절차에 의하여 결제할 수 있습니다.</p><p>③ 자동결제 신규신청에 의한 결제 개시일은 회사의 유료 서비스 가입 시 자동결제 동의에 의하여 결정되며 회사로부터 최초 상품 결제일을 최초 개시일로 합니다.</p><p>④ 자동결제는 유료 서비스 승인일부터 익월 결제일 이전까지의 사용요금이 청구되며 매월 결제일에 서비스 이용요금이 자동으로 결제됩니다.</p><p>⑤ 자동결제시 결제 금액은 회원이 보유한 포인트를 먼저 차감한 후 차액을 청구합니다.</p><p>⑥ 결제일에 자동결제가 실패한 경우, 마지막 추가 결제일인 25일까지 요금이 납부되지 않으면 익월 청구서 발행일부터 연체 상태가 됩니다.</p><p>⑦ 연체 상태인 회원은 미납된 요금(VAT제외)의 월 2%가 연체료로 추가되어 익월 청구서와 함께 청구됩니다.</p><p>⑧ 회사는 회원이 3개월 이상 서비스 요금을 연체한 경우 직권으로 상품이용을 종료합니다.</p><p>⑨ 상품이용 종료 후에도 연체 요금을 납부하지 않을 경우 회사는 연체금액에 대한 법적 조치(신용불량정보등재, 가압류, 민사 소송 등)를 진행할 수 있습니다.</p><p>⑩ 자동결제의 결제수단 삭제 및 변경은 사이트의 결제관리 메뉴에서 가능합니다.</p><p>⑪ 결제수단의 잔액 또는 한도(자동대출 약정이 있는 경우 대출한도 포함)가 결제일 현재 회사의 청구금액보다 부족하거나, 결제의 지급 제한, 연체 등 고객의 과실에 의하여 결제가 불가능한 경우의 손해는 고객의 책임으로 합니다.</p><p>⑫ 자동결제 신청에 의한 결제수단에서의 결제금은 해당 일에 청구된 금액에 한하여 회사의 청구에 의하여 결제가 이루어지며, 청구금액에 이의가 있는 경우에는 회원과 회사가 조정하여야 합니다.</p><p>⑬ 자동결제 업무처리를 위하여 자동결제와 관련한 고객정보(신용카드정보, 직불카드정보, 법인인 경우 사업자등록번호, 개인인 경우 주민번호 일부 등)가 회사에 제공되며, 제공된 정보에 대해 회사는 관련 업무 이외의 목적에 사용하지 않습니다.</p><p><br>&nbsp;</p><p><strong>제 10조 비즈머니</strong></p><p>① 비즈머니는 회원이 구매한 충전 비즈머니와 이벤트 등으로 회사가 지급한 적립 비즈머니로 구분됩니다.</p><p>② 비즈머니는 회원의 서비스 이용 요금 결제 시 현금처럼 사용됩니다.</p><p>③ 비즈머니 충전은 최소 2만 원부터 가능하며 신용카드 결제 방법으로만 할 수 있습니다.</p><p>④ 1포인트는 현금 1원과 같은 비율로 사용됩니다.</p><p>⑤ 회사가 회원에게 지급한 적립 비즈머니는 환불되지 않습니다.</p>
										<p>⑥ 충전 비즈머니 환불은 별도의 환불 신청을 해야 하며 환불 금액은 입력된 계좌 정보로만 입금 가능합니다.</p><p>⑦ 회사는 서비스 운영의 필요로 적립 비즈머니 및 사용에 관해 일부 또는 전부를 조정할 수 있습니다. 단, 이 경우에는 그 사유 및 내용을 회원에게 공지합니다.</p><p>⑧ 비즈머니를 이용한 유료 서비스 결제는 적립 비즈머니&gt;충전 비즈머니 순으로 차감하는 것을 기본으로 합니다.</p><p>⑨ 2회 이상 구매한 비즈머니를 누적 소지한 경우 충전/적립 일시가 가장 오래된 포인트를 먼저 차감합니다.</p><p><br>&nbsp;</p><p><strong>제 11조 청약철회</strong></p><p>① 회원은 회원탈퇴를 통해 원하는 때에 청약 철회가 가능하며 미납요금 납부 완료 후 철회가 완료됩니다.</p><p>② 회사는 요금 등의 과오납이 있을 때는 그 과오납 요금을 반환합니다. 단, 이용자가 동의하거나 회사의 반환 통지에 대하여 응하지 아니할 경우에는 익월 요금에서 해당 요금을 차감하여 청구할 수 있습니다.</p><p>③ 회원은 청구된 요금에 대하여 이의가 있는 경우에는 청구일로부터 1개월 이내에 이의신청을 할 수 있으며, 회사는 이의신청 접수 후 7일 이내에 이의 타당성 여부를 조사하여 그 결과를 회원에게 알립니다. 다만, 부득이 정한 기간 내에 이의신청 결과를 알릴 수 없는 경우에는 그 사유 및 처리기한을 재지정하여 이를 회원에게 알립니다.</p><p><br>&nbsp;</p><p><strong>제 12조 개인정보의 보호</strong></p><p>① 회사는 관계법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다.</p><p>② 개인정보의 보호 및 사용에 관해서는 관계 법령 및 회사의 개인정보처리방침에 정한 바에 의합니다. 단, 회원은 회원의 아이디 및 비밀번호 등이 타인에게 노출되지 않도록 철저히 관리해야 하며 회사는 회원의 귀책사유로 인해 노출된 정보에 대해서 책임을 지지 않습니다.</p><p>③ 회원의 개인정보는 다음과 같이 사용, 관리, 보호됩니다.</p><div style="padding-left:20px;"><p>1. 개인정보의 사용: 회사는 서비스 제공과 관련해서 수집된 회원의 개인정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우 및 회원 본인의 동의가 있는 경우에는 예외로 합니다.</p><p>2. 개인정보의 관리: 회원은 홈페이지의 개인정보관리 메뉴를 통해 개인정보를 수정/삭제할 수 있습니다.</p><p>3. 개인정보의 보호: 회원의 개인정보는 오직 회원 본인만이 열람/수정/삭제할 수 있으며, 이는 회원의 아이디와 비밀번호에 의해 관리됩니다. 따라서 회원이 타인에게 자신의 아이디와 비밀번호를 알려주어서는 안 되며, 회원이 이를 위반하여 발생한 개인정보의 열람/수정/삭제 등에 대해서는 회사가 책임을 지지 않습니다.</p></div><p>④ 회원이 본 약관에 따라 회원가입신청을 함으로써 회원가입신청서에 기재된 개인정보를 회사가 수집 및 서비스 제공을 위한 목적으로 활용하는 것에 동의한 것으로 간주됩니다.</p><p><br>&nbsp;</p><p><strong>제 13조 회원 정보의 변경</strong></p><p>① 회원은 개인정보관리화면을 통해서 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.</p><p>② 회원은 회원가입 신청 시 기재한 정보가 변경되었을 경우 온라인으로 수정하여 그 변경사항을 회사에 알려야 합니다.</p><p>③ 회원이 전 항의 내용을 이행하지 않아 발생한 불이익에 대하여 회사는 어떠한 책임도 부담하지 않습니다.</p><p><br>&nbsp;</p><p>① 홈페이지를 통한 서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.</p><p>② 회사는 시스템의 정기점검, 기타 정당한 사유가 있을 경우 제1항에도 불구하고 회사가 정한 날 또는 시간 동안 서비스 제공을 중단할 수 있습니다. 이 경우 회사는 부득이한 사유가 없는 한 사전에 그 내용을 공지합니다.</p><p><br>&nbsp;</p><p><strong>제 17조 서비스의 중지 등</strong></p><p>① 홈페이지에 보관되거나 전송된 메시지 등이 국가의 비상사태, 정전, 홈페이지의 관리 범위 밖의 긴급한 시스템 점검, 증설 및 교체, 서비스 설비 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 기타 불가항력적 사유에 의해 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우, 통신 데이터의 손실이 있는 경우, 기타 이와 유사한 사유가 발생한 경우 회사는 그에 관하여 책임을 지지 않습니다.</p><p>② 회사가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의 고지 후 서비스 제공을 중지할 수 있으며, 이 기간 동안 회원이 그 고지 내용을 인지하지 못한 데 대하여 회사는 책임을 지지 않습니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 단축되거나 사전고지가 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 서비스와 관련하여 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 회사는 책임을 지지 않습니다.</p><p>③ 회사의 사정으로 서비스 제공을 영구적으로 중단하여야 할 경우 회사는 제2항의 절차에 따릅니다. 다만, 이 경우 사전 고지기간은 1개월 이상으로 합니다.</p><p>④ 회사는 서비스 개편 등 서비스 운영 상 필요한 경우 전부 또는 일부 서비스의 제공을 중단할 수 있으며 회원에게 사전 예고 또는 사후 통보합니다.</p><p>⑤ 회사는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있습니다.</p><p class="p1">⑥ 회사의<span class="s1"> </span>상품은<span class="s1"> </span>상품별<span class="s1"> </span>트래픽<span class="s1"> </span>제한이<span class="s1"> </span>존재하며<span class="s1">, </span>트래픽<span class="s1"> </span>초과<span class="s1"> </span>시<span class="s1"> </span>상품<span class="s1"> </span>이용에<span class="s1"> </span>제한이<span class="s1"> </span>있을<span class="s1"> </span>수<span class="s1"> </span>있습니다<span class="s1">.</span></p><p class="p1"><div style="padding-left:20px;"><p>4. 범죄적 행위에 결부된다고 인정되는 내용일 경우</p><p>5. 제3자의 저작권, 기타 권리를 침해하는 내용인 경우</p><p>6. 기타 관계 법령에 위배되는 경우</p></div><p>③ 회원의 게시물이 타인의 저작권을 침해하거니 기타 타인의 권리를 침해함으로써 발생하는 모든 책임은 당해 게시물을 게시한 회원에게 있습니다.</p><p><br>&nbsp;</p><p><strong>제 21조 회사 및 회원의 책임 등</strong></p><p>① 회원이 게시한 정보가 내용이 허위인 것으로 판명되거나 그러하다고 의심할 만한 합리적인 이유가 있을 경우 회사는 당해 회원의 서비스 이용을 일부 또는 전부 제한할 수 있으며, 이로 인해 발생하는 불이익에 대해 회사는 책임을 지지 않습니다.</p><p>② 회사가 직접 제공한 서비스가 아닌, 제공기관이나 기타 제3자가 제공하는 서비스의 내용상의 정확성, 완전성 및 품질에 대하여 회사는 어떠한 보증도 하지 않습니다. 따라서 회사는 회원이 위 내용과 관련하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 지지 않습니다.</p><p>③ 회사는 서비스 이용과 관련하여 다음과 같은 행위를 하여서는 안 됩니다.</p><div style="padding-left:20px;"><p>1. 타인의 아이디(ID)와 비밀번호를 도용하는 행위</p><p>2. 저속하거나 음란한 내용, 욕설, 위협적인 내용, 타인의 프라이버시를 침해할 수 있는 내용, 기타 불법적인 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위</p><p>3. 서비스를 통하여 전송된 내용의 출처를 위장하는 행위</p><p>4. 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위</p><p>5. 타인의 특허권, 상표권, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위</p><p>6. 회사의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 이와 유사한 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위</p><p>7. 다른 회원의 개인정보를 수집 또는 저장하는 행위</p></div><p>④ 회사는 회원이 본 약관의 내용을 위반 시 서비스와 관련된 모든 정보를 회원의 동의 없이 삭제할 수 있습니다.</p><p><br><br><br>&nbsp;</p><p><strong>제3장 의무 및 책임</strong></p><p><br>&nbsp;</p><p><strong>제 22조 회사의 의무</strong></p><p>① 회사는 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적, 안정적으로 서비스를 제공하기 위해서 노력합니다.</p><p>② 회사는 공정하고 건전한 운영을 위해 최선을 다하고 지속적인 연구개발을 통하여 양질의 서비스를 제공함으로써 고객만족을 극대화하여 인터넷 사업 발전에 기여합니다.</p><p>③ 회사는 회원의 개인정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 관련법령에 의하여 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.</p><p>④ 회사는 회원이 안전하게 홈페이지의 서비스를 이용할 수 있도록 회원의 개인정보(신용정보 포함) 보호를 위한 보안시스템을 구축하며 개인정보처리방침을 공시하고 준수합니다.</p><p>⑤ 회사는 회원으로부터 제기되는 의견이나 불편사항이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 통해 즉시 처리하여야 합니다. 다만, 신속한 처리가 곤란한 경우는 회원에게 그 사유와 처리 일정을 통보하여야 합니다.</p><p>⑥ 회사는 회원의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.</p><p><br>&nbsp;</p><p><strong>제 23조 회원의 의무</strong></p><p>① 회원은 회원 가입 신청 시에 요구되는 정보를 사실에 근거하여 정확하게 기입하여야 합니다. 또한 이미 제공된 회원의 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p><p>② 회원은 회사의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 그 영리행위의 결과에 대해 회사는 책임을 지지 않습니다. 또한 회원은 이와 같은 영리행위로 인하여 회사가 손해를 입은 경우, 회원은 회사에 대해 손해배상의무를 지며, 회사는 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.</p><p>③ 회원은 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.</p><p>④ 회원은 홈페이지 서비스를 이용하여 얻은 정보를 회사의 사전승낙 없이 복사, 복제, 변경, 번역, 출판•방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.</p><p>⑤ 회원은 홈페이지에서 제공하는 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다.</p>
										<p><br>&nbsp;</p><p>[부칙]</p><p>① 본 약관에 대한 저작권은 홈페이지에 귀속하며 무단 복제, 배포, 전송, 기타 저작권 침해행위를 엄금합니다.</p><p>② 본 약관은<span style="color:hsl(0,0%,0%);"> <span><strong>2023년 2월 13일</strong></span></span>부터 적용됩니다.</p><p>&nbsp;</p>
								</div>
							</dd>
						</div>								
							
						<div class="sign-up__terms-item accordion__item">
							<dt class="sign-up__terms-header accordion__header">
								<label class="form-check">
									<input class="form-check__input checkone check2" type="checkbox" name="agree_yn"><span class="form-check__name">개인정보 수집 및 이용동의
														
								<strong class="sign-up__terms-required"> (필수)</strong>
							</span>
								</label>
								<button class="sign-up__terms-trigger accordion__trigger more2 btn" type="button"><span class="sign-up__terms-trigger-name">더보기</span></button>
							</dt>
							<dd class="sign-up__terms-collapse accordion__collapse dd2">
								<div class="sign-up__terms-body accordion__body div2 div_h2">
										<p>회사는 회원가입에 의한 하이픈 데이터마켓 서비스 제공을 위해 다음과 같이 개인정보를 활용합니다. &nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td style="background-color:hsl(0, 0%, 90%);"><strong>개인정보 수집 항목</strong></td><td style="background-color:hsl(0, 0%, 90%);"><strong>개인정보 수집 이용 목적</strong></td><td style="background-color:hsl(0, 0%, 90%);"><strong>보유 및 이용기간</strong></td></tr><tr><td>이름, 휴대폰번호, 이메일주소, 본인확인정보(CI, DI), 신용카드결제정보, 은행계좌정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록&nbsp;</td><td>- 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존.&nbsp;</td><td>이용자가 동의를 철회하거나, 탈퇴시까지 보유•이용</td></tr></tbody></table></figure><p>&nbsp;</p>
								</div>
							</dd>
						</div>
										
							
						<div class="sign-up__terms-item accordion__item">
							<dt class="sign-up__terms-header accordion__header">
								<label class="form-check">
									<input class="form-check__input checkone check3" type="checkbox" name="agree_yn"><span class="form-check__name">전자금융거래 이용약관
													
								<strong class="sign-up__terms-required"> (필수)</strong>						
							</span>
								</label>
								<button class="sign-up__terms-trigger accordion__trigger more3 btn" type="button"><span class="sign-up__terms-trigger-name">더보기</span></button>
							</dt>
							<dd class="sign-up__terms-collapse accordion__collapse dd3">
								<div class="sign-up__terms-body accordion__body div3 div_h3">
										<p>&nbsp;</p><p><strong>제 1장 총칙</strong></p><p><br>&nbsp;</p><p><strong>제 1조 목적</strong></p><p>본 약관은 회원이 ㈜하이픈코퍼레이션(이하 “회사”라 함)에서 제공하는 전자지급결제대행서비스 및 선불전자지급서비스(이하 “서비스”)를 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.</p><p><br>&nbsp;</p><p><strong>제 2조 용어의 정의</strong></p><p>① 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.</p><div style="padding-left:20px;"><p>1. “전자금융거래”란 회사가 전자적 장치를 통하여 전자금융업무를 제공하고, 회원이 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</p><p>2. “전자지급결제대행서비스”란 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.</p><p>3. “전자지급수단”이란 전자금융거래법에서 정하는 전자적 방법에 따른 지급수단을 말합니다.</p><p>4. “선불전자지급수단”이란 이전 가능한 금전적 가치가 전자적 방법으로 저장되어 발행된 증표 또는 그 증표에 관한 정보로서 전자금융거래법상 선불전자지급수단을 말합니다.</p><p>5. “직불전자지급수단”이란 회원과 가맹점 간에 전자적 방법에 따라 금융회사의 계좌에서 자금을 이체하는 등의 방법으로 재화 또는 용역의 제공과 그 대가의 지급을 동시에 이행할 수 있도록 회사가 발행한 증표 또는 그 증표에 관한 정보를 말합니다.</p><p>6. “회원”이란 이 약관에 동의하고 회사가 정한 회원가입 절차를 거쳐서 회사의 전자금융거래 관련 서비스를 이용하는 자를 말하며 이용자로도 지칭합니다.</p><p>7. “제휴사”란 회사가 회원에게 전자금융거래 관련 서비스를 제공하기 위하여 회사와 계약을 체결하여 협력하는 제3자를 의미합니다.</p><p>8. “아이디(ID)”란 회원이 이 약관 및 개인정보 처리사항에 동의한 후 회사가 회원을 식별하고 서비스를 제공하기 위하여 회원에게 부여한 문자 또는 숫자의 조합으로, 회사는 아이디를 전화번호 등으로 정할 수 있습니다. 회원 1인당 한 개의 아이디만 발급 및 이용 가능합니다.</p><p>9. “결제비밀번호”란 회원이 결제시점에 사용하는 추가 인증 수단으로써 회원이 스스로 설정하여 회사에 등록한 숫자 또는 지문 등 생체정보를 말합니다. 다만, 회사는 서비스 특성에 따라 추가 인증 수단을 변경할 수 있습니다.</p><p>10. “운영자”란 서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 말합니다.</p><p>11. “서비스중지”란 회사가 정한 요건에 따라 일정기간 동안 서비스의 제공을 중지하는 것을 말합니다.</p><p>12. “접근매체”란 전자금융거래에 있어서 거래지시를 하거나 회원 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함), 전자서명법 상의 인증서, 회사에 등록된 회원번호, 회원의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법에서 정하고 있는 것을 말합니다.</p><p>13. “거래지시”란 회원이 이 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</p><p>14. “오류”란 회원의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 회원의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</p><p>15. “전자지급거래”란 지급인이 전자지급수단을 이용하여 수취인에게 자금을 이동하게 하는 전자금융거래를 통칭합니다.</p><p>16. “충전”이란 선불전자지급수단의 일정금액을 확보하기 위하여 회원이 등록한 지불수단을 통해 선불전자지급수단을 구매하거나 회사가 제공하는 서비스 등에서의 활동을 통하여 선불전자지급수단을 적립 받는 것을 말합니다.</p><p>17. “자동충전”이란 회원이 보유한 선불전자지급수단이 회사가 정한 기준금액에 도달하는 경우 회원이 사전에 등록한 지불수단을 통해 자동으로 충전되는 것을 말합니다.</p></div><p>② 본 약관에서 별도로 정하지 아니한 용어의 정의는 「전자금융거래법」 등 관련 법령에서 정하는 바에 따릅니다.</p><p>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근 매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.</p><p><br>&nbsp;</p><p><strong>제 8조 거래내용의 확인</strong></p><p>① 회사는 인터넷사이트 등에 해당 서비스 조회 화면을 통하여 이용자가 자신의 거래내용을 확인할 수 있도록 하며, 이용자가 거래내용에 대해 서면교부를 요청하는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송, 우편 또는 직접 교부의 방법으로 거래내용에 관한 서면을 교부합니다.</p><p>② 회사는 제1항에 따른 이용자의 거래내용 서면교부 요청을 받은 경우 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야 하며, 거래내용을 제공할 수 없는 기간은 제1항의 거래내용에 관한 서면의 교부기간에 산입하지 아니합니다.</p><p>③ 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록, 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 한다.</p><p>④ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</p><div style="color:red;padding-left:20px;"><p><span style="color:hsl(0,0%,0%);">- 주소 : 서울특별시 서초구 강남대로 351, 청남빌딩 12층</span></p><p><span style="color:hsl(0,0%,0%);">- 이메일 : help@GOTGONGBANG.im</span></p><p><span style="color:hsl(0,0%,0%);">- 전화번호 : 1600-4173</span></p></div><p><br>&nbsp;</p><p><strong>제 9조 오류의 정정 등</strong></p><p>① 이용자는 전자금융거래서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</p><p>② 회사는 제1항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날로부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.</p><p><br>&nbsp;</p>
										<p><strong>제 10조 전자금융거래 기록의 생성과 보존</strong></p><p>① 회사는 이용자가 이용한 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</p><p>② 제1항에 따라 회사가 보존하여야 하는 기록의 종류 및 보존기간은 제8조 제3항에서 정한 바에 따릅니다.</p><p><br>&nbsp;</p><p><strong>제 11조 이용자정보에 대한 비밀보장</strong></p><p>① 회사는 전자금융업무를 수행함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 관련 법령에서 정한 경우를 제외하고는 해당 이용자의 동의를 얻지 아니하고 제3자에게 제공하거나 업무상 목적 외에 사용하지 아니합니다.</p><p>② 회사는 이용자가 안전하게 전자금융거래서비스를 이용할 수 있도록 이용자의 개인정보보호를 위하여 개인정보취급방침을 운영합니다. 회사의 개인정보취급방침은 서비스 홈페이지 또는 서비스 페이지에 링크된 화면을 통하여 확인할 수 있습니다.</p><p><br>&nbsp;</p><p><strong>제 12조 거래지시의 철회 등</strong></p><p>① 이용자가 회사의 전자금융거래서비스를 이용하여 전자지급거래를 한 경우, 이용자는 지급의 효력이 발생하기 전까지 본 약관에서 정한 바에 따라 제8조 제4항의 기재된 담당자에게 연락처 또는 전자문서의 전송(전자우편을 이용한 전송을 포함합니다)에 대한 방법으로 거래지시를 철회할 수 있습니다.</p><p>② 이용자는 전자지급의 효력이 발생한 경우에 「전자상거래 등에서의 소비자보호에 관한 법률」에 따른 청약철회의 방법에 따라 해당 결제대금을 반환 받을 수 있습니다.</p><p>③ 제1항 또는 제2항에서 정한 지급의 효력이 발생하는 시기는 다음 각 호의 어느 하나에서 정한 때에 생깁니다.</p><div style="padding-left:20px;"><p>1. 선불전자지급수단으로 지급하는 경우 : 거래 지시된 금액의 정보가 수취인이 지정한 전자적 장치에 도달한 때</p><p>2. 그 밖의 전자지급수단으로 지급하는 경우 : 거래 지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관 또는 전자금융업자의 전자적 장치에 입력이 끝난 때</p></div><p><br>&nbsp;</p><p><strong>제 13조 회사의 책임</strong></p><p>① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에서 제3항까지의 관리 의무를 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.</p><p>② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본 조 제1항 단서에 해당하거나 법인(「중소기업법」 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.</p><p>③ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.</p><p><br>&nbsp;</p><p><strong>제 14조 선불충전금의 관리 및 관련 공시</strong></p><p>① 회사는 이용자의 선불충전금을 고유재산과 구분하여 외부 금융기관에 신탁하거나 지급보증보험에 가입하여야 합니다.</p><p>② 회사는 매 영업일 마다 선불충전금 총액과 신탁금 등 실제 운용중인 자금 총액의 상호 일치 여부를 점검하여야 하며, 매 분기말(분기 종료 후 10일 이내) 선불충전금 규모 및 신탁내역, 지급보증보험 가입여부, 부보 금액 등을 홈페이지(www.checkpay.co.kr) 등에 공시하여야 합니다.</p><p>③ 회사는 다음 각 호의 어느 하나에 해당하는 경우 선불충전금을 신탁회사 및 보험회사 등을 통하여 이용자에게 우선 지급하여야 합니다. 이 경우 1개월 이내에 그 사실과 선불충전금의 지급시기, 지급장소, 그 밖에 선불충전금의 지급과 관련된 사항을 둘 이상의 일간신문에 공고하고, 인터넷 홈페이지 등을 통하여 공시하여야 합니다.</p><div style="padding-left:20px;"><p>1. 전자금융거래업자 등록이 취소되거나 말소된 경우</p><p>2. 해산 또는 선불전자지급수단 발행 및 관리 업무를 폐지한 경우</p><p>3. 파산선고를 받은 경우</p><p><br>&nbsp;</p><p><strong>제 18조 약관 외 준칙</strong></p><p>회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 우선하여 적용하며, 본 약관에서 정하지 아니한 사항(용어의 정의 포함)에 대하여는 「전자금융거래법」, 「여신전문금융업법」 등 소비자보호에 관한 법령 및 개별 약관에서 정한 바에 따릅니다.</p><p><br>&nbsp;</p><p><strong>제 19조 관할</strong></p><p>회사와 이용자 간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</p><p><br>&nbsp;</p><p><strong>제2장 선불전자지급수단의 발행 및 관리 서비스</strong></p><p><strong>제 20조 발행 및 관리</strong></p><p>회사는 선불전자지급수단을 발행하고 이를 관리할 권한을 가집니다.</p><p><br>&nbsp;</p><p><strong>제 21조 착오송금</strong></p><p>① 이용자가 착오로 수취금융회사, 수취계좌번호 등을 잘못 기재하거나 입력하여 수취인에게 선불전자지급수단의 자금이 이동(이하 “착오송금”이라 합니다.)된 경우, “회사”에 통지하여 “회사” 또는 수취 금융회사 등을 통해 수취인에게 연락하여 착오 송금액 반환을 요청할 수 있습니다.</p><p>② “회사”는 수취인에 대한 연락 사실, 수취인의 반환의사 유무, 수취인이 반환의사가 없는 경우 그 사유 등 고객 요청사항에 대한 처리결과 또는 관련 처리 진행상황을 이용자가 전항의 “착오송금” 발생사실을 “회사”에 통지한 날로부터 15일 이내에 이용자에게 알려야 합니다.</p><p>③ “회사” 또는 수취 금융회사를 통한 착오송금 반환 요청에도 수취인이 반환하지 않는 경우, 이용자는 「예금자보호법」 제5장의 착오송금 반환지원에 따라 예금보험공사에 착오송금 반환지원제도 이용을 신청할 수 있습니다. (개정 「예금자보호법」 시행일인 ’21.7.6’ 이후 발생한 “착오송금”에 대해 신청 가능)</p><p>④ 단, 예금보험공사가 수취인의 실지명의를 취득할 수 없는 연락처를 통한 송금 거래는 반환지원 신청이 제한됩니다.</p><p>⑤ “회사”는 예금보험공사가 착오송금 반환지원 업무의 원활한 수행을 위해 “회사”에 “착오송금” 수취인의 반환불가 사유, 실지명의, 주소 및 연락처, “착오송금” 발생 현황 등의 자료를 요청하는 경우 정당한 사유가 없으면 이에 따라야 합니다.</p><p>⑥ 이용자가 예금보험공사를 통해 착오송금 반환지원을 신청한 내역이 다음 각 호에 해당하는 경우 관련 법령에 따라 예금보험공사의 지원 절차가 중단될 수 있습니다.</p><div style="padding-left:20px;"><p>1. 이용자가 거짓이나 부정한 방법으로 반환지원을 신청한 경우</p><p>2. “착오송금”이 아님이 객관적인 자료로 확인되는 경우</p><p>3. 신청일 이전 반환 지원을 신청한 “착오송금”과 관련된 소송 등이 진행 중이거나 완료된 경우</p><p>4. 그 밖에 예금보험위원회가 인정하는 경우</p></div><p><br>&nbsp;</p><p><strong>제 22조 환급</strong></p><p>① 이용자는 선불전자지급수단의 보유일로부터 7일 이내에 보유액 전액을 환급 받을 수 있습니다.</p><p>② 이용자는 보유 중인 선불전자지급수단 환급을 회사에 요구할 경우 환불수수료를 공제한 미상환잔액에 대해 환급 받을 수 있습니다.</p><p>③ 제2항 본문에도 불구하고 다음 각 호의 어느 하나에 해당하는 경우에는 선불전자지급수단에 기록된 잔액의 전부를 지급합니다.</p><div style="padding-left:20px;"><p>1. 천재지변 등의 사유로 가맹점이 재화 등을 제공하기 곤란하여 선불전자지급수단을 사용하지 못하게 된 경우</p><p>2. 선불전자지급수단의 결함으로 가맹점이 재화 등을 제공하지 못하는 경우</p><p>3. 선불전자지급수단 최종 충전 시점에 기재된 금액의 60%이상(1만원 이하는 80%)사용시</p></div><p>④ 이용자는 회사에서 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며 <p><br>&nbsp;</p><p><strong>제 23조 환수</strong></p><p>회사는 이용자가 보유중인 선불전자지급수단이 거짓이나 그 밖의 부정한 방법으로 보유된 경우에는 이를 환수할 수 있습니다.</p><p><br>&nbsp;</p><p><strong>제 24조 선불전자지급수단의 한도 등</strong></p><p>① 회사는 선불전자지급수단에 대해 충전, 보유, 이용 등 한도를 지정할 수 있습니다.</p><p>② 회사는 서비스 페이지 등을 통하여 이용한도 등을 공지 합니다.</p><p><br>&nbsp;</p><p><strong>제 25조 유효기간</strong></p><p>① 충전일로부터 5년이 경과하는 선불전자지급수단은 상법상의 상사채권소멸시효가 완성되어 이용자는 발행자 등에게 환불 및 잔액반환을 요청할 수 없습니다.</p><p>② 회사는 서비스 페이지 등을 통하여 유효기간을 공지합니다.</p><p>③ 회사는 유효기간이 도래하기 7일전 통지를 포함하여 3회 이상 이용자에게 유효기간의 도래 및 연장 여부를 문자 메세지 등의 방법으로 통지합니다.</p><p><br>&nbsp;</p><p>[부칙]</p><p style="color:red;"><span style="color:hsl(0,0%,0%);">본 약관은 2022년 01월 31일부터 적용됩니다.</span></p>
								</div>
							</dd>
						</div>
						

					
				
			
					<div class="sign-up__terms-item accordion__item">
						<dt class="sign-up__terms-header accordion__header">
							<label class="form-check">
								<input class="form-check__input checkone check4" type="checkbox" name="agree_yn"><span class="form-check__name">마케팅 정보 수신동의 (선택)</span>
							</label>
							<button class="sign-up__terms-trigger accordion__trigger more4 btn" type="button"><span class="sign-up__terms-trigger-name">더보기</span></button>
						</dt>
						<dd class="sign-up__terms-collapse accordion__collapse dd4">
							<div class="sign-up__terms-body accordion__body div4 div_h4">

								<p>마케팅 정보 수신 여부 및 마케팅을 위한 개인정보 수집이용을 거부하실 수 있으며, 거부 시에도 ‘주식회사 하이픈코퍼레이션’의 서비스를 이용하실 수 있으나, 동의를 거부한 경우 각종 소식 및 이벤트 참여에 제한이 있을 수 있습니다.&nbsp;&nbsp;&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td style="background-color:hsl(0, 0%, 90%);"><strong>개인정보 수집 항목</strong></td><td style="background-color:hsl(0, 0%, 90%);"><strong>개인정보 수집 이용 목적</strong></td><td style="background-color:hsl(0, 0%, 90%);"><strong>보유 및 이용기간</strong></td></tr><tr><td>이름, 휴대폰번호, 이메일</td><td><p>- 이벤트 운영 및 광고성 정보 전송</p><p>- 서비스 관련 정보 전송</p></td><td>이용자가 동의를 철회하거나, 탈퇴시까지 보유•이용</td></tr></tbody></table></figure><p>&nbsp;</p>
							</div>
						</dd>
					</div>
					<div class="sign-up__terms-item accordion__item">
						<dt class="sign-up__terms-header accordion__header">
							<label class="form-check form-check--add-info">
								<input class="form-check__input checkone check5" type="checkbox" name="agree_yn"><span class="form-check__name">마케팅 활용에 의한 개인정보 3자 제공 동의(선택)<span class="form-check__name-info">*미동의하셔도 서비스 이용에는 지장이 없으나, 프로모션 등 경품이벤트 참여가 제한됩니다.</span></span>
							</label>
							<button class="sign-up__terms-trigger accordion__trigger more5 btn" type="button" data-accordion-index="5"><span class="sign-up__terms-trigger-name">더보기</span></button>
						</dt>
						<dd class="sign-up__terms-collapse accordion__collapse dd5">
							<div class="sign-up__terms-body accordion__body div5 div_h5">
								<p><strong>[개인정보 제3자 제공 동의]</strong><br>&nbsp;</p><p>1. 개인정보를 제공받는 자 : 주식회사 크리에이팁, 주식회사 티사이언티픽</p><p>2. 개인정보를 제공받는 자의 이용 목적 : 이벤트 진행 및 경품 배송</p><p>3. 제공하는 개인정보의 항목 : 이름, 휴대폰번호</p><p>4. 개인정보를 제공받는 자의 보유·이용 기간: 이벤트 종료 후 즉시 파기</p><p>5. 개인정보의 제3자 제공에 대한 동의를 거부할 수 있으며, 이 경우 이벤트 참여가 제한됩니다.</p>
							</div>
						</dd>
					</div>
					</dl>
					<div class="form-field__feedback agree_f" data-field-feedback="agree_yn"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;필수 이용약관에 동의해 주세요.</div>
					<div class="sign-up__step-buttons">
						<button id="yh_button" class="button sign-up__step-button btn btn_next1" type="button">다음</button>
					</div>
				</fieldset>

<!-- =====================================  2 ================================================= -->				
				<fieldset class="sign-up__step step2">
					<legend class="sign-up__legend">이메일 인증</legend>
					<div class="sign-up__step-header">
						<h3 class="sign-up__step-title">이메일 인증</h3>
						<p class="sign-up__step-description">GOTGONGBANG에서는 안전한 회원가입을 위해<br><strong class="sign-up__step-description-point"> 본인확인</strong>을 받고 있습니다. 이메일 인증을 진행해주세요.</p>
					</div>
					<div class="sign-up__step-body">
						<div class="form-field">
							<h4 class="form-field__title">이메일</h4>
							<div class="form-field__group form-field__group--input-button">
								<input class="form-input" type="email" id="email" name=email placeholder="이메일주소를 입력하세요." title="이메일 입력">
								<button class="button btn email-check-btn" type="button">인증번호 받기</button>
							</div>
							<div class="form-field__feedback user_email_f1" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일을 입력해주세요.</div>
							<div class="form-field__feedback user_email_f2" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일 형식이 올바르지 않습니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">인증번호</h4>
							<input class="form-input" type="text" id="email_check_number" name="auth_code" maxlength="6"  disabled="disabled" placeholder="인증번호를 입력하세요.(5분 이내)">
							<div class="form-field__info">*이메일이 수신되지 않았을 경우 스팸메일함을 확인해주세요.</div>
							<div class="form-field__feedback email_check_number_f" data-field-feedback="auth_code"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;인증번호를 정확히 입력하세요.</div>
						</div>
					</div>
					<div class="sign-up__step-buttons">
						<button class="button button--outline sign-up__step-button btn btn_prev2" type="button">이전</button>
						<button id="yh_button" class="button sign-up__step-button btn btn_next2" type="button">다음</button>
					</div>
				</fieldset>

<!-- =====================================  3 ================================================= -->	
				<fieldset class="sign-up__step step3">
					<legend class="sign-up__legend">회원정보 입력</legend>
					<div class="sign-up__step-header">
						<h3 class="sign-up__step-title">회원정보 입력</h3>
						<p class="sign-up__step-description">회원님의 정보를 입력해주세요.</p>
					</div>
					<div class="sign-up__step-body">
						<div class="form-field">
							<h4 class="form-field__title">이름 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
								<input class="form-input" type="text" name="name" id="name" placeholder="이름을 입력하세요." title="이름 입력">
							<div class="form-field__feedback user_name_f" data-field-feedback="user_name"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이름을 입력하세요.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">휴대전화번호 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
							<input class="form-input" type="tel" name="mobile" id="mobile" maxlength="11" placeholder="휴대전화번호를 입력하세요." title="휴대전화번호 입력" >
							<div class="form-field__feedback user_phone_f" data-field-feedback="user_phone"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;휴대전화번호 형식이 올바르지 않습니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">이메일 주소 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
							<input class="form-input" type="email" name="email" id="email" placeholder="이메일을 입력하세요." title="이메일">
							<div class="form-field__info form-field__info--point">*등록된 정보를 이용하여 아이디, 비밀번호를 찾을 수 있으며, GOTGONGBANG으로부터 알림을 받습니다.</div>
							<div class="form-field__feedback user_email_f1" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일을 입력해주세요.</div>
							<div class="form-field__feedback user_email_f2" data-field-feedback="user_email"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;이메일 형식이 올바르지 않습니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">아이디 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
							<div class="form-field__group form-field__group--input-button">
								<input class="form-input" type="text" name="user_id_pk" id="user_id_pk" minlength="6" maxlength="20" placeholder="아이디를 입력하세요. (중복확인)" title="아이디 입력">
								<button class="button btn btn_userid" type="button">중복확인하기</button>
							</div>
							<div class="form-field__feedback user_id_f" data-field-feedback="user_id"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;아이디 중복확인이 필요합니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">비밀번호 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
							<input class="form-input" type="password" name="pwd" id="pwd" minlength="8" maxlength="20" placeholder="비밀번호를 입력하세요." title="비밀번호 입력">
							<div class="form-field__info">비밀번호는 8자~15자의 영문, 숫자, 특수문자(@$!%?&)를 2가지 이상을 조합하여 설정해주세요.</div>
							<div class="form-field__feedback user_passwd_f1" data-field-feedback="user_passwd"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;비밀번호를 입력하세요.</div>
							<div class="form-field__feedback user_passwd_f2" data-field-feedback="user_passwd"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;비밀번호 형식이 올바르지 않습니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">비밀번호 확인 <strong class="sign-up__terms-required"><span class="sign-up__terms-required-text"></span> *</strong></h4>
							<input class="form-input" type="password" name="user_passwd_check" id="user_passwd_check" placeholder="비밀번호를 재입력하세요." title="비밀번호 재입력">
							<div class="form-field__feedback user_passwd_check_f" data-field-feedback="user_passwd_check"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;비밀번호를 재입력하세요.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">생년월일</h4>
							<input style="width: 40%" class="form-input" type="text" name="birthday" id="user_birth" maxlength="8" placeholder="예시)20230101 입력하세요." title="생년월일 입력">
							<div class="form-field__feedback user_birth_f" data-field-feedback="user_birth"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;생년월일 형식이 올바르지 않습니다.</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">성 별</h4>
							<div class="sign-up__form-radio-group">
								<input class="sign-up__form-radio-input" id="gender" type="radio" name="gender" value="1" checked>
								<label class="sign-up__form-radio-text" for="male">남 자&nbsp;&nbsp;&nbsp;</label>
								<input class="sign-up__form-radio-input" id="gender" type="radio" name="gender" value="2">
								<label class="sign-up__form-radio-text" for="female">여 자</label>
								<!-- <input class="sign-up__form-radio-input" id="company-type-3" type="radio" name="company_type" value="2">
								<label class="sign-up__form-radio-text" for="company-type-3">법인사업자</label><span class="sign-up__form-radio-bar"></span><span class="sign-up__form-radio-current"></span> -->
							</div>
						</div>
						<div class="form-field">
							<h4 class="form-field__title">우편번호</h4>
							<input style="width: 20%" class="form-input" type="text" id ="post_code" name="post_code" placeholder="우편번호찾기" title="우편번호 입력" readonly/>
							<img id="zipcodeSearch" src="<%=ctxPath%>/resources/img/b_zipcode.gif" style="vertical-align: middle;" />
							<div class="form-field__feedback postcode_f" data-field-feedback="postcode"><i class="fa-solid fa-circle-exclamation" style="color: #f20707;"></i>&nbsp;&nbsp;우편번호를 입력하세요.</div>
							<h4 class="form-field__title">주소</h4>
					         <td style="width: 80%; text-align: left;">
					            <input type="text" id="address" name="address" class="form-input" placeholder="주소" readonly/><br/>
					            <input type="text" id="detail_address" name="detail_address" class="form-input" style="width: 350px;" placeholder="상세주소" />&nbsp;<input type="text" id="extra_address" name="extra_address" class="form-input" style="width: 350px;" placeholder="참고항목" /> 
					            <div class="form-field__feedback" data-field-feedback="promotional_code"></div>
         					</td>
						</div>
					</div>
					<div class="sign-up__step-buttons">
						<button class="button button--outline sign-up__step-button btn btn_prev3" type="button">이전</button>
						<button id="yh_button" class="button sign-up__step-button btn btn_next3" type="button">다음</button>
					</div>
				</fieldset>
			</form>
<!-- =====================================  4 ================================================= -->					
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