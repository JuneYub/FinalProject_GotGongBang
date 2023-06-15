<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>
 
<script>
	
	$(document).ready(function(){
		
		//확인버튼 클릭시
		$("a#btnSubmit").click(function(){
			goCheck();
		});
		
		
	});
	
	/* 제출버튼을 누르기 전에 체크박스를 눌렀는지 */
	function goCheck(){
		
		const inputPasswd = $("input#passwd").val().trim();
		
		
		if(inputPasswd== ""){
			alert("암호를 입력하세요!");
			return;
		}
		
		//정보삭제동의에 체크하지 않은 경우라면
		if ( ! $("input#chkboxInfo").prop("checked") ){
			alert("[정보삭제동의]항목은 필수항목입니다.");
			return;
		}

		
	
		const frm = document.editMyInfo;
		frm.action = "<%=request.getContextPath()%>/delete_partner_end.got";
		
		frm.method = "post";
		frm.submit();
	}//goLogin()
	   

</script>

<!-- 본문시작 -->
<div class="myPage-container">
	<div class="myPage-tit"><h1>마이 페이지</h1></div>
	<div class="myPage-contents">
		<div class="myPage-menu-list">
			<ul>
				<li class=""><a class="" href="<%= ctxPath%>/proposal_list.got">견적 제안서 목록</a></li>
				<li class=""><a class="" href="<%= ctxPath%>/order_list.got">주문 내역</a></li>
				<li ><a class="" href="<%= ctxPath%>/edit_user_info.got">개인 정보 변경</a></li>
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/delete_partner.got">회원 탈퇴</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>회원 탈퇴</h4>
				<form id="editMyInfo" name="editMyInfo">
				<table class="tbl-edit-myInfo">
					<tbody>
						<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="passwd" name="passwd" autocomplete="off" /></td>
						</tr>
						
						<tr>
						
						<th>정보 삭제 동의</th>
						<td> 
							<input type="checkbox" style="zoom: 1.5;" id="chkboxInfo"/>
  							<label class="spanS" for="chkboxInfo">탈퇴 후에는 복구가 불가능하며, 약관에 따라 일정 시일 후 모든 정보가 삭제됩니다.</label>
  						</td>
						</tr>
	
					</tbody>
				</table>
				<div class="btn-center">
					<a class="btn-edit-info" id="btnSubmit">탈퇴하기</a>
				</div>
				
				</form>
			
		</div>
	</div>
</div>