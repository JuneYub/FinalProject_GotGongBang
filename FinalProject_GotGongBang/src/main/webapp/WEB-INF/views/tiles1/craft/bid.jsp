<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		
		
	});

	
</script>

<!-- 본문시작 -->
<div class="myPage-container">
	<div class="estimate-tit"><h1>견적 제안서</h1></div>
	<div class="myPage-contents">
		<div id="requestEstimate">
			<div class="table-wrap">
					<table class="tbl-estimate">
						<tbody>
							<tr><th>요청자 성함</th> <td>${requestScope.ovo.orderer}</td></tr>
							<tr><th>품목</th> <td>${requestScope.ovo.order_product_type}</td></tr>
							<tr><th>브랜드</th> <td>${requestScope.ovo.brand_name}</td></tr>
							<tr><th>전체 사진</th> 
												<td>
												<div class="img-bit-detail">
												<c:forEach var="wholeImg" items="${ovo.wholeImgList}" varStatus="wholeIdx">
													
													<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" data-fancybox="gallery${status.index}" target='_blank' >
														<img src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" />
													</a>
													
												</c:forEach>	
												</div>
												</td>
												
												</tr>
							<tr><th>상세 사진</th> <td></td></tr>
							<tr><th>수선 유형</th> <td>${requestScope.ovo.requests}</td></tr>
							<tr><th>수선 요청사항 설명</th><td>${requestScope.ovo.request_explain}</td></tr>
						</tbody>
				</table>
			</div>
		</div>
			
				
		<div class="cont-proposal">
		<h3>예상기간 제안</h3>
		<input class="input-proposal" type="text" placeholder="일 ">
		</div>
		<div class="cont-proposal">
		<h3>가격 제안</h3>
		<input class="input-proposal" type="text" placeholder="￦ ">
		</div>
		
		
		<div class="cont-bid-final"><a>제안하기</a></div>
	</div>
</div>