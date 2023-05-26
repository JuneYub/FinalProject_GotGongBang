<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		
		
	});
	
	function openBidPage() { // 파라미터로 공방 아이디랑 견적 아이디를 받을 예정
		url = "<%= ctxPath%>/estimate_inquiry_list/bid.got";
		const pop_width = 600;
		const pop_height = 700;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2);
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2);
		
		window.open(url, "bidEstimate", "left= "+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
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
				<form>
				<table class="tbl-edit-myInfo">
					<tbody>
						<tr><th>이름</th> <td>테스트이름</td></tr>
						<tr><th>사용자ID</th> <td>testID</td></tr>
						<tr><th>비밀번호</th> <td></td></tr>
						<tr><th>생년월일</th> <td>년 월 일</td></tr>
						<tr><th>E-mail</th> <td>test@naver.com</td></tr>
						<tr><th>휴대폰번호</th> <td>01012344545</td></tr>
						<tr><th>주소</th> <td>주소 API</td></tr>
					</tbody>
				</table>
				<div class="btn-center">
					<a class="btn-edit-info">수정하기</a>
				</div>
				
				</form>
			
		</div>
	</div>
</div>