
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style type="text/css">
div#resultContent{
	padding: 20px 50px;
    width: 1200px;
    margin: 20px auto;
    border: 0px solid blue;
    background-color:#f2f2f2; 
    border-radius:10px;
	height:fit-content;
	
/* 	padding:0 50px; 
	width:100%; 
	height:150px;  */
	
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		

	});
	
</script>


<!-- 본문시작 -->
<!-- <div id="container"> -->
    <div id="resultContent">
    	<p class="listCenter">의뢰해주셔서 감사합니다</p> 
     	
		<div class="resultDivNoBorder">
			<div>
				<div class="detailDivFlex imgCircle imgCircle2" >
					<img src="<%=ctxPath%>/resources/img/main_test.jpg" class=" imgCircle2 imgCircle" >
				</div>
				
			</div>
			
			<div style="width:fit-content;">
				<p class="orderMargin detailPName">${requestScope.paymentInfo.brand_name} ${requestScope.paymentInfo.order_product_type} 수선 의뢰</p>
				<div class="detailDiv detailMargin" >
					<i class="fa-solid fa-check"></i>
					<p>품목 : ${requestScope.paymentInfo.order_product_type}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>브랜드 : ${requestScope.paymentInfo.brand_name}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>수선 요청사항 목록 : ${requestScope.paymentInfo.requests}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>수선 요청사항설명 : ${requestScope.paymentInfo.request_explain}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p> 선정된 공방 : 선정된 공방 : ${requestScope.paymentInfo.craft_name}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p> 예상작업기간 : ${requestScope.paymentInfo.estimate_period}개월</p>
				</div>
			</div>
			
			
		</div>
	
		<hr style="border:solid 1px lightgray;"> 	
	
		<div>
			<div >
				<!-- <p class="margin" style="font-size:20pt; font-weight:bold; margin:30px 0; margin-left:30px;">배송지 정보</p> -->
			</div>
			<table>
	     		<tr>
	     			<td class="orderTd orderTdTitle">수령인</td>
	     			<td class="orderTd">
	     				${requestScope.orderDetailInfo.order_name}
	     			</td>
	     		<tr>	
	     		
	     		<tr>
	     			<td class="orderTd orderTdTitle">연락처</td>
	     			<td class="orderTd">
	     				${requestScope.orderDetailInfo.order_num}
	     			</td>
	     		<tr>
	     		
	     		<tr style="border-bottom: 1px solid #f2f2f2;">
					<td class="orderTd orderTdTitle" style="border-bottom: 1px solid #f2f2f2;" >주소</td>
					<td class="orderTd" style="border-bottom: 1px solid #f2f2f2;">
						${requestScope.orderDetailInfo.order_address} ${requestScope.orderDetailInfo.order_detail_address}
					</td>
				</tr>
				

		     </table>
		</div>

		<hr class="lightgray"> 	
		
		<div class="resultDivFlex4">
			<p style="font-weight:bold; font-size:20px;">가격 : <span ><fmt:formatNumber value="${requestScope.paymentInfo.estimate_price}" pattern="#,###" /></span>원</p>
				
		</div>
		
		<div class="payDivFlex3">
			<p class="payFont"> 결제수단 : 카드 </p>
				
		</div>
		<!-- 
			<div style="display:flex; margin-left:30px; margin-top:10px; margin-bottom:8px;">
					<i class="fa-solid fa-check"></i>
					<p style="margin-left:5px;">가격 : 200,000</p>
			</div>	 
		-->
		<p style="text-align:center;">
   			<button type="button" class="orderButton" >메인 페이지로</button>			
		</p>
    </div>
<!-- </div> -->
<!--본문 끝 -->

    