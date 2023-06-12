
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   




<style type="text/css">
div#payContent {
	padding: 20px 50px;
	width: 1200px;
	margin: 20px auto;
	border: 0px solid blue;
	/* background-color:#cceeff; */
	  border-radius:10px;
	height:fit-content;
}
</style>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		

	});
	
	

	function openDaumPOST(){
	      new daum.Postcode({
	            oncomplete: function(data) {
	            	
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                //let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                
/* 	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                } */
	                
	                

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAdress").focus();
	            }
	        }).open();
	}//openDaumPOST	
	
	
	function goPayment(){
		
		const regExp = /^\d{11}$/;
		const bool = regExp.test($("input[name='order_mobile']").val());
		
		
		// 수령자명이 빈칸이면
		if( $("input[name='order_name']").val().trim() == "" ){
			alert("수령인을 입력하세요!");
			return;
		}
		
		// 번호가 형식에 맞지 않거나 빈칸이면
		else if(!bool || $("input[name='order_mobile']").val().trim() == ""){
			alert("휴대폰번호를 형식에 맞게 입력하세요!");
			return;
		}
		
		// 주소가 빈칸이면
		else if($("input[name='order_address']").val().trim() == "" || $("input[name='order_detail_address']").val().trim() == ""){
			alert("주소를 입력하세요!");
			return;
		}
		
/* 		else{
			const frm = document.payment_form;
			frm.action = "payment_form.got";
			frm.method = "post";
			frm.submit();
		} */
		
		else{
			goPurchase();
		}
		
	}
	

	// 결제해주러 가는 함수 //
	function goPurchase(){
	      
		const price = $("span#price").text();
		const user_id_pk = "${sessionScope.loginuser.user_id_pk}";
        const url = "<%= request.getContextPath()%>/requiredLogin_PurchaseEnd.got?user_id_pk="+user_id_pk+"&price="+price; 
        // 견적서번호 넘기기 
        
        window.open(url, "requiredLogin_PurchaseEnd",
	             "left=350px, top=100px, width=1000px height=600px");
        

      
	} // end of function PurchaseEnd()-------------------------------------------
	


	
	
	

</script>



<!-- 본문시작 -->
<div id="container">
    <div id="payContent">
    	<p class="orderTitle">결제하기</p> 
    	
    	<div class="payFlex">
	     	<div class="payCircleDiv">
	     		<!-- <i class="fa-solid fa-1 fa-xl"></i> -->
	     		<p class="payNum">1</p>
	     	</div>
	     	<p class="paySubject">주문확인</p>
	    </div>
     	
		     	
		<div class="resultDivNoBorder">
			<div>
				<div class="detailDivFlex imgCircle imgCircle2" >
					<img src="<%=ctxPath%>/resources/img/main_test.jpg" class=" imgCircle2 imgCircle" >
				</div>
				
			</div>
			
			<div style="width:fit-content;">
				<p class="orderMargin detailPName" style="margin-left: 0px;">${requestScope.paymentInfo.brand_name} ${requestScope.paymentInfo.order_product_type} 수선 의뢰</p>
				<div class="detailDiv detailMargin" >
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p>품목 : ${requestScope.paymentInfo.order_product_type}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p>브랜드 : ${requestScope.paymentInfo.brand_name}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p>수선 요청사항 목록 : ${requestScope.paymentInfo.requests}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p>수선 요청사항설명 : ${requestScope.paymentInfo.request_explain}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p> 선정된 공방 : ${requestScope.paymentInfo.craft_name}</p>
				</div>
				
				<div class="detailDiv ">
					<i class="fa-solid fa-check" style="padding-right:5px;"></i>
					<p> 예상작업기간 : ${requestScope.paymentInfo.estimate_period}개월</p>
				</div>
			</div>
			
			
		</div>
			
			
		<hr class="lightgray"> 	
			
		<div class="payFlex">
		<div class="payCircleDiv">
     		<!-- <i class="fa-solid fa-1 fa-xl"></i> -->
     		<p class="payNum">2</p>
     			
     	</div>
     	<p class="paySubject">배송지 입력</p>
     	</div>
		     	
		     	
		<div style="">
			<div >
				<!-- <p class="margin" style="font-size:20pt; font-weight:bold; margin:30px 0; margin-left:30px;">배송지 정보</p> -->
			</div>
			<hr>
			<form name="payment_form">	
				<table>
		    		<tr>
		    			<td class="orderTd orderTdTitle">수령인</td>
		    			<td class="orderTd">
		    				<input class="payInput" type="text" name="order_name" placeholder="50자 이내로 입력하세요"/>
		    			</td>
		    		<tr>	
		    		
		    		<tr>
		    			<td class="orderTd orderTdTitle">연락처</td>
		    			<td class="orderTd">
		    				<input class="payInput" type="text" name="order_mobile" placeholder="-를 제외하고 입력하세요"/>
		    			</td>
		    		<tr>
		    		
		    		<tr>
					<td class="orderTd orderTdTitle" style="border-bottom: 1px solid white;">주소</td>
						<td class="orderTd" style="border-bottom: 1px solid white;">
							<input name="order_post_code" class="inputHeight" type="text"  id="postcode"  readonly></input>
							<button name="order_name" class="payBtnPost" type="button" id="btnPostcode" onclick="openDaumPOST();">우편번호 검색</button><br>
							<input name="order_address" class="payInput2" type="text"  id="address"  readonly></input><br>
							<input name="order_detail_address" class="payInput2" type="text" id="detailAdress" ></input>
						</td>
				
					</tr>
				
<!-- 					<tr>
			    			<td class="orderTd orderTdTitle">배송메모</td>
			    			<td class="orderTd">
			    				<input style=" width:500px; height: 35px; font-size:10pt;" placeholder="요청사항을 직접 입력합니다."/>
			     			</td>
			     		<tr> -->
			     </table>
		     </form>
		</div>
		
		
		<hr style="border:solid 1px lightgray;"> 	
		
		<div style="display:flex; margin-top:70px;">
			<div class="payCircleDiv">
				<p class="payNum">3</p>	
		     </div>
		     <p class="paySubject">결제상세</p>
		</div>
		     	
		<hr>
		
		<div class="payFlex2">
			<p style="font-weight:bold; font-size:20px;">최종 가격 : <span id="price">${requestScope.paymentInfo.estimate_price}</span></p>
			<%-- <fmt:formatNumber value="${requestScope.boardvo.fileSize}" pattern="#,###" /> --%>
		</div>
		
		<p class="pCenter">
   			<button type="button" onclick="goPayment()" style=" margin-top:60px;   border-radius:15px; font-size:15pt; width:200px; height:50px; background-color:#400099; color:white;" >결제하기</button>			
		</p>
    </div>

</div>
<!--본문 끝 -->
