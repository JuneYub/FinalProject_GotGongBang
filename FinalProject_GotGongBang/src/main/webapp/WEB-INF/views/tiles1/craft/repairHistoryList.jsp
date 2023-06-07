<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		var state = $("select#selectProductState").val();
		$("strong#productState").text(state);		
	});
	
	function saveProductState() { // 상품의 상태를 Ajax를 통해 갱신

		$.ajax({
			url:"",
			type:"POST",
			async:true,
			data {
				
			},
			dataType:"JSON",
			success:function(json) {
				
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
				<c:forEach var="repair" items="${requestScope.paraMapList}">
					<tr>
					<td>
						<div class="img-estimate"></div>
					</td>

					<td>
						<div class="txt-order-info">
						<ul>
							<li>주문번호 : <strong>${repair.order_detail_id_pk}</strong></li>
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
					<select id="selectProductState" name="selectProductState">
						<option value="수거진행중">수거진행중</option>
					</select>
					<button class="btn-save-state" onclick="saveProductState()">상품 상태 저장하기</button>
					<div>상품 상태 : <strong id="productState"></strong> </div>
					</td>
					</tr>
					
				</c:forEach>	
				</tbody>
			</table>
			<div class="block-pagebar">
				${requestScope.pageBar}
			</div>
		</div>
	</div>
</div>