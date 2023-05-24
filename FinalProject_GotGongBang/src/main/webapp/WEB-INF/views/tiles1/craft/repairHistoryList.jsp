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
						<div class="txt-order-info">
						<ul>
							<li>주문번호 : <strong>20230524A1</strong></li>
							<li>주문 날짜 : <strong>2023/05/22</strong></li>
							<li>품목명 : <strong>가방</strong></li>
							<li>요청사항 : <strong>요청사항1입니다 요청사항2입니다 요청사항3입니다</strong></li>
							<li>브랜드 : <strong>버버리</strong></li>
							<li>가격 : <strong>50,000 원</strong></li>
							<br>
							<li>고객명 : <strong>고객 이름</strong></li>
							<li>연락처 : <strong>01025254845</strong></li>
							<li>주소 : <strong>경기도</strong></li>							
							<li>상세주소 : <strong>화성시</strong></li>
							<li>부가주소 : <strong>화성아파트</strong></li>
							<li>우편번호 : <strong>12345</strong></li>
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
					
					
				</tbody>
			</table>
		
		</div>
	</div>
</div>