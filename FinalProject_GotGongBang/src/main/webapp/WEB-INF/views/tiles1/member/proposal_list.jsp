<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		Fancybox.bind("[data-fancybox]", {
		});
	});
	
	function openBidPage(order_num) { // 파라미터로 공방 아이디랑 견적 아이디를 받을 예정
		
		url = "<%= ctxPath%>/estimate_inquiry_list/bid.got?order_num="+order_num;
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
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/proposal_list.got">견적 제안서 목록</a></li>
				<li><a class="" href="<%= ctxPath%>/order_list.got">주문 내역</a></li>
				<li><a class="" href="<%= ctxPath%>/edit_user_info.got">개인 정보 변경</a></li>
				<li><a class="" href="<%= ctxPath%>/delete_user.got">회원 탈퇴</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>견적 제안서 목록</h4>
			<table class="tbl-myPageList">
				<thead>
					<tr>
					<th>공방명</th>
					<th>견적서 내용</th>
					<th>선정 및 결제</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${empty requestScope.proposalList}">
					<tr><td colspan="3">조회할 견적 정보가 없습니다</td></tr>
					</c:if>
					<c:if test="${not empty requestScope.proposalList}">
						<c:forEach var="proposal" items="${requestScope.proposalList}">
						<tr>
						<td>
							<a href="">${proposal.craft_name}</a>
						</td>
	
						<td>
							<div class="txt-estimate-info">
							<div class="txt-info-center"><strong>내 요청 정보</strong></div>
							<ul>
								<input type="hidden" value="${proposal.estimate_num_pk}" />  
								<li><div class="proposal-info-tit">품목명 :</div> 		<strong>${proposal.order_product_type}</strong></li>
								<li><div class="proposal-info-tit">브랜드 :</div> 		<strong>${proposal.brand_name}</strong></li>
								<li><div class="proposal-info-tit">수선 유형 :</div>
									<c:if test="${not empty proposal.requests and proposal.requests ne ' '}">
									  <ul>
									    <c:forTokens var="requests" items="${proposal.requests}" delims="%">
									      <li class="requests-item">${requests}</li>
									    </c:forTokens>
									  </ul>
									</c:if>
								</li>
							</ul>
							</div>
							
							<hr />
							<div class="txt-proposal-info">
							<ul>
								<div class="txt-info-center">견적 내용</div>
								<li><div class="proposal-info-tit">견적 제안 날짜 :</div> 	<div class="cont-proposal-right"><strong>${proposal.estimate_proposal_date}</strong></div></li>
								<li><div class="proposal-info-tit">예상 작업 기간 :</div>		<div class="cont-proposal-right"><strong>${proposal.estimate_period}</strong>일</div></li>
								<li><div class="proposal-info-tit">제안 가격 :</div>		<div class="cont-proposal-right"><strong><fmt:formatNumber value="${proposal.estimate_price}"  pattern="0,000"/></strong>원</div></li>
							</ul>
							</div>
						</td>
	
						<td>
							<c:if test="${proposal.order_status eq 1}">
							<div style="color: red;">결제 완료</div>
							</c:if>
							<c:if test="${proposal.order_status eq 0}">
							<button class="btn-estimateDetail" onclick="location.href='<%= ctxPath%>/payment.got?estimate_num_pk=${proposal.estimate_num_pk}'">결제하기</button>
							</c:if>
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