
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
		
</script>


 <!-- 본문시작 -->
 <div id="container">
     <div id="orderContent">
     
     	<select id="selectPrac" name="selectPrac" onchange="changeFn()">
     		<option name="selectPrac" value="10">10</option>
     		<option name="selectPrac" value="20">20</option>
     		<option name="selectPrac" value="30">30</option>
     	</select>
     	<button id="modal" class="btn-modal" data-toggle="modal" data-target="#myModal" data-id="">Open Modal</button>
   	</div>

 </div>
 <!--본문 끝 -->


  <%-- ****** 수선사항 요청 Modal ****** --%>
 <div class="modal hide" id="myModal">
	<div class"modal-header">
    	<button class="close" data-dismiss="modal">x</button>
        <h3>Modal header</h3>
	</div>
    <div class="modal-body">
    	<input type="text" class="body-contents" id="contents" />
        <textarea class="body-contents" id="text-contents"></textarea>
    </div>
</div>