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
				<li class="menu-list-selected"><a class="menu-list-selected" href="">입찰</a></li>
				<li><a class="" href="">수선 내역 관리</a></li>
				<li><a class="" href="">개인 정보 변경</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<table class="tbl-estimateList">
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
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
					<div>입찰 대기중</div>
					</td>
					</tr>
					
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
					<div>입찰 대기중</div>
					</td>
					</tr>
					
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<ul>
							<li>의뢰 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
					</td>

					<td>
					<button class="btn-estimateDetail" onclick="openBidPage()">상세 보기</button>
					<div>입찰 대기중</div>
					</td>
					</tr>
				</tbody>
			</table>
		
		</div>
	</div>
</div>