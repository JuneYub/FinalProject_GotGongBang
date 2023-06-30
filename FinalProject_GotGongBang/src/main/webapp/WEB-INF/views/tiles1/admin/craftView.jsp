<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a09d03e3f703da8ee523eb3e3c17431&libraries=services"></script> 

<script type="text/javascript">

	$(document).ready(function() {
		
		
		//공방상태(정식/임시)체크!
		if($("input.craft_status").val() == '1'){
			$("input[name='craft_status']").val(1);
			$("input#formal").prop("checked", true);
		}else{
			$("input#temporarily").prop("checked", true);
			$("input[name='craft_status']").val(0);

		}
		
		$("input#formal").click(function() {
			$("input#temporarily").prop("checked", false);
			$("input[name='craft_status']").val(1);

		});
		
		$("input#temporarily").click(function () {
			$("input#formal").prop("checked", false);
			$("input[name='craft_status']").val(0);

		});
		
	
	});



	
	function go_edit() {
		const frm = document.craft_view_frm;
		frm.method = "post";
		frm.action = "<%= ctxPath%>/craft_edit.got";
		frm.submit();
	};


		
		 
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
                    <input type="hidden" id="num_hidden" name="craft_num_pk" value="${requestScope.craftvo.craft_num_pk}"/>
                    <input type="hidden" id="lat_hidden" name="craft_latitude" value="${requestScope.craftvo.craft_latitude}"/>
                    <input type="hidden" id="lng_hidden" name="craft_longitude" value="${requestScope.craftvo.craft_longitude}"/>
                <div class="application_right">
                	                    <p style="display: inline; magin:0; float: right; width: 210px; height: 10px; font-size: 12pt;"> * 표시는 수정 가능합니다.</p>
               
                    <div class="craftOneView">
                        <div class="frm_border" style="height:80px;">
                            <span> <p>공방 상태<br>(임시/정식)</p>
                                <div id="specialized_chkBox" style="margin-top: 17px;">
                                     	임시<input type="checkbox" class="craft_status" id="temporarily" value="${requestScope.craftvo.craft_status}"/>
                                    	정식<input type="checkbox" class="craft_status" id="formal" value="${requestScope.craftvo.craft_status}"/>
                                    	<input type="hidden" id="status_hidden" name="craft_status" value=""/>
                                </div>                      
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방이름</p>
                                <input type="text" class="view" name="craft_name" value="${requestScope.craftvo.craft_name}" readonly/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 신청자 ID</p>
                                <input type="text" class="view" name="partner_id_fk" value="${requestScope.craftvo.partner_id_fk}" readonly/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p> * 공방 대표자 이름</p>
                                <input type="text" class="view" name="craft_representative" value="${requestScope.craftvo.craft_representative}"/>
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
                            <span> <p> * 공방 연락처</p>
                                <input type="text" class="view" name="craft_mobile" value="${requestScope.craftvo.craft_mobile}"/>
                            </span>
                        </div>
                        <div class="frm_border" style="height: 185px;" id="view_address">
                            <span style="display: block;">  <p style="width:100px; display: inline-block;">공방 주소</p>
                   
                                <span>
                                    <input type="text" class="view" name="craft_post_code" value="${requestScope.craftvo.craft_post_code}"/>
                                </span>

                                <span>
                                    <input type="text" id="address" class="upload" name="craft_address" value="${requestScope.craftvo.craft_address}" name="address" style="width: 300px; padding: 0 10px; margin: 0;"/>
                                    <input type="text" id="detailAddress" class="upload" name="craft_detail_address" value="${requestScope.craftvo.craft_detail_address}" name="detailAddress"   style="width: 300px; padding:0 10px; margin: 0 10px;" readonly="readonly"/>
                                </span>
                                
                                <span>
                                    <input type="text" class="upload" id="extraAddress" name="craft_extra_address" value="${requestScope.craftvo.craft_extra_address}" name="extraAddress" style="padding:0 10px; margin: 0;" readonly="readonly"/>
                                </span>
                            </span>
                        </div>
                        <div class="frm_border_2">
                            <span> <p> * 공방 한 줄 소개</p>
                                <input id="self_introduce" name="craft_Introduce" value="${requestScope.craftvo.craft_Introduce}" style="height: 70px;"/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>전문품목</p>
                                <input type="text" class="view" name="craft_specialty" value="${requestScope.craftvo.craft_specialty}" style="width: 500px;" readonly="readonly" />
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p> * 총 경력기간</p>
                                <input type="text" class="view" name="craft_career" value="${requestScope.craftvo.craft_career}"/>
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
                                <c:if test="${empty requestScope.reviews}">
                                		아모고토없다.
                          	 	</c:if>
                            	<c:if test="${not empty requestScope.reviews}">
                               		<input type="text" class="view" name="craft_rating" style="padding-right: 15px;" value="ㅇㅇ"/>
                            	</c:if>
                           	 </span>
                        </div>
                    </div>
                </div>

                <div class="application_right">
                    <div class="craftOneView_btn">
                    <!-- javascript:location.href='/craft_edit.got?craft_num_pk=${requestScope.craftvo.craft_num_pk}' -->
                        <button class="del" type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/craft_del.got?craft_num_pk=${requestScope.craftvo.craft_num_pk}'">삭제</button>
					    <button class="update" type="button" onclick="go_edit()">수정</button>
                    </div>
                </div>
				
				
            </form>    
        </div>
    </div>

</div>
<!--본문 끝 -->
