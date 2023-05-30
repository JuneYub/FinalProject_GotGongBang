
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   

<style type="text/css">
div#listContent {
    padding: 20px 50px;
    width: 1000px;
    margin: 20px auto;
    border: 0px solid blue;
     background-color:#f2f2f2; 
    border-radius:10px;
	height:fit-content;
}  
</style>
	
<script type="text/javascript">

</script>


<!-- 본문시작 -->
<div id="container">
	<div id="listContent">
     	<p class="listCenter">의뢰내역</p> 
     	
     	
		<div class="detailDivBorder">
			<div>
				<p class="listCondition">견적완료</p>
				<div class=" imgCircle imgCircle2" >
					<img src="<%=ctxPath%>/resources/img/main_test.jpg" class=" imgCircle2 imgCircle" >
				</div>
			</div>
			
			<div class="listBorderDiv">
				<div>
					<p class="listDate" >2023.05.21</p>
					<p class="listOrderName">샤넬 가방 수선 의뢰</p>
					<a href="" class="listAnchor" >의뢰상세</a>
				</div>
			</div>
			
		</div>

		
		

	</div>

</div>
<!--본문 끝 -->

  