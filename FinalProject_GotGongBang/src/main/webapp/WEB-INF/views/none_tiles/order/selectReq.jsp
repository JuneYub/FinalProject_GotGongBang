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
         <li style="margin: 25px 0">
            <label for="userid" style="display: inline-block; width: 90px">수선 유형</label>
            <input type="text" name="userid" id="userid" size="25" placeholder="ID" autocomplete="off" required />
         </li>
         <li style="margin: 25px 0">
            <label for="email" style="display: inline-block; width: 90px">이메일</label>
            <input type="text" name="email" id="email" size="25" placeholder="abc@def.com" autocomplete="off" required />
         </li>
   </ul>
   
   <div class="my-3" id="div_btnFind">
    <p class="text-center">
       <button type="button" class="btn btn-success" id="btnFind">찾기</button>
    </p>
   </div>
</form>


<div class="my-3" id="div_findResult">
     <p class="text-center">
     	<c:if test="${requestScope.isUserExists == false}">
       		<span style="color:red;">사용자 정보가 없습니다.</span>
       	</c:if>
       	
       	
       	<!-- 발송되면 찾기버튼 안보이게 -->
       	<c:if test="${requestScope.isUserExists == true && requestScope.sendMailSuccess ==true}">
       		<span style="font-size:10pt">인증코드가 ${requestScope.email}로 발송되었습니다.</span><br>
       		<span style="font-size: 10pt;">인증코드를 입력해주세요.</span><br>
             <input type="text" name="input_confirmCode" id="input_confirmCode" required />
             <br><br>
             <button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>
       	</c:if>
       	
       	<c:if test="${requestScope.isUserExists == true && requestScope.sendMailSuccess ==false}">
       		<span style="color:red;">메일발송이 실패했습니다.</span><br>
       	</c:if>
   </p>
</div>


