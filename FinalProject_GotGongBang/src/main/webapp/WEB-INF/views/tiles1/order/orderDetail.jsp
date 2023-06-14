
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   


<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style type="text/css">
div#detailContent {
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

</script>


<!-- 본문시작 -->
<!-- <div id="container"> -->
	<div id="detailContent">
    	<p class="listCenter">의뢰상세</p> 
    	<div class="detailDivBorder">
			<div class="detailDivFlex imgCircle imgCircle2" >
				<img src="<%=ctxPath%>/resources/img/orders/main_test.jpg" class=" imgCircle2 imgCircle" >
			</div>
			
			<div style="width:fit-content;">
				<p class="orderMargin detailPName">샤넬 가방 수선 의뢰</p>
				<div class="detailDiv detailMargin" >
					<i class="fa-solid fa-check"></i>
					<p>품목 : 가방/핸드백</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>브랜드 : 샤넬</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>수선 요청사항 : 부분 가죽교체</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p>수선 요청사항 : 부분 염색</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check"></i>
					<p> 선정된 공방 : 공공공방</p>
				</div>
			</div>
		</div>
     	
     	<div class="detailNoBorder">
    		<p class="orderMargin listTitle">기다려주셔서 감사합니다</p>
    		<p class="orderMargin listTitle">견적 금액 : 200,000</p>
    	</div>
    	
		<p class="pCenter">
	   		<button type="button" class="orderButton">결제하기</button>			
		</p>
	</div>
<!-- </div> -->
<!--본문 끝 -->

