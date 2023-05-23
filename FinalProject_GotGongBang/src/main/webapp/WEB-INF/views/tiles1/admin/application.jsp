<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script>

	let b_flag_nickname_click = false;
	// "공방이름 중복확인"을 클릭했는지 안했는지 여부를 알아오기위한 변수

 	$(document).ready(function() {
 		
 		$("span.error").hide();
 		$("span.error_2").hide();
 		$("input#nickname").focus();
 		
 		// 공방이름 필수 입력
		$("input#nickname").blur( (e) => {
			if($(e.target).val().trim() == ""){
			
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름
				
			}else{
				//공백이 아닌 글자를 입력했을 경우
				const regExp = /^[가-힣]*$/;
				const bool = regExp.test($(e.target).val());
				
				if(bool){
					$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
					$(e.target).parent().find("span.error").hide();
	
					$("input#hp1").focus();
				}
				else{
					$(e.target).parent().find("span.error_2").show();
					$(e.target).focus();	
				}
			}
		
		});
 		
 		
 		
		$("input#hp1").blur( (e) => {
			const regExp = /^[0-9][0-9]{1,2}$/g; 
			const bool = regExp.test($(e.target).val());


			if(!bool){
				//국번이 정규표현식에 위배된 경우
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				//$(e.target).next().show(); 또는
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름4
				
			}else{
				//국번 정규표현식에 맞는 경우
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
				$(e.target).parent().find("span.error").hide();

			}
			
		});


		$("input#hp2").blur( (e) => {
			const regExp = /^[1-9][0-9]{2}$/g; 
			const bool = regExp.test($(e.target).val());


			if(!bool){
				//국번이 정규표현식에 위배된 경우
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				//$(e.target).next().show(); 또는
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름4
				
			}else{
				//국번 정규표현식에 맞는 경우
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
				$(e.target).parent().find("span.error").hide();

			}
			
		});
		


		$("input#hp3").blur( (e) => {
			const regExp = /^\d{4}$/g; 
			const bool = regExp.test($(e.target).val());


			if(!bool){
				//국번이 정규표현식에 위배된 경우
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				//$(e.target).next().show(); 또는
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름4
				
			}else{
				//국번 정규표현식에 맞는 경우
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
				$(e.target).parent().find("span.error").hide();

			}
			
		});

 		

	}); // end of $(document).ready(function() ----------------------------
				

////////////Function declare ////////////
function goComplete() {
		
	
	/*const frm = document.craft_application_frm;
	frm.action = "adminComplete.got";
	frm.method = "post";
	frm.submit();
	*/
}
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
                        <image src="resources/img/admin/icon_check.png" width="18"/><span>공방 기본 정보</span>
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
	                    <p style="display: inline; magin:0; float: right; width: 210px; height: 10px; font-size: 12pt;"> * 표시는 필수 입력사항입니다.</p>
	                <div class="list">
	                    <span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;공방 기본 정보</span>
                    </div>
                    <div class="image">
                        <span> <p> * 공방 사진</p>
                            <div class="filebox" >
                                <input class="upload-name" id="upload-image" value="" placeholder="첨부파일" style="margin-bottom: 10px;" readonly="readonly" required="required"/>
                                <label for="file">파일찾기</label> 
                                <input type="file" id="file"/>
                                <span class="error" style="display: inline-block; margin:0 0 30px 20px; color:#400099;">※ 공방 사진은 필수입력 사항입니다.</span>
                            </div>
                        </span>
                    </div>
                    <div class="frm_border">
                        <span> <p> * 공방 이름</p>
                            <input type="text" class="upload" id="nickname" maxlength="10"/>
                            <input type="button" class="check_button" id="check_button" value="중복 확인" onclick="">
                            <span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 공방 이름은 필수입력 사항입니다.</span>
                            <span class="error_2" style="display: inline-block; color:#400099; margin-left:20px;">※ 공방 이름은 한글로만 입력 가능합니다.</span>
                        </span>
                    </div>
                 
                    <!-- <div class="frm_border">
                        <span> <p> * 지역</p>
                            <input type="text" class="upload"/> 
                            <span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 지역은 필수입력 사항입니다.</span>
                        </span>
                    </div>
                     -->
                   <div class="frm_border">
                     <span> <p> * 공방 연락처</p>
	                     <input type="text" id="hp1" class="upload" name="hp1" size="6" maxlength="3" style="text-align: center; width: 110px;"/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	           			 <input type="text" id="hp2" class="upload" name="hp2" size="6" maxlength="4" style="text-align: center; width: 110px;"/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	            		 <input type="text" id="hp3" class="upload" name="hp3" size="6" maxlength="4" style="text-align: center; width: 110px;"/>
	             		 <span class="error">휴대폰 형식이 아닙니다.</span>
             		 </span>
                   </div>
                    
                    <div class="frm_border" style="height: 122px;">
                     <span> <p> * 공방 주소</p>
	                     <input type="text" id="postcode" class="upload" name="postcode" size="6" maxlength="5" style="width: 201px;" placeholder="우편번호 찾기를 클릭하세요." />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				 <%-- 우편번호 찾기 --%>
            			 <img id="zipcodeSearch" src="resources/img/admin/b_zipcode.gif" style="margin-top:8px; width: 90px; height: 25px;" />
           				 <span class="error">우편번호 형식이 아닙니다.</span>
           		     </span>
           		     <span style="margin:10px 0 0 150px;">
           				 <input type="text" id="address" class="upload" name="address" size="40" placeholder="주소"  style="width: 350px; "/>&nbsp;&nbsp;&nbsp;
           				 <input type="text" id="detailAddress" class="upload" name="detailAddress" size="40" placeholder="상세주소" style="width: 350px;"/>&nbsp;
            			<span class="error">주소를 입력하세요</span>
            		 </span>
                   </div>
                    <div class="frm_border_2">
                        <span> <p> * 자기소개</p>
                            <textarea id="self_introduce"></textarea>
                            <span class="error" style="display: inline-block; margin-top:50px;  color:#400099;">※ 자기소개는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                    <div class="frm_border">
                        <span><p> * 전문 품목</p>
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
                             <span class="error" style="display: inline-block; color:#400099;">※ 전문 품목은 필수입력 사항입니다.</span>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;경력사항</span></div>
                    <div class="frm_border">
                        <span> <p> * 총 경력기간</p>
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
                        <span> <p> * 자격증</p>
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
                        <span> <p> * 희망급여</p> 
                            <input type="text" class="upload" id="salary" style="text-align:right; padding-right: 15px;" placeholder="1,000원 단위로 입력하세요."/><span>원</span>
                        	<span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 희망급여는 필수입력 사항입니다.</span>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="submit_box">
                        <button class="submit_back" type="button" onclick="javaScript:history.back();">이전</button>
		    			<button class="submit_go" type="button" onclick="goComplete(); return false;">신청</button>
                    </div>
                </div>


            </form>    
        </div>
    </div>

</div>
<!--본문 끝 -->