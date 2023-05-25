<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
                        <image src="resources/img/admin/icon_check.png" width="18"/><span>공방 목록</span>
                    </div>
                    
                </div>
            </div>

            <form name="craft_application_frm">

                <div class="application_right">
                    <div class="craftOneView">
                        <div class="frm_border" style="height:80px;">
                            <span> <p>공방 상태<br>(임시/정식)</p>
                                <div id="specialized_chkBox" style="margin-top: 17px;">
                                    임시<input type="checkbox" value="temporarily"/>
                                    <label for=""></label>
                                    정식<input type="checkbox" value="formal"/>
                                    <label for="specialized_chk2"></label>          
                                </div>                      
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방이름</p>
                                <input type="text" class="view" readonly/>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 신청자 ID</p>
                                <input type="text" class="view" />
                            </span>
                        </div>
                        <div class="image">
                            <span> <p>공방 사진</p>
                                
                            </span>
                        </div>
                        <div class="image">
                            <span> <p>공방 대표자 사진</p>
                                
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>공방 연락처</p>
                                <input type="text" class="view" />
                            </span>
                        </div>
                        <div class="frm_border" style="height: 185px;" id="view_address">
                            <span style="display: block;">  <p style="width: 100px; display: inline-block;">공방 주소</p>
                                <span>
                                    <input type="text" class="view" value="우편번호"/>
                                </span>

                                <span>
                                        <input type="text" id="address" class="upload" value="주소" name="address"  readonly  style="width: 300px; "/>&nbsp;&nbsp;&nbsp;
                                        <input type="text" id="detailAddress" class="upload"  value="상세주소" name="detailAddress"   style="width: 300px;"/>&nbsp;
                                </span>
                                
                                <span>
                                    <input type="text" class="upload" id="extraAddress" value="부가주소" name="extraAddress"
                                                                />
                                </span>
                            </span>
                        </div>
                        <div class="frm_border_2">
                            <span> <p>자기소개</p>
                                <textarea id="self_introduce" ></textarea>
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>전문품목</p>
                                <input type="text" class="view" style="width: 500px;" />
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p>총 경력기간</p>
                                <input type="text" class="view" />
                            </span>
                        </div>
                        <div class="frm_border_3">
                            <span> <p>기타 경력사항</p>
                                <textarea id="other_career"></textarea>
                            </span>
                        </div>
                        <div class="image">
                            <span> <p>자격증</p>
                                
                            </span>
                        </div>
                        <div class="frm_border">
                            <span> <p> * 희망급여</p> 
                               <input type="text" class="view" style="text-align:right; padding-right: 15px;" /><span>천원</span>
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
