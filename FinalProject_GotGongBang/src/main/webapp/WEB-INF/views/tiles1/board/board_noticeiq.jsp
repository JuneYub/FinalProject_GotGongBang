<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<style type="text/css">
  table.ojh_table th, table.ojh_table td {
  	  border-bottom: none !important;
  }
</style>

<script type="text/javascript">


	$(document).ready(function(){
		$("button#btnWrite").click(function(){
						
			// 문의아이디 유효성 검사
			
			// 문의제목 유효성 검사
			const inquiry_title = $("input#notice_title").val().trim();
			if(inquiry_title == "") {
				alert("공지 제목을 입력하세요!!");
				return;
			}
			
			// 문의내용 유효성 검사
			const inquiry_content = $("textarea#notice_content").val().trim();
			if(inquiry_content == "") {
				alert("공지 내용을 입력하세요!!");
				return;
			}
			
			/* // 비밀번호 유효성 검사
			const inquiry_pw = $("input#inquiry_pw").val().trim();
			if(inquiry_pw == "") {
				alert("비밀번호를 입력하세요!!");
				return;
			}*/
			
			const frm = document.add_noticeFrm;
			frm.method = "post";
			frm.action = "<%= ctxPath%>/board_noticeiqEnd.got";
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
                <span aria-hidden="true" data-breadcrumb-menu="고객센터">공지사항</span>
                <span data-breadcrumb-current="온라인 문의">공지사항 등록</span>
              </h2>

            </header>
            <form name="add_noticeFrm" enctype="multipart/form-data">
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
                  		
                  		<legend>공지사항 등록</legend>
			
                        <p><strong>*</strong> 표시는 필수 입력 사항입니다.</p>
                        
                    <table class="ojh_table table--row">
                          <div class="ojh_table">
                        <tbody>
                            <tr class="ojh_form-field">
                                <th scope="row">아이디</th>
                                <td>
                                    <input class="ojh_form-input" type="text" name="admin_id_fk" id="admin_id_fk" value="admin" readonly />
                                    <div class="form-field__feedback" data-field-feedback="product_name"></div>
                                </td>
                            </tr>
                            <tr class="ojh_form-field">
                                <th scope="row">공지제목 <strong>*</strong></th>
                                <td>
                                    <input class="ojh_form-input" type="text" id="notice_title" name="notice_title" title="공지제목 입력" placeholder="공지하실 내용의 제목을 입력해주세요.">
                                	<div class="form-field__feedback" data-field-feedback="title"></div>
                                </td>
                            </tr>
                            <tr class="ojh_form-field">
                                <th scope="row">공지내용 <strong>*</strong></th>
                                <td>
                                    <textarea class="ojh_form-input" rows="15" name="notice_content" id="notice_content" title="문의내용 입력" placeholder="하이픈에 궁금하신 점이 있으시다면 편하게 문의 내용 남겨주세요. 확인 후 영업일 기준 3일 내 연락드리겠습니다." > </textarea>
                                    <div class="form-field__feedback" data-field-feedback="notice_content"></div>
                                </td>
                            </tr>
                            <tr class="ojh_form-field">
                                
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