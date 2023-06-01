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
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/estimate_inquiry_list.got">견적 목록</a></li>
				<li><a class="" href="<%= ctxPath%>/repair_history_list.got">수선 내역 관리</a></li>
				<li><a class="" href="<%= ctxPath%>/edit_craft_user_info.got">개인 정보 변경</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>견적 목록</h4>
			<table class="tbl-myPageList">
				<thead>
					<tr>
					<th>사진</th>
					<th>정보</th>
					<th>상세 보기/상태</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<div class="txt-estimate-info">
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
						</div>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
					<div>견적제안 대기중</div>
					</td>
					</tr>
					
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<div class="txt-estimate-info">
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
						</div>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
					<div>견적제안 대기중</div>
					</td>
					</tr>		
			
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<div class="txt-estimate-info">
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
						</div>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
					<div>견적제안 대기중</div>
					</td>
					</tr>					

				</tbody>
			</table>
			
			<div class="block-pagebar">
				${requestScope.pageBar}
			</div>
		</div>
	</div>
</div>