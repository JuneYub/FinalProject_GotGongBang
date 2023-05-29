<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>
 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(document).ready(function() {
		$( function() {
			$( "#editBirthDay" ).datepicker({
				 changeMonth: true,
				 changeYear: true,
				 showMonthAfterYear: true
			});
		} );
		
		$("select#emailDomain").bind("change", function(){
			emailDomainChange();
		})
		
	});
	
	function openBidPage() { // 파라미터로 공방 아이디랑 견적 아이디를 받을 예정
		url = "<%= ctxPath%>/estimate_inquiry_list/bid.got";
		const pop_width = 600;
		const pop_height = 700;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2);
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2);
		
		window.open(url, "bidEstimate", "left= "+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}
	
	function checkEditMyInfo() {
		var regName = /^[가-힣]{2,6}$/;  
		var regMobile= /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		var regPost = /^d{5}$/g;
		
		var editName = $("input#editName").val();
		if(editName.trim() != "") {
			const boolEditName = regName.test(editName);
			if(!boolEditName) {
				alert("이름은 2~6자로 이루어진 한글로 구성되어 있어야 합니다");
				$("input#editName").focus();
				return;
			}
		}
		
		var editEmail = $("input#editEmail").val();
		if(editEmail.trim() != "") {
			const boolEditEmail = regEmail.test(editEmail);
			if(!boolEditEmail) {
				alert("이메일 형식이 맞지 않습니다");
				$("input#editEmail").focus();
				return;
			}
		}
		
		var editMobile = $("input#editMobile").val();
		if(editMobile.trim() != "") {
			const boolEditMobile = regMobile.test(editMobile);
			if(!boolEditMobile) {
				alert("휴대전화 번호 형식이 맞지 않습니다");
				$("input#editMobile").focus();
				return;
			}
		}
		
		var editPost = $("input#postcode")
		if(editPost.trim() != "") {
			const boolEditPost = regPost.test(editPost);
			if(!boolEditPost) {
				alert("우편번호 형식이 맞지 않습니다");
				$("input#postcode").val("");
				$("input#postcode").focus();
				return;
			}
		}
		
		const frm = document.editMyInfo;
		frm.action = "<%= ctxPath%>/editMyInfo.action"
		frm.submit();

		
	}
	
	function emailDomainChange() {
		var editEmail = $("input#editEmail").val();
		var emailDomain = $("select#emailDomain").val();
		
		if(isAtSignExist(editEmail)) {
			var indexAtSign = editEmail.indexOf('@');
			editEmail = editEmail.slice(0, indexAtSign+1);
			
			if(emailDomain != "직접입력") {
				editEmail += emailDomain;
			}
			$("input#editEmail").val(editEmail);
		}
		
		else {
			editEmail += "@";
			
			if(emailDomain != "직접입력") {
				editEmail += emailDomain;
			}
			
			$("input#editEmail").val(editEmail);
		}	
	}
	
	function isAtSignExist(editEmail) {
		var num = editEmail.indexOf('@');
		if(num == -1) {
			return false;
		}
		else {
			return true;
		}
	};
	
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
</script>

<!-- 본문시작 -->
<div class="myPage-container">
	<div class="myPage-tit"><h1>마이 페이지</h1></div>
	<div class="myPage-contents">
		<div class="myPage-menu-list">
			<ul>
				<li class=""><a class="" href="<%= ctxPath%>/estimate_inquiry_list.got">견적 목록</a></li>
				<li class=""><a class="" href="<%= ctxPath%>/repair_history_list.got">수선 내역 관리</a></li>
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/edit_craft_user_info.got">개인 정보 변경</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>회원 정보 설정</h4>
				<form name="editMyInfo">
				<table class="tbl-edit-myInfo">
					<tbody>
						<tr>
						<th>이름</th> 
						<td><input type="text" id="editName" autocomplete="off" /> </td>
						</tr>
						
						<tr>
						<th>사용자ID</th>
						<td><input type="text" readonly="readonly"/></td>
						</tr>
						
						<tr>
						<th>새 비밀번호</th>
						<td><input type="text" id="editPw" autocomplete="off" /></td>
						</tr>
						
						<tr>
						<th>새 비밀번호 확인</th>
						<td><input type="text" id="editPwCheck" autocomplete="off" /></td>
						</tr>
						
						<tr><th>생년월일</th> 
						<td>
						<input type="text" id="editBirthDay" autocomplete="off" readonly="readonly">
						</td>
						</tr>
						
						<tr>
						<th>E-mail</th> 
						<td>
						<input id="editEmail" />
                        <select id="emailDomain" name="emailDomain_select" class="emailDomain_select">
	                        <option value="직접입력">직접입력</option>
	                        <option value="naver.com">naver.com</option>
	                        <option value="hanmail.net">hanmail.net</option>
	                        <option value="daum.net">daum.net</option>
	                        <option value="nate.com">nate.com</option>
	                        <option value="hotmail.com">hotmail.com</option>
	                        <option value="gmail.com">gmail.com</option>
	                         <option value="icloud.com">icloud.com</option>
                        </select>
                        </td>
						
						</tr>
						<tr><th>휴대폰번호</th> 
						<td><input type="text" id="editMobile" autocomplete="off" placeholder="'-' 없이 번호만 적어주세요"/></td>
						</tr>
						
						<tr>
						<th>주소</th>
					 	<td>
						<div class="address_postcode">
							<input type="text" id="postcode" name="postcode" placeholder="우편번호">
							<input type="button" id="zipcodeSearch" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						<div class="address_input">
							<input type="text" id="address" name="address" placeholder="주소" readonly="readonly"><br>
							<input type="text" id="detailAddress"  name="detailAddress" placeholder="상세주소" >
							<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly="readonly">
						</div>                  	
                        </td>
						</tr>
					</tbody>
				</table>
				<div class="btn-center">
					<a class="btn-edit-info" onclick="checkEditMyInfo()">수정하기</a>
				</div>
				
				</form>
			
		</div>
	</div>
</div>