
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   


<style type="text/css">
div#orderContent {
   padding: 50px;
   width: 1000px;
   margin: 30px auto;
   border: 1px solid #400099;
   /* background-color:#cceeff; */
    border-radius:10px;
	height:fit-content;

}
</style>
	
<script type="text/javascript">
	$(document).ready(function(){
		
		$('a[rel=popover]').popover({
			  html: true,
			  trigger: 'hover',
			  placement: 'bottom',
			  content: function(){return '<img src="'+$(this).data('img') + '" />';}
			});
	});
		
			
</script>


 <!-- 본문시작 -->
 <div id="container">
     <div id="orderContent">
     	
     	<p class="orderTitle">견적 의뢰</p>
     	
     	<hr class="orderHr">
     	
	<table>
      	<tr>
     		<td class="orderTd orderTdTitle">품목</td>
     		<td class="orderTd">
     			<select class="orderSelect" >
 					<option>가방/핸드백</option>
	  				<option>신발</option>
	  				<option>지갑/밸트</option>
	  				<option>의류 수선</option>
				</select>
			</td>
     	</tr>
     		
   		<tr>
   			<td class="orderTd orderTdTitle">브랜드</td>
   			<td class="orderTd">
   				<input class="orderInput" placeholder="브랜드를 선택하거나 직접 입력해주세요"/>
			</td>
   		</tr>
   		
   		<tr>
   			<td class="orderTd orderTdTitle">전체 사진&nbsp;
   				<a class="orderPop" rel="popover" data-img="<%=ctxPath%>/resources/img/order_pic_example.png">
   					<i class="fa-regular fa-circle-question"></i>
   				</a>
   			</td>
   			
   			<td class="orderTd">
   				<div class="orderDivPic" >
	       			<i class="fa-regular fa-image fa-4x"></i>
	       			<div >0/3</div>
      	 		</div>
			</td>
   		</tr>
   		

   		
   		<tr>
   			<td class="orderTd orderTdTitle">상세 사진&nbsp;
   				<a class="orderPop" rel="popover" data-img="<%=ctxPath%>/resources/img/order_pic_example.png">
   					<i class="fa-regular fa-circle-question"></i>
   				</a>
   			</td>
   			
   			<td class="orderTd">
   				<div class="orderDivPic">
       				<i class="fa-regular fa-image fa-4x"></i>
       				<div>0/3</div>
       			</div>
			</td>
   		</tr>
   		
   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항</td>
   			
   			<td class="orderTd">
   				<select class="orderSelect">
					<option>수선 요청사항을 선택해 주세요.</option>
				</select>
			</td>
   		</tr>
   		
   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항 설명</td>
   			<td class="orderTd">
    			<div class="orderReq">
		  			<p class="orderMargin pCenter">요청사항을 적으실 때는 세 가지만 기억해주세요!</p>
		  			<p class="orderMargin pCenter">
		  				<span class="hightlight">어디가</span> 
		  				<span class="lightgray">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
		  				<span class="hightlight">어때서</span> 
		  				<span class="lightgray">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
		  				<span class="hightlight">어떻게</span> 
		  			</p>
		  			<p class="orderMargin pCenter">ex. 프라다 
		  				<span class="hightlight">가방 모서리가 헤져서</span> 깨끗하게 
		  				<span class="hightlight">고쳐주세요</span> 
		  			</p>
  				</div>
		  		<div class="orderDivArea" >
		  			<textarea id="orderTextarea" placeholder="위의 안내에 따라 적어주셔야 자세하고 친절한 상담이 가능합니다." id="textarea"></textarea>
		  		</div>
			</td>
   		</tr>
   	</table>


	<p class="pCenter">
  		<button type="button" class="orderButton">다 음</button>			
	</p>
   	</div>

 </div>
 <!--본문 끝 -->

   