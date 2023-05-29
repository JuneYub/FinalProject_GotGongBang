<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	let b_flag_nickname_click = false;
	// "공방이름 중복확인"을 클릭했는지 안했는지 여부를 알아오기위한 변수
	let b_flag_zipcodeSearch_click = false;
	// "우편번호"를 클릭했는지 안했는지 여부를 알아오기위한 변수

	
 	$(document).ready(function() {
 		
 		$("span.error").hide();
 		$("span.error_2").hide();
 		$("span.error_3").hide();
 		$("span.available").hide();

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
				
				$(e.target).parent().find("span.error_2").hide();
				
				if(bool){	//정규표현식에 만족한 경우
					$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
					$(e.target).parent().find("span.error_2").hide();

				}
				else{	//정규표현식 만족하지 못 한 경우
					$(e.target).parent().find("span.error_2").show();	//한글로만 입력 가능합니다 출력
					$(e.target).focus();
				}

			}
		
		});
 		
 		

		// '공방 이름' 중복 체크 했는지 알아오기 (Ajax)
		$("input#check_button").click(function(){
			b_flag_nickname_click = true;
			
			const nickname = $("input#nickname").val();
			console.log("확인용 nickname : " +nickname);
		
			   	$.ajax({
			    	url:"<%= ctxPath%>/craft_check_name.got",
			    	data:{"nickname":$("input#nickname").val()},
			    	type:"post",
			    	success:function(text){ 
			    		const json = JSON.parse(text); // 객체로 파싱 

			    		console.log("확인용 json : "+ json);
			    		//확인용 json : {"n":0}  확인용 json : {"n":1} 

			  			 if(json.n) {	//1이라면 (이미 존재함)
			 				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
			 				$("input#nickname").prop("disabled", false);
			 				
			 				$("input#nickname").parent().find("span.error_3").show();	//"이미 존재하는 공방입니다"
			    			$("input#nickname").val("");
			  			 }
			  			 else if(!json.n && $("input#nickname").val().trim() !="" ){
							$("input#nickname").parent().find("span.error_3").hide();
							$("input#nickname").parent().find("span.available").show();

			  				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
			  			 }
			  			 
			    	},
			    	error: function(request, status, error){
			            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			          }
			      });

 		
 		
 		//공방 연락처 필수입력
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
			const regExp = /^[1-9][0-9]{2,3}$/g; 
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
		
		/*
		// 우편번호 주소 필수입력
		$("input#postcode").blur( (e) => {
			if($(e.target).val() == ""){	
				//공백입력 경우
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$("button#btnPostcode").prop("disabled", false);
				
				
				$(e.target).parent().find("span.error").show();
		
			}
			else{
				alert("호호호");
				$(e.target).parent().find("span.error").hide();
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
			}

		});	
		*/
		
		//////////////////////////////////////////////////////////////////////
		//우편번호 찾기 클릭했을 때
		$("button#btnPostcode").click(function(){
		 	 b_flag_zipcodeSearch_click = true;

		 	 new daum.Postcode({
	               oncomplete: function(data) {
	                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                   let addr = ''; // 주소 변수
	                   let extraAddr = ''; // 참고항목 변수
	
	                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                       addr = data.roadAddress;
	                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                       addr = data.jibunAddress;
	                   }
	
	                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                   if(data.userSelectedType === 'R'){
	                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                           extraAddr += data.bname;
	                       }
	                       // 건물명이 있고, 공동주택일 경우 추가한다.
	                       if(data.buildingName !== '' && data.apartment === 'Y'){
	                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                       }
	                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                       if(extraAddr !== ''){
	                           extraAddr = ' (' + extraAddr + ')';
	                       }
	                       // 조합된 참고항목을 해당 필드에 넣는다.
	                       document.getElementById("extraAddress").value = extraAddr;
	                   
	                   } else {
	                       document.getElementById("extraAddress").value = '';
	                   }
	
	                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                   document.getElementById('postcode').value = data.zonecode;
	                   document.getElementById("address").value = addr;
	                   // 커서를 상세주소 필드로 이동한다.
	                   document.getElementById("detailAddress").focus();
	               }
	           }).open();

		}); //end of $("button#btnPostcode").click(function() ---------------------
		
		//////////////////////////////////////////////////////////////////////

		
		// 자기소개 필수입력
		$("textarea#self_introduce").blur( (e) => {
			if($(e.target).val().trim() == ""){	
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름
			}else{
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
				$(e.target).parent().find("span.error").hide();
				$("input.specialized_field").focus();
			}
		});
		
		
		//전문 품목 한 개 이상 체크
		$("input.specialized_field").blur( (e) => {
			const chk_cnt = $("input.specialized_field:checked").length;
			
			if(chk_cnt < 1){
				$(e.target).parent().parent().find("span.error").show();

				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$("input.specialized_field").prop("disabled", false);

			}
			else{
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
				$(e.target).parent().parent().find("span.error").hide();		
			}
			
			
		});
		
		
		// 총 경력사항 선택 필수입력
		$("select#career").blur( (e) => {
			let career = $("#career").val();
			if(!career){
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);

				$(e.target).parent().find("span.error").show();
				$("#career").focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름
				return false;
			}
			$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
			$(e.target).parent().find("span.error").hide();
		});
		
		

		
		// 희망급여 필수입력
		$("input#salary").blur( (e) => {
			if($(e.target).val().trim() == ""){	
				
				$("form :input").prop("disabled", true);		// 모든 input 태그를 못쓰게 막음
				$(e.target).prop("disabled", false);
				
				
				$(e.target).parent().find("span.error").show();
				$(e.target).focus();	//다른곳을 클릭 못하게 함 e.target에 포커스 머무름
				
			}else{
				//공백이 아닌 숫자를 입력했을 경우
				/*
				const regExp = /^[1-9][0-9]{1,5}$/g;
				const bool = regExp.test($(e.target).val());
				
				$(e.target).parent().find("span.error_2").hide();
				
				if(bool){	//정규표현식에 만족한 경우
					$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다
					$(e.target).parent().find("span.error").hide();
					
				}
				else{	//정규표현식 만족하지 못 한 경우
					$(e.target).parent().find("span.error_2").show();
				}
				*/
				$("form :input").prop("disabled", false);		// 모든 input 태그를 다 살린다

			}
		});
		
		
		

		  });	//end of $("input#check_button").click(function() ------------------------
		    		
		
		
	}); // end of $(document).ready(function() ----------------------------
				
	
			
	////////////Function declare ////////////
	function goComplete() {
			
		
		/*const frm = document.craft_application_frm;
		frm.action = "adminComplete.got";
		frm.method = "post";
		frm.submit();
		*/
	}
	
	
	////// 희망급여 콤마포함 숫자만 입력 /////
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    //////////////////////////////
	
	
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

            <form name="craft_application_frm" >

                <div class="application_right">
	                    <p style="display: inline; magin:0; float: right; width: 210px; height: 10px; font-size: 12pt;"> * 표시는 필수 입력사항입니다.</p>
	                <div class="list">
	                    <span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;공방 기본 정보</span>
                    </div>
                     <div class="frm_border">
                        <span> <p> * 공방 이름</p>
                            <input type="text" class="upload" id="nickname" maxlength="10" value=""/>
                            <input type="button" class="check_button" id="check_button" value="중복 확인">
                            <span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 공방 이름은 필수입력 사항입니다.</span>
                            <span class="error_2" style="display: inline-block; color:#400099; margin-left:20px;">※ 공방 이름은 한글로만 입력 가능합니다.</span>
                            <span class="error_3" style="display: inline-block; color:#400099; margin-left:20px;">※ 이미 존재하는 공방 이름입니다.</span>
                            <span class="available" style="display: inline-block; color:#400099; margin-left:20px;">사용가능한 공방 이름입니다.</span>
                        </span>
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
                    <div class="image">
                        <span> <p> * 공방 대표자 사진</p>
                            <div class="filebox" >
                                <input class="upload-name" id="upload-image" value="" placeholder="첨부파일" style="margin-bottom: 10px;" readonly="readonly" required="required"/>
                                <label for="file">파일찾기</label> 
                                <input type="file" id="file"/>
                                <span class="error" style="display: inline-block; margin:0 0 30px 20px; color:#400099;">※ 공방 대표자 사진은 필수입력 사항입니다.</span>
                            </div>
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
	             		 <span class="error" style="display: inline-block; color:#400099; margin-left:20px;"> *휴대폰 형식이 아닙니다.</span>
             		 </span>
                   </div>
                    
                    <div class="frm_border" style="height: 205px;">
                  
                     <span> <p> * 공방 주소</p>
	                     <input type="text" id="postcode" class="upload" name="postcode" value="" size="6" maxlength="5" style="width: 201px;"  placeholder="우편번호 찾기를 클릭하세요."  readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				 <%-- 우편번호 찾기 --%>
							<button type="button" id="btnPostcode" class="check_button" style="width: 120px; height: 40px;"> 우편번호 찾기</button>           				 
							<span class="error" style="display: inline-block; color:#400099; margin-left:20px;"> * 우편번호 형식이 아닙니다.</span>
           		     </span>
           		     
           		     <span style="margin:10px 0 0 150px;">
           				 <input type="text" id="address" class="upload" name="address" size="40" placeholder="주소"  style="width: 300px; "/>&nbsp;&nbsp;&nbsp;
           				 <input type="text" id="detailAddress" class="upload" name="detailAddress" size="40" placeholder="상세주소" style="width: 300px;"/>&nbsp;
            		</span>
            		
					<span style="margin:10px 0 0 150px;">
            			<input type="text" class="upload" id="extraAddress" placeholder="부가주소" name="extraAddress"
                                                       class="extra_address" />
            		 </span>
            		 
            		 <span class="error" style="display: inline-block; margin-left:150px; color:#400099;">※ 주소는 필수입력 사항입니다.</span> 
                   
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
                              	  가방/핸드백<input type="checkbox" class="specialized_field" value="bag"/>
                                <label for="specialized_chk1"></label>
                             	  신발<input type="checkbox" class="specialized_field" value="shoes"/>
                                <label for="specialized_chk2"></label>
                              	  지갑<input type="checkbox" class="specialized_field" value="wallet"/>
                                <label for="specialized_chk3"></label>
                              	  벨트<input type="checkbox" class="specialized_field" value="belt"/>
                                <label for="specialized_chk4"></label>
                             </div>                                
                             <span class="error" style="display: inline-block; color:#400099;">※ 전문 품목은 한 개 이상 선택하셔야 합니다.</span>
                        </span>
                    </div>
                </div>

                <div class="application_right">
                    <div class="list"><span><image src="resources/img/admin/single (1).png" width="35"/>&nbsp;&nbsp;경력사항</span></div>
                    <div class="frm_border">
                        <span> <p> * 총 경력기간</p>
                            <label for="career_term"></label>
                            <select name = "career" id="career">
                                <option value="">선택하세요</option>
                                <option value="newcomer">신입</option>
                                <option value="one">1년</option>
                                <option value="two">2년</option>
                                <option value="three">3년</option>
                                <option value="four">4년</option>
                                <option value="five">5년</option>
                                <option value="six">6년</option>
                                <option value="seven">7년</option>
                                <option value="eight">8년이상</option>
                            </select>
                            <span class="error" style="display: inline-block; color:#400099;  margin-left:20px;">※ 경력사항은 필수입력 사항입니다.</span>
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
                           <input type="text" class="upload" id="salary" maxlength="7"  style="text-align:right; padding-right: 15px;" onkeyup="inputNumberFormat(this);" placeholder="1,000원 단위로 입력하세요."/><span>천원</span>
                        	<span class="error" style="display: inline-block; color:#400099; margin-left:20px;">※ 희망급여는 필수입력 사항입니다.</span>
                            <span class="error_2" style="display: inline-block; color:#400099; margin-left:20px;">※ 희망급여는 숫자로만 입력 가능합니다.</span>
                        
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