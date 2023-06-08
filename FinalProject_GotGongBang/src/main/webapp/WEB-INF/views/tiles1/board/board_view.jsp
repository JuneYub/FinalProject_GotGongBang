<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<<style type="text/css">

</style>

<<script type="text/javascript">
 $(document).readty(function(){
	 
 });	
	
	
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
            
            <form>
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
                                <div class="ojh_css-1xrh39a e1pwb5hv2">제목</div>
                                <div class="ojh_css-8vgw34 e1pwb5hv1">${requestScope.iqvo.inquiry_title}</div>
                            </div>

                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">작성자</div>
                                <div class="ojh_css-8vgw34 e1pwb5hv1">${requestScope.iqvo.user_id_fk}</div>
                            </div>									 

                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">작성일</div>
                                <div class="ojh_css-8vgw34 e1pwb5hv1">${requestScope.iqvo.regdate}</div>
                            </div>
                            
                            <div class="ojh_css-1dhg94g e1pwb5hv0">
                                <div class="ojh_css-1xrh39a e1pwb5hv2">첨부파일</div>
                                <div class="ojh_css-8vgw34 e1pwb5hv1">${requestScope.iqvo.inquiry_num_pk}</div>
                            </div>
                            
                        </div>
                        <div class="ojh_css-1xvp3jp ezf0ge90">
                            <p>${requestScope.iqvo.inquiry_content}</p>
                        </div>
                        
                        <div class="ojh_css-d7qwpj e1p3kiis0">

                            <button class="ojh_css-214ym5 e4nu7ef3" type="button" width="150" height="42" radius="0">
                                <span class="ojh_css-ymwvow e4nu7ef1">수정</span>
                            </button>

                            <button class="ojh_css-214ym5 e4nu7ef3" type="button" width="150" height="42" radius="0">
                                <span class="ojh_css-ymwvow e4nu7ef1">삭제</span>
                            </button>

                            <button class="ojh_css-214ym4 e4nu7ef3" type="button" width="150" height="42" radius="0" onclick="javascript:location.href='<%= request.getContextPath()%>${requestScope.gobackURL}'">
                                <span class="ojh_css-ymwvow e4nu7ef1">목록</span>
                            </button>
                        </div>
                        
                    </table>
                  </fieldset> 

                </div>
            </form>
        </section>
    </div>