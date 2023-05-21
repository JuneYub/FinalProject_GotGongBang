<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script>
 	
 	$(document).ready(function() {
 		$("span.error").hide();
		$("input#file").focus();
		
	});


</script>

<!-- (어드민) 공방 신청 본문시작 -->
<div id="admin_container">
    <div id="admin_contents">

        <div id="introduce"></div>

        <div id="craft_application">
            <div id="application_left">
                <div class="left_list">
                    <div style="font-size: 15pt; color: #400099; font-weight: 600; border-bottom: solid 1px rgb(152, 152, 152); padding-bottom: 13px;">
                        공방 신청
                    </div>
                    <div>
                        <image src="resources/img/admin/icon_check.png" width="18"/><span>공방 소개</span>
                    </div>
                    <div>
                        <image src="resources/img/admin/icon_check.png" width="18"/><span>경력사항</span>
                    </div>
                    <div>
                        <image src="resources/img/admin/icon_check.png" width="18"/><span> 자격증 </span>
                    </div>
                    <div>
                        <image src="resources/img/admin/icon_check.png" width="18"/><span> 희망급여 </span>
                    </div>
                </div>
            </div>

            <form name="craft_application_frm">

                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;공방 소개</span></div>
                    <div class="image">
                        <span> <p>공방 사진</p>
                            <div class="filebox" >
                                <input class="upload-name" value="첨부파일" placeholder="첨부파일" style="margin-bottom: 10px;" readonly="readonly"/>
                                <label for="file">파일찾기</label> 
                                <input type="file" id="file"/>
                                <span class="error" style="display: inline-block; margin:0 0 30px 20px; color:#400099;">※ 공방 사진은 필수입력 사항입니다.</span>
                            </div>
                        </span>
                    </div>
                    <div class="frm_border">
                        <span> <p>닉네임</p>
                            <input type="text" class="upload"/>
                            <input type="button" class="check_button" id="check_button" value="중복 확인" onclick="">
                            <span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 닉네임은 필수입력 사항입니다.</span>
                        </span>
                    </div>
                    <div class="frm_border_2">
                        <span> <p>자기소개</p>
                            <textarea id="self_introduce"></textarea>
                            <span class="error" style="display: inline-block; margin-top:50px;  color:#400099;">※ 자기소개는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                    <div class="frm_border">
                        <span> <p>지역</p>
                            <input type="text" class="upload"/> 
                            <span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 지역은 필수입력 사항입니다.</span>
                        </span>
                    </div>
                    <div class="frm_border">
                        <span><p>전문분야</p>
                            <div id="specialized_chkBox">
                              	  가방/핸드백<input type="checkbox" name="specialized_field" value="bag"/>
                                <label for="specialized_chk1"></label>
                             	  신발<input type="checkbox" name="specialized_field" value="shoes"/>
                                <label for="specialized_chk2"></label>
                              	  지갑<input type="checkbox" name="specialized_field" value="wallet"/>
                                <label for="specialized_chk3"></label>
                              	  벨트<input type="checkbox" name="specialized_field" value="belt"/>
                                <label for="specialized_chk4"></label>
                             </div>                                
                             <span class="error" style="display: inline-block; color:#400099;">※ 전문분야는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;경력사항</span></div>
                    <div class="frm_border">
                        <span> <p>총 경력기간</p>
                            <label for="career_term"></label>
                            <select name = "career">
                                <option value="select" selected >선택하세요</option>
                                <option value="newcomer">신입</option>
                                <option value="one">1년</option>
                                <option value="two">2년</option>
                                <option value="three">3년</option>
                                <option value="four">4년</option>
                                <option value="five">5년</option>
                                <option value="six">6년</option>
                                <option value="seven">7년</option>
                                <option value="eight">8년</option>
                                <option value="nine">9년</option>
                                <option value="tenover">10년 이상</option>
                            </select>
                            <span class="error" style="display: inline-block; color:#400099;  margin-left:20px;">※ 전문분야는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                    <div class="frm_border_3">
                        <span> <p>기타 경력사항</p>
                            <textarea id="other_career"></textarea>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;자격증</span></div>
                    <div class="Certificate">
                        <span> <p>자격증</p>
                            <div class="filebox">
                                <input class="upload-name" value="첨부파일" placeholder="첨부파일" style="margin-bottom: 10px;" readonly="readonly"/>
                                <label for="Certificate_file">파일찾기</label> 
                                <input type="file" id="Certificate_file"/>
                            </div>
                            <span class="error" style="display: inline-block; color:#400099;  margin-left:20px;">※ 자격증은 필수입력 사항입니다.</span>
                        </span>
                    </div>
                </div>


                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="32" />&nbsp;&nbsp;희망급여</span></div>
                    <div class="frm_border">
                        <span> <p>희망급여</p> 
                            <input type="text" class="upload" id="salary" style="text-align:right; padding-right: 15px;" placeholder="1,000원 단위로 입력하세요."/><span>원</span>
                        	<span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 희망급여는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="submit_box">
                        <button class="submit_back" type="button" onclick="">이전</button>
		    			<button class="submit_go" type="button" onclick="">신청</button>
                    </div>
                </div>


            </form>    
        </div>
    </div>

</div>
<!--본문 끝 -->