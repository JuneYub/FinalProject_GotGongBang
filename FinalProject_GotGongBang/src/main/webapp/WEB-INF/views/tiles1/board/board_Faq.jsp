<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
	
</style>

<script type="text/javascript">

$(document).ready(function(){
	  $(".more1").click(function(){
	    var $item = $(this).closest(".ojh_accordion__item"); // 클릭한 아이템을 선택합니다.
	    var $content = $item.find(".dd1"); // 클릭한 아이템 내의 내용을 선택합니다.
	    
	    if ($content.hasClass("ojh_accordion__collapse")) {
	      // 내용이 닫혀있는 경우
	      $content.find(".div1").show();
	      $content.removeClass("ojh_accordion__collapse");
	      $content.addClass("ojh_accordion__collapse--expand");
	      $content.find(".div1").removeClass("div1_h");
	    } else {
	      // 내용이 열려있는 경우
	      $content.find(".div1").hide();
	      $content.addClass("ojh_accordion__collapse");
	      $content.removeClass("ojh_accordion__collapse--expand");
	      $content.find(".div1").addClass("div1_h");
	    }
	  });
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
                                
                              <table class="ojh_table table--row">
    <tbody>
        <tr>
            <td>
                <dl class="ojh_accordion customer-faq__list aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                    <c:forEach var="inquiryvo" items="${requestScope.iqvo}">
                        <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                            <dt class="ojh_accordion__header">
                                <button class="ojh_accordion__trigger more1 btn" type="button" data-seq="79" onclick="collapse(this);">
                                    <strong>Q.</strong>${inquiryvo.inquiry_title}</button>
                            </dt>
                            <dd class="ojh_accordion__collapse dd1">
                                <div class="ojh_accordion__body div1 div_h1">
                                    <strong>A.</strong>
                                    
                                        <p><span>${inquiryvo.inquiry_content}</span></p>
                                 
                                </div>
                            </dd>
                        </div>
                    </c:forEach>
                    
                </dl>
            </td>
        </tr>
    </tbody>
</table>
                           	 </dl>
                        </div>
                    </table>
                  </fieldset>
                 

                </div>
            </form>
        </section>
    </div>