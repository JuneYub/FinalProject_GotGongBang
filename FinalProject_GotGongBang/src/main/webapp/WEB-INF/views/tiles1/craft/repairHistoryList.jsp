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
							<li>주문 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>수선 유형 : <strong>몰루</strong></li>
						</ul>
					</td>

					<td>
					<select id="selectProductState" name="selectProductState">
						<option value="수거진행중">수거진행중</option>
					</select>
					<button class="btn-save-state" onclick="saveProductState()">상품 상태 저장하기</button>
					<div>상품 상태 : <strong id="productState"></strong> </div>
					</td>
					</tr>
					
					
				</tbody>
			</table>
		
		</div>
	</div>
</div>