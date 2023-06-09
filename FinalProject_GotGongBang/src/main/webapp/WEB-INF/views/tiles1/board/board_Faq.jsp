<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<style type="text/css">
	
</style>

<script type="text/javascript"> 

$(document).ready(function(){
	 function collapse(element) {
         var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
         if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
             before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
             before.classList.remove("active");                  // 버튼 비활성화
         }
         element.classList.toggle("active");         // 활성화 여부 toggle

         var content = element.nextElementSibling;
         if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
             content.style.maxHeight = null;         // 접기
         } else {
             content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
         }
     }
	
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
                <span data-breadcrumb-current="FAQ">FAQ</span>
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
                  <fieldset style="border: 0;">
                        <legend>FAQ</legend>
                        <p>갖공방에게 가장 궁금한 질문들을 여기서 확인하세요.</p>
                        
                    <table class="ojh_table table--row">
                        <div class="ojh_list">
                           
                            <dl class="ojh_accordion customer-faq__list aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                                
                               <c:forEach var="inquiryvo" items="${requestScope.iqvo}">
                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" onclick="collapse(this);">
                                                <strong>Q.</strong>${inquiryvo.inquiry_title}</button>
                                    </dt>
                                    <dd class="ojh_accordion__collapse">
                                        <div class="ojh_accordion__body ck-content">
                                            <strong>A.</strong>
                                            <p><span>하이픈은 비대면 상담 서비스를 제공하고 있어 내방 상담은 별도로 지원하지 않고 있습니다.&nbsp;</span></p>
                                            <p>&nbsp;</p>
                                            <p><span>하이픈 고객센터는 채팅 및 이메일, 홈페이지 등 다양한 경로의 상담을 운영하고 있습니다. 편하신 방법으로 문의해 주시면 최대한 빠르게 안내해드립니다.&nbsp;</span></p>
                                            <p><span>필요시 컨설턴트가 방문하여 상담을 진행하고 있으니, 상품 &gt; 상품신청 &gt; 컨설팅신청 을 이용하여 주시기 바랍니다.&nbsp;</span></p>
                                            <p><span>하이픈 컨설턴트가 연락하여 방문일자 및 시간을 조율할 예정입니다.</span></p>
                                        </div>
                                    </dd>
                                </div>
							   </c:forEach>
                           	 </dl>
                        </div>
                    </table>
                  </fieldset>
                 

                </div>
            </form>
        </section>
    </div>