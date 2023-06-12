<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script>

	$(document).ready(function() {
		
		//공방상태(정식/임시)체크!
		if($("input.craft_status").val() == '1'){
			$("input#formal").prop("checked", true);
		}else{
			$("input#temporarily").prop("checked", true);
		}
		
		$("input#formal").click(function() {
			$("input#temporarily").prop("checked", false);
		});
		
		$("input#temporarily").click(function () {
			$("input#formal").prop("checked", false);
		});
		
		
		
		
		
		
		
	});

</script>



<!-- (어드민) 공방 정보 상세보기 본문시작 -->
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
                        <image src="resources/img/admin/icon_check.png" width="18"/><a href="<%= ctxPath%>/craft_list.got"><span>공방 목록</span></a>
                    </div>
                    
                </div>
            </div>

            <form name="craft_view_frm">

                <div class="application_right">
                    <div class="craftOneView">
                        <div class="frm_border" style="height:80px;">
                            <span> <p>공방 상태<br>(임시/정식)</p>
                                <div id="specialized_chkBox" style="margin-top: 17px;">
                                     	임시<input type="checkbox" class="craft_status" name="craft_status" id="temporarily" value="${craftvo.craft_status}"/>
                                    <label for=""></label>
                                    	정식<input type="checkbox" class="craft_status" name="craft_status" id="formal" value="${craftvo.craft_status}"/>
                                    <label for="specialized_chk2"></label>          
                                </div>                      
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방이름</p>
                                <input type="text" class="view" value="${craftvo.craft_name}" readonly/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 신청자 ID</p>
                                <input type="text" class="view" value="${craftvo.partner_id_fk}" readonly/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 대표자 이름</p>
                                <input type="text" class="view" value="${craftvo.craft_representative}"/>
                            </span>
                        </div>
                        <div class="image">
                            <span> <p>공방 사진</p>
                              <a href="<%= ctxPath%>/craft_download.got?craft_num_pk=${requestScope.craftvo.craft_num_pk}">${requestScope.paraMap.craft_image_orgFilename}</a>
                            </span>
                        </div>
                        <div class="image">
                            <span> <p>공방 대표자 사진</p>
                              <a href="<%= ctxPath%>/craft_download.got?craft_num_pk=${requestScope.craftvo.craft_num_pk}">${requestScope.paraMap.craft_representative_image_orgFilename}</a>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 연락처</p>
                                <input type="text" class="view" value="${craftvo.craft_mobile}"/>
                            </span>
                        </div>
                        <div class="frm_border" style="height: 185px;" id="view_address">
                            <span style="display: block;">  <p style="width:100px; display: inline-block;">공방 주소</p>
                   
                                <span>
                                    <input type="text" class="view" value="${craftvo.craft_post_code}"/>
                                </span>

                                <span>
                                    <input type="text" id="address" class="upload" value="${craftvo.craft_address}" name="address" style="width: 300px; padding: 0 10px; margin: 0;"/>
                                    <input type="text" id="detailAddress" class="upload"  value="${craftvo.craft_detail_address}" name="detailAddress"   style="width: 300px; padding:0 10px; margin: 0 10px;"/>
                                </span>
                                
                                <span>
                                    <input type="text" class="upload" id="extraAddress" value="${craftvo.craft_extra_address}" name="extraAddress" style="padding:0 10px; margin: 0;"/>
                                </span>
                            </span>
                        </div>
                        <div class="frm_border_2">
                            <span> <p>공방 한 줄 소개</p>
                                <input id="self_introduce" value="${craftvo.craft_Introduce}" style="height: 70px;"/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>전문품목</p>
                                <input type="text" class="view" value="${craftvo.craft_specialty}" style="width: 500px;" />
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>총 경력기간</p>
                                <input type="text" class="view" value="${craftvo.craft_career}"/>
                            </span>
                        </div>
                        <div class="frm_border_3">
                            <span> <p>기타 경력사항</p>
                            <%
								String other_career = (String)session.getAttribute("other_career");
							%>
                                <textarea id="other_career"><%= other_career%></textarea>
                            </span>
                            <%
                            	session.removeAttribute(other_career);
                            %>
                        </div>
                        <div class="image">
                            <span> <p>자격증</p>
                                <a href="<%= ctxPath%>/craft_download.got?craft_num_pk=${requestScope.craftvo.craft_num_pk}">${requestScope.paraMap.craft_certificate_orgFilename}</a>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p> * 평점</p> 
                               <input type="text" class="view" style="padding-right: 15px;" />
                            </span>
                        </div>
                    </div>
                </div>

                <div class="application_right">
                    <div class="craftOneView_btn">
                        <button class="del" type="button" onclick="">삭제</button>
					    <button class="update" type="button" onclick="">수정</button>
                    </div>
                </div>



            </form>    
        </div>
    </div>

</div>
<!--본문 끝 -->
