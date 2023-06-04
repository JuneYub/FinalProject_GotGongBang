<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		$("input#proposalPrice").bind("keyup", function(e) {
			let price = e.target.value;
			price =  Number(price.replaceAll(",", ""));
			const formatValue = price.toLocaleString('ko-KR');
			$("input#proposalPrice").val(formatValue);
		});
		
	});
	
	function submitProposal() {
		var proposalDuration = $("input#proposalDuration").val();
		var proposalPrice = $("input#proposalPrice").val();
		proposalPrice = proposalPrice.replaceAll(",", "");
		var regExp = /^[0-9]+$/;
		
		if(proposalDuration.trim() == '') {
			alert("예상 작업 기간을 입력해주세요")
			$("input#proposalDuration").focus();
			return;
		}
		else {
			if(!regExp.test(proposalDuration)) {
				alert("작업 기간은 숫자로만 입력해주세요")
				$("input#proposalDuration").focus();
				return;
			}
		}
		
		if(proposalPrice.trim() == '') {
			alert("제안 가격을 입력해주세요")
			$("input#proposalPrice").focus();
			return;
		}
		else {
			if(!regExp.test(proposalPrice)) {
				alert("가격은 숫자로만 입력해주세요")
				$("input#proposalPrice").focus();
				return;
			}
		}
		$("input#proposalPrice").val(proposalPrice);
		if(confirm("제안을 하시면 수정할 수 없습니다. 정말로 제안하시겠습니까?")) {
			const bidForm = document.bidForm;
			bidForm.action = "<%= ctxPath%>/estimate_inquiry_list/bid_end.got";
			bidForm.method ="POST"
			bidForm.submit();
		}
	}

	
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
								<div class="img-bid-detail">
								<c:forEach var="wholeImg" items="${ovo.wholeImgList}" varStatus="wholeIdx">
									
									<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" data-fancybox="gallery${status.index}" target='_blank' >
										<img src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_name}" />
									</a>
									
								</c:forEach>	
								</div>
							</td>
							</tr>
							<tr><th>상세 사진</th> 
							<td>
								<div class="img-bid-detail">
								<c:forEach var="detailImg" items="${ovo.detailImgList}" varStatus="detailIdx">
									
									<a href="<%= ctxPath%>/resources/img/orders_detail/${detailImg.detail_img_name}" data-fancybox="gallery${status.index}" target='_blank' >
										<img src="<%= ctxPath%>/resources/img/orders_detail/${detailImg.detail_img_name}" />
									</a>
									
								</c:forEach>	
								</div>
								</td>
							</tr>
							<tr><th>수선 유형</th> <td>${requestScope.ovo.requests}</td></tr>
							<tr><th>수선 요청사항 설명</th><td>${requestScope.ovo.request_explain}</td></tr>
						</tbody>
				</table>
			</div>
		</div>
		<c:if test="${requestScope.estimateExists eq 1}">
		</c:if>
		
		<c:if test="${requestScope.estimateExists eq 0}">
		<form name="bidForm" autocomplete="off">	
		<div class="cont-proposal">
			<input type="hidden" id="orderNum" name="orderNum" value="${requestScope.orderNum}" autocomplete="off">
			<h3>예상기간 제안</h3>
			<input class="input-proposal" id="proposalDuration" name="proposalDuration" placeholder="일 ">
			</div>
			<div class="cont-proposal">
			<h3>가격 제안</h3>
			<input class="input-proposal" id="proposalPrice" name="proposalPrice" type="text" placeholder="￦ " autocomplete="off">
			</div>
		</form>
		
		<div class="cont-bid-final">
		 
			<a class="btn-return" onclick="location.href='<%= ctxPath%>/estimate_inquiry_list.got?currentShowPageNo=${requestScope.currentShowPageNo}';">돌아가기</a>
			<a class="btn-bid" onclick="submitProposal()" >제안하기</a>
		</div>
		</c:if>		
	</div>
</div>