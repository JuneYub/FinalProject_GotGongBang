<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<script type="text/javascript">

	$(document).ready(function(){
		
	
	
	});//$(document).ready(function()

	
</script>

<form name="selectReq">

	<p>수선 유형</p>
	<ul style="list-style-type: none">
         <li style="">
         	<input type="radio" name="userid" id="userid" value=""/>
            <label for="userid" style="display: inline-block; width: 250px">전체 가죽 교체</label>
         </li>
         
         <li style="">
         	<input type="radio" name="userid2" id="userid2" value=""/>
            <label for="userid2" style="display: inline-block; width: 250px">부분 가죽 교체</label>
         </li>
   </ul>
   
<!--    <div class="my-3" id="div_btnFind">
    <p class="text-center">
       <button style="width:450px;"type="button" class="btn btn-success" id="btnFind">선택하기</button>
    </p>
   </div> -->
</form>




