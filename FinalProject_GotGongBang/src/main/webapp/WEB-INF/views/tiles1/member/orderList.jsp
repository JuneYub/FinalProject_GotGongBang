<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
	
		
	});
	
 	function saveProductState(index) { // 상품의 상태를 Ajax를 통해 갱신
		var orderNum = $("strong.order_id").eq(index).text();
 		var $stateDisplay = $("strong.select-state").eq(index);
 		var state =$("#selectProductState").eq(index).val();
 		console.log($stateDisplay);
 		console.log(state);
	 	if(state == '--') {
	 		alert("상태를 선택해주세요.");
	 		return;
	 	}
	 	
	 	if(state == $stateDisplay.text() ) {
	 		alert("이전 진행상태와 동일하게 갱신할 수 없습니다.");
	 		return;
	 	}
		$.ajax({
			url:"<%= ctxPath%>/update_state.got",
			type:"POST",
			async:true,
			data: {
				orderNum:orderNum,
				state:state
			},
			dataType:"JSON",
			success:function(json) {
				if(json.n == 1) {
					$stateDisplay.text(state);
					alert("정상적으로 변경되었습니다.")
					console.log($stateDisplay.val());
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
				
		});

	}
 	
 	function writeReview(orderNum) {
 		console.log(orderNum);
 		$.ajax({
 			url:"<%= ctxPath%>/check_review_count.got",
 			type:"POST",
 			async:true,
 			data: {
 				orderNum:orderNum
 			},
			success:function(json) {
				if(json.cnt >= 1) {
					alert("이미 후기를 작성하셨습니다.");
					return;
				}
				else {
					alert("후기를 작성할 수 있습니다");
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
 			
 			
 		})
 	}
	 
</script>

<!-- 본문시작 -->
<div class="myPage-container">
	<div class="myPage-tit"><h1>마이 페이지</h1></div>
	<div class="myPage-contents">
		<div class="myPage-menu-list">
			<ul>
				<li class=""><a class="" href="<%= ctxPath%>/proposal_list.got">견적 제안서 목록</a></li>
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/order_list.got">주문 내역</a></li>
				<li><a class="" href="<%= ctxPath%>/edit_user_info.got">개인 정보 변경</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>주문 내역</h4>
			<table class="tbl-myPageList">
				<thead>
					<tr>
					<th>주문번호</th>
					<th>주문 내용</th>
					<th>후기 작성</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${empty requestScope.orderList}">
					<tr><td colspan="3">조회할 주문 정보가 없습니다</td></tr>
					</c:if>
					<c:if test="${not empty requestScope.orderList}">
						<c:forEach var="orderList" items="${requestScope.orderList}">
						<tr>
						<td>
							${orderList.payment_date}<br>
							[${orderList.order_detail_id_pk}]
						</td>
	
						<td>
							<div class="txt-estimate-info">
							<div class="txt-info-center">주문 상세 정보</div>
							<ul>
								<li><div class="proposal-info-tit">공방명:</div> 		<strong>${orderList.craft_name}</strong></li>
								<li><div class="proposal-info-tit">공방 연락처 :</div> 		<strong>${orderList.craft_mobile}</strong></li>
								<li><div class="proposal-info-tit">결제 금액 :</div> 		<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.estimate_price}" /></strong>&nbsp;원</li>
								<li><div class="proposal-info-tit">상품 상태 :</div><strong>${orderList.product_status}</strong></li>
							</ul>
							</div>
						</td>
	
						<td>
							<button class="btn-estimateDetail btn-font15" onclick="writeReview(${orderList.order_detail_id_pk})">후기 작성하기</button>
						</td>
						<form name="wrtiteReviewForm">
						<input type="hidden" name="orderNum" value="${orderList.order_detail_id_pk}">
						</form>
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