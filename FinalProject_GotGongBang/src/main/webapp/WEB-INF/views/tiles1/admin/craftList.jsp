<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   

<style type="text/css">

    .subjectStyle {font-weight: bold;
    			   color: #400099;
    			   cursor: pointer;}
</style>

<script>


$(document).ready(function(){
	  
	  $("span.craft_name").bind("mouseover", function(e){
		  $(e.target).addClass("subjectStyle");
	  });
	  
	  $("span.craft_name").bind("mouseout", function(e){
		  $(e.target).removeClass("subjectStyle"); 
	  });
	  
});






//////////////////////////////
// Function Declaration //
	
	function goView(craft_num_pk){
		  location.href="<%= ctxPath%>/craft_view.got?craft_num_pk="+craft_num_pk;
	}



</script>


 <!-- (어드민) 공방 목록 보기(craft_list) 본문시작 -->
 <div id="admin_container">
     <div id="admin_contents">

         <div id="introduce"></div>

         <div id="craft_application">
             <div id="application_left">
                 <div class="left_list">
                     <div style="font-size: 15pt; color: #400099; font-weight: 600; border-bottom: solid 1px rgb(152, 152, 152); padding-bottom: 13px;">
                         Admin
                     </div>
                     <div>
                         <image src="resources/img/admin/icon_check.png" width="18"/><span>공방 목록</span>
                     </div>
                 </div>
             </div>

             <form name="craft_application_frm">

                 <div class="application_right" style="height: auto; margin-top: 10px;">
                     <div class="list"><span><image src="resources/img/admin/list_2 (2).png" width="35"/>&nbsp;&nbsp;공방 목록</span></div>
                     <table style="width: 900px" class="craft_list">

                         <thead>
                             <tr>
                                 <th style="text-align: center;">공방 번호</th>
                                 <th style="text-align: center;">공방 이름</th>
                                 <th style="text-align: center;">공방 신청자 ID</th>                                    
                                 <th style="text-align: center;">공방 상태(임시/정식)</th>
                             </tr>
                         </thead>

                         <tbody>
                         <c:if test="${empty requestScope.craftList}">
                         </c:if>
                         
                         <c:if test="${not empty requestScope.craftList}">
                         	<c:forEach var="craftvo" items="${requestScope.craftList}">
	                             <tr>
		                             <td>${craftvo.craft_num_pk}</td>
		                             <td>
								       <span class="craft_name" onclick="goView('${craftvo.craft_num_pk}')" style="padding-left: 128px;">${craftvo.craft_name}
								       </span>
									</td>
		                             <td>${craftvo.partner_id_fk}</td>
	                                 <c:if test="${craftvo.craft_status == 0}">
		                                 <td>임시</td>
	                                 </c:if>
	                                 <c:if test="${craftvo.craft_status == 1}">
	                                     <td>정식</td>
	                                 </c:if>
	                             </tr>
                             </c:forEach>
                         </c:if>
                             
                         </tbody>

                     </table>

                 </div>


             </form>    
         </div>
     </div>

 </div>
 <!--본문 끝 -->