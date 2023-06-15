<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<style type="text/css">
 
 	table.ojh_table td, table.ojh_table th {
		
		border-bottom: none !important;  
	}
 	
 	.ojh_form-field th {
 		padding: 7px 0px 0px 14px;
 	}
 
 	padding: 9px 0px 0px 14px;
</style>

<script type="text/javascript">


	$(document).ready(function(){
		
		$("button#btnWrite").click(function(){
			

			$("input[name=attach]").off().on("change", function(){

				if (this.files && this.files[0]) {

					var maxSize = 1 * 1024 * 1024;
					var fileSize = this.files[0].size;

					if(fileSize > maxSize){
						alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
						$(this).val('');
						return false;
					}
				}
			});
			
			// 문의아이디 유효성 검사
			
			// 문의제목 유효성 검사
			const inquiry_title = $("input#inquiry_title").val().trim();
			if(inquiry_title == "") {
				alert("문의제목을 입력하세요!!");
				return;
			} 
			
			// 문의내용 유효성 검사
			const inquiry_content = $("textarea#inquiry_content").val().trim();
			if(inquiry_content == "") {
				alert("문의내용을 입력하세요!!");
				return;
			}
			
			/* // 비밀번호 유효성 검사
			const inquiry_pw = $("input#inquiry_pw").val().trim();
			if(inquiry_pw == "") {
				alert("비밀번호를 입력하세요!!");
				return;
			}*/
			
			const frm = document.addFrm;
			frm.method = "post";
			frm.action = "<%= ctxPath%>/board_inquiryEnd.got";
			frm.submit();
			});
		
	});
</script>

 <div id="ojh_content">
        <section class="ojh_page_content_inquire">
            <header class="ojh_page-header ojh_page-header--customer" style="height: 200px;">
              <span class="page-header__backdrop">
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
              </span>
              <h2 class="page-header__title aos-init aos-animate" data-aos="fade-up">
                <span aria-hidden="true" data-breadcrumb-menu="고객센터">고객센터</span>
                <span data-breadcrumb-current="온라인 문의">온라인 문의</span>
              </h2>

            </header>
            <form name="addFrm" enctype="multipart/form-data">
            	<div id="ojh_category">
                    <div class="ojh_center"> 고객센터 </div>
                    <ul class="ojh_sub_category">
                       <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/board_notice.got'">공지사항</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/board_inquiry.got'">온라인 문의</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/board_question.got'">질문 게시판</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/board-faq.got'">FAQ</a>
                        </li>
                    </ul>
                </div>
            	
                <div class="ojh_form">
                    <input type="hidden"/>
                    <input type="hidden"/>
                  <fieldset style="border: 0; width: 850px;">
                  	
                  	<c:if test='${requestScope.fk_seq eq ""}'>
                        <legend>문의사항 입력</legend>
                    </c:if>
                    
                    <c:if test='${requestScope.fk_seq ne ""}'>
						<legend>답변 입력</legend>
					</c:if>    
                        <p><strong>*</strong> 표시는 필수 입력 사항입니다.</p>
                        
                    <table class="ojh_table table--row">
                          <div class="ojh_table">
                        <tbody>
                            <tr class="ojh_form-field">
                                <th scope="row">아이디</th>  
                                
                                <c:if test= "${not empty sessionScope.loginuser}"> 
                                	<td>
	                                    <input class="ojh_form-input" type="text" name="user_id_fk" id="user_id_fk" value="${sessionScope.loginuser.user_id_pk}" readonly />
	                                    <div class="form-field__feedback" data-field-feedback="product_name"></div>
	                                </td>    
	                            </c:if>
                                
                                
                                <c:if test="${not empty sessionScope.loginpartner}">
                                	<td>	
	                                    <input class="ojh_form-input" type="text" name="partner_id_pk" id="partner_id_pk" value="${sessionScope.loginpartner.partner_id_pk}" readonly />
	                                    <div class="form-field__feedback" data-field-feedback="product_name"></div>
	                                </td>   
                                </c:if>
                                
                            </tr>
                            <tr class="ojh_form-field">
                                <th scope="row">문의제목 <strong>*</strong></th>
                                <td>
                                <c:if test='${requestScope.fk_seq eq ""}'>
                                    <input class="ojh_form-input" type="text" id="inquiry_title" name="inquiry_title" title="문의제목 입력" placeholder="문의하실 내용의 제목을 입력해주세요.">
                                	<div class="form-field__feedback" data-field-feedback="title"></div>
                                </c:if>
                                
                                <c:if test='${requestScope.fk_seq ne ""}'>     
                                	<input class="ojh_form-input" type="text" id="inquiry_title" name="inquiry_title" value="${requestScope.inquiry_title}" readonly />
                                	<div class="form-field__feedback" data-field-feedback="title"></div>
                                </c:if>
                                
                                	    
                                </td>
                            </tr>
                            <tr class="ojh_form-field">
                                <th scope="row">문의내용 <strong>*</strong></th>
                                <td>
                                    <textarea class="ojh_form-input" rows="15" name="inquiry_content" id="inquiry_content" title="문의내용 입력" placeholder="하이픈에 궁금하신 점이 있으시다면 편하게 문의 내용 남겨주세요. 확인 후 영업일 기준 3일 내 연락드리겠습니다." > </textarea>
                                    <div class="form-field__feedback" data-field-feedback="inquiry_content"></div>
                                </td>
                            </tr>
                            <tr class="ojh_form-field">
                                <th scope="row">첨부파일</th>
                                <td>
                                    <div class="ojh_form-attached-file" style="padding: 17px 0px 0px 10px;">
                                        <div class="ojh_form-attached-file__wrap">
                                            <label class="ojh_form-attached-file__trigger">
                                                <input class="ojh_form-attached-file__trigger-file" name="attach" type="file" accept=".jpg, .jpeg, .png, .pdf, .xls,.xlsx" ><span class="ojh_form-attached-file__trigger-name"></span>
                                            </label>
                                        </div>
                                        <div class="ojh_form-attached-file__wrap">
                                            <p class="ojh_form-attached-file__info" ></p>
                                            <ul class="ojh_form-attached-file__list">
                                                
                                            </ul>
                                            <p class="ojh_form-attached-file__feedback" data-field-feedback="ojh_form-attached-file"></p>
                                        </div>
                                    </div>
                                </td>
                             </tr>
                             <!-- <tr class="ojh_form-field"> 
                             	<th scope="row">비밀번호 <strong>*</strong></th>
                             	<td style="padding: 30px 0px 0px 0px;">
									<input type="password" name="inquiry_pw" id="inquiry_pw"> 
								</td>
                             </tr> -->
                          </div> 
                        </tbody>
                    </table>
                  </fieldset>
                  
                  <input type="hidden" name="fk_seq" value="${requestScope.fk_seq}" /> 
				  <input type="hidden" name="groupno" value="${requestScope.groupno}" /> 
			      <input type="hidden" name="depthno" value="${requestScope.depthno}" /> 
			      <input type="hidden" name="partner_chk" value="${requestScope.partner_chk}" /> 
			     
				                  
                  <ul id="ojh_form_ul">
					<li style="padding: 0 15px;"><a class="ojh_button button--outline-point" onclick="javascript:history.back()" style="background: #fff;
                        color: #400099;">취소</a></li>
					<li>
						<button type="button" class="ojh_button" id="btnWrite" name="btnWrite">문의하기</button>
					</li>
				 </ul>
                </div>
            </form>
        </section>
    </div>