<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script>
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
                                 <th style="width: 10%;">공방 번호</th>
                                 <th style="width: 40%;">공방 이름</th>
                                 <th style="width: 20%;">공방 신청자 ID</th>                                    
                                 <th style="width: 20%;">공방 상태(임시/정식)</th>
                             </tr>
                         </thead>

                         <tbody>
                             <tr>
                                 <td>1</td>
                                 <td>got공방임다</td>
                                 <td>김진솔</td>
                                 <td>임시</td>
                             </tr>
                             <tr>
                                 <td>2</td>
                                 <td>got공방임다</td>
                                 <td>김진솔</td>
                                 <td>정식</td>
                             </tr>
                             <tr>
                                 <td>3</td>
                                 <td>got공방임다</td>
                                 <td>김진솔</td>
                                 <td>임시</td>
                             </tr>
                             
                         </tbody>

                     </table>

                 </div>


             </form>    
         </div>
     </div>

 </div>
 <!--본문 끝 -->