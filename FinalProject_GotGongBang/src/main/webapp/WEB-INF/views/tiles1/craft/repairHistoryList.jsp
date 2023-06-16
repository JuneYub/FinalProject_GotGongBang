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
	 
</script>

<!-- 본문시작 -->
<div class="myPage-container">
	<div class="myPage-tit"><h1>마이 페이지</h1></div>
	<div class="myPage-contents">
		<div class="myPage-menu-list">
			<ul>
				<li class=""><a class="" href="<%= ctxPath%>/estimate_inquiry_list.got">견적 목록</a></li>
				<li class="menu-list-selected"><a class="menu-list-selected" href="<%= ctxPath%>/repair_history_list.got">수선 내역 관리</a></li>
				<li><a class="" href="<%= ctxPath%>/edit_craft_user_info.got">개인 정보 변경</a></li>
				<li><a class="" href="<%= ctxPath%>/delete_partner.got">회원 탈퇴</a></li>
			</ul>
		</div>
		
		<div class="myPage-cont">
			<h4>수선 내역</h4>
			<table class="tbl-myPageList">
				<thead>
					<tr>
					<th>사진</th>
					<th>정보</th>
					<th>상세 보기/상태</th>
					</tr>
				</thead>
				
				<tbody>
				<c:if test="${empty requestScope.paraMapList}">
					 <td colspan="3" style="text-align: center;">조회할 수선내역이 없습니다</td> 
				</c:if>
				
				<c:if test="${not empty requestScope.paraMapList}">
				<c:forEach var="repair" items="${requestScope.paraMapList}" varStatus="status">
					<tr>
					<td>
						<div class="img-estimate">
							<c:forEach var="wholeImg" items="${repair.wholeImgList}" varStatus="wholeIdx">
								<c:if test="${wholeIdx.index eq 0}">
								<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" data-fancybox="gallery${status.index}" >
									<img src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" />
								</a>
								</c:if>

								<c:if test="${wholeIdx.index ne 0}">
								<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" data-fancybox="gallery${status.index}" >
									<img style="display: none" src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" />
								</a>
								</c:if>
							</c:forEach>
						</div>
					</td>

					<td>
						<div class="txt-order-info">
						<ul>
							<li>주문번호 : <strong class="order_id">${repair.order_detail_id_pk}</strong></li>
							<li>주문 날짜 : <strong>${repair.payment_date}</strong></li>
							<li>품목명 : <strong>${repair.order_product_type}</strong></li>
							<li>요청사항 : <strong>${repair.requests}</strong></li>
							<li>브랜드 : <strong>${repair.brand_name}</strong></li>
							<li>가격 : <strong>${repair.payment}</strong>원</li>
							<br>
							<li>고객명 : <strong>${repair.orderer}</strong></li>
							<li>연락처 : <strong>${repair.order_post_code}</strong></li>
							<li>우편번호 : <strong>${repair.order_post_code}</strong></li>
							<li>주소 : <strong>${repair.order_address}</strong></li>							
							<li>상세주소 : <strong>${repair.order_detail_address}</strong></li>
							<li>부가주소 : <strong>${repair.order_extra_address}</strong></li>
							
						</ul>
						</div>
						
					</td>

					<td>
					<select id="selectProductState" name="selectProductState" value="${repair.product_status}">
						<option value="--">--</option>
						<option value="수거중">수거중</option>
						<option value="수선중">수선중</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
					</select>
					<button class="btn-save-state" onclick="saveProductState(${status.index})">상품 상태 저장하기</button>
					<div>상품 상태 : <strong id="productState" class="select-state" style="color: red">${repair.product_status}</strong> </div>
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