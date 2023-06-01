
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
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

#chooseFile {
   /*  visibility: hidden; */
   display:none;
}

div.orderSelect{
	width:600px; 
	height:50px; 
	border:solid 1px gray; 
	border-radius:5px;
	display: flex;
    align-content: center;
    flex-wrap: wrap;
}
</style>
	
<script type="text/javascript">

	let value=10;

	$(document).ready(function(){
		
		$(".btn-modal").click(function(){
			
			/* var value = $(this).data('id'); */
			
			//$("buttn.btn-modal").attr("data-id",value);
			
		    $("#contents.body-contents").val(value);
		    $("#text-contents.body-contents").html(value);
		});

	  
	});// ready
	
	function changeFn(){
		let selectPrac  = document.getElementById("selectPrac");
		value = (selectPrac.options[selectPrac.selectedIndex].value);
		
		$("button#modal").attr("data-id",value);
		
		//alert("value = "+value);
		
		
		/* 		
		var selectedindex = city.selectedIndex;
		alert("value = "+value+" , selectedindex = "+selectedindex); 
		*/

	};
	
	function getSelect(){
		let modalSel  = document.getElementById("modalSel");
		value = (modalSel.options[modalSel.selectedIndex].value);
		
		$("input#fruit").val(value);
	}
		
</script>


 <!-- 본문시작 -->
 <div id="container">
     <div id="orderContent">
     
     	<select id="selectPrac" name="selectPrac" onchange="changeFn()">
     		<option name="selectPrac" value="10">10</option>
     		<option name="selectPrac" value="20">20</option>
     		<option name="selectPrac" value="30">30</option>
     	</select>
     	
     	<input type="text" id="fruit" />
     	<button id="modal" class="btn-modal" data-toggle="modal" data-target="#myModal" data-id="">Open Modal</button>
   	</div>

 </div>
 <!--본문 끝 -->


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
           	<input type="text" class="body-contents" id="contents" />
        <textarea class="body-contents" id="text-contents"></textarea>
        
        <select id="modalSel" name="modalSel" onchange="getSelect()" >
     		<option name="modalSel" value="22">딸기</option>
     		<option name="modalSel" value="33">수박</option>
     		<option name="modalSel" value="44">포도</option>
     	</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%-- 

  ****** 수선사항 요청 Modal ******
 <div class="modal fade" id="myModal">
	<div class="modal-header">
    	<button class="close" data-dismiss="modal">x</button>
        <h3>Modal header</h3>
	</div>
    <div class="modal-body">
    	<input type="text" class="body-contents" id="contents" />
        <textarea class="body-contents" id="text-contents"></textarea>
        
        <select id="modalSel" name="modalSel" onchange="getSelect()" >
     		<option name="modalSel" value="22">딸기</option>
     		<option name="modalSel" value="33">수박</option>
     		<option name="modalSel" value="44">포도</option>
     	</select>
    </div>
    
     --%>
    
   <%--  
      ****** 수선사항 요청 Modal ******
  <div class="modal fade" id=id="myModal"> 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. 
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title">수선 요청사항 선택</h4>
          <button type="button" class="close selectReqClose" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="idFind">
          
          
          	<form name="selectReq">
		    <div class="modal-body">
		    	<input type="text" class="body-contents" id="contents" />
		        <textarea class="body-contents" id="text-contents"></textarea>
		        
		        <select id="modalSel" name="modalSel" onchange="getSelect()" >
		     		<option name="modalSel" value="22">딸기</option>
		     		<option name="modalSel" value="33">수박</option>
		     		<option name="modalSel" value="44">포도</option>
		     	</select>
		    </div>
			   
			</form>
			
 
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" style="display: flex; justify-content: center;">
          <button style="width:450px; height:50px; background-color:#400099;" type="button" class="btn btn-secondary selectReqClose" data-dismiss="modal">선택하기</button>
        </div>
      </div>
          </div>
</div> 
</div>--%>