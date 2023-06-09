<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
   String ctxPath = request.getContextPath();
%>   
<style type="text/css">

	#inquiry_title {border: solid 1px #e6e6e6;
    					padding: 0px 0px 0px 25px;}
	
	
	}
</style>

<script type="text/javascript">

  $(document).ready(function(){
	  
	  <%-- 스마트 에디터 구현 시작  --%>
		//전역변수
	    var obj = [];
	    
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "inquiry_content",
	        sSkinURI: "<%= ctxPath%>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false,
	        }
	    });
	  <%--  스마트 에디터 구현 끝  --%>
	  
	  
	  $("button#btnUpdate").click(function(){
		
		 <%-- 스마트 에디터 구현 시작  --%>
		   // id 가 content 인 textarea 에 에디터 대입
		   obj.getById["inquiry_content"].exec("UPDATE_CONTENTS_FIELD", []);
		 <%-- 스마트 에디터 구현 끝 --%>  
		  
		// 제목 유효성 검사
		const inquiry_title = $("input#inquiry_title").val().trim();
		if(inquiry_title == "") {
			alert("글제목을 입력하세요!!");
			return;
		}
	
		<%--내용 유효성 검사(스마트 에디터 사용 할 경우) 시작  --%>
			let inquiry_content = $("textarea#inquiry_content").val();
			
			inquiry_content = inquiry_content.replace(/&nbsp;/gi, "");  // 공백을  "" 으로 변환 
			
			inquiry_content = inquiry_content.substring(inquiry_content.indexOf("<p>")+3);
			inquiry_content = inquiry_content.substring(0, inquiry_content.indexOf("</p>"));
			
			if(inquiry_content.trim().length == 0) {
				alert("글내용을 입력하세요!!");
				return;
			}
		<%-- 내용 유효성 검사(스마트 에디터 사용 할 경우) 끝 --%>
		  
		// 폼(form)을 전송(submit)
		const frm = document.editFrm;
		frm.method = "post";
		frm.action = "<%= ctxPath%>/editEnd.got";
		frm.submit();
	  });
	  
  });// end of $(document).ready(function(){})-------------------------------

</script>


  <div id="ojh_content">
        <section class="ojh_page_content_inquire">
            <header class="ojh_page-header ojh_page-header--customer" style="height: 200px">
              <span class="page-header__backdrop">
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
              </span>
              <h2 class="page-header__title aos-init aos-animate" data-aos="fade-up">
                <span aria-hidden="true" data-breadcrumb-menu="고객센터">고객센터</span>
                <span data-breadcrumb-current="FAQ">상세보기</span>
              </h2>

            </header>
            
            <form name="editFrm">
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
                  <fieldset style="border: 0; padding: 30px 0px 0px 0px;">
                    <table class="ojh_table table--row">
                        <div class="ojh_qulist">
                            
                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">작성자</div>
                                <input type="hidden" name="inquiry_num_pk" id="inquiry_num_pk" class="ojh_css-8vgw34 e1pwb5hv1" value="${requestScope.iqvo.inquiry_num_pk}" readonly />
                                <div style="padding: 12px 0px 0px 26px;" name="user_id_fk" id="user_id_fk">${requestScope.iqvo.user_id_fk}</div>
                            </div>									 

                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">작성일</div>
                                <div class="ojh_css-8vgw34 e1pwb5hv1">${requestScope.iqvo.inquiry_date}</div>
                            </div>
                            
                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">제목</div>
                                <input type="text" name="inquiry_title" id="inquiry_title" size="60" value="${requestScope.iqvo.inquiry_title}" />
                            </div>
                            
                            
                        </div>
                        <div class="ojh_css-1xvp3jp ezf0ge90">
                             <textarea style="width: 100%; height: 612px; border: 1px solid rgb(244, 244, 244);" name="inquiry_content" id="inquiry_content">${requestScope.iqvo.inquiry_content}</textarea>
                        </div>
                        
                        <div class="ojh_css-d7qwpj e1p3kiis0">

                            <button class="ojh_css-214ym5 e4nu7ef3" type="button" width="150" height="42" radius="0" onclick="javascript:history.back()">
                                <span class="ojh_css-ymwvow e4nu7ef1" >취소</span>
                            </button>

                            <button class="ojh_css-214ym5 e4nu7ef3" type="button" id="btnUpdate" width="150" height="42" radius="0">
                                <span class="ojh_css-ymwvow e4nu7ef1">완료</span>
                            </button>

                          
                        </div>
                        
                    </table>
                  </fieldset> 

                </div>
            </form>
        </section>
    </div>