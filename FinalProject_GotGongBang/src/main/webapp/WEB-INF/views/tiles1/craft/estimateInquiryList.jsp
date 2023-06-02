<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		Fancybox.bind("[data-fancybox]", {
			 
		});

		
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
					<c:if test="${not empty requestScope.ovoList}">
						<c:forEach var="ovo" items="${requestScope.ovoList}" varStatus="status">
						<tr>
						<td>
							<div class="img-estimate">
							<c:forEach var="wholeImg" items="${ovo.wholeImgList}" varStatus="wholeIdx">
								<c:if test="${wholeIdx.index eq 1}">
								<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" data-fancybox="gallery${status.index}" >
									<img src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" />
								</a>
								</c:if>
								
								<c:if test="${wholeIdx.index ne 1}">
								<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" data-fancybox="gallery${status.index}" >
									<img style="display: none" src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" />
								</a>
								</c:if>
							</c:forEach>
								
							</div>
						</td>
	
						<td>
							<div class="txt-estimate-info">
							<ul>
								<li><div class="estimate-info-tit">의뢰 날짜 :</div> 	<strong>${ovo.order_date}</strong></li>
								<li><div class="estimate-info-tit">품목명 :</div> 		<strong>${ovo.order_num_pk}</strong></li>
								<li><div class="estimate-info-tit">브랜드 :</div> 		<strong>${ovo.brand_name}</strong></li>
								<li><div class="estimate-info-tit">수선 유형 :</div>
									<c:if test="${not empty ovo.requests and ovo.requests ne ' '}">
									  <ul>
									    <c:forTokens var="requests" items="${ovo.requests}" delims=",">
									      <li class="requests-item">${requests}</li>
									    </c:forTokens>
									  </ul>
									</c:if>
								</li>
							</ul>
							</div>
						</td>
	
						<td>
						<button class="btn-estimateDetail" onclick="openBidPage()">상세보기</button>
						<div>견적제안 대기중</div>
						</td>
						</tr>
						</c:forEach>
					</c:if>
				

				</tbody>
			</table>
			
			<div class="block-pagebar">
				${requestScope.pageBar}
			</div>
		</div>
	</div>
</div>