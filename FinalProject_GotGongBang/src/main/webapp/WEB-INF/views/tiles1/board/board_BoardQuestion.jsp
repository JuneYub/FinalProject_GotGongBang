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
   
   .subjectStyle {font-weight: bold;
    			   color: navy;
    			   cursor: pointer;}
   
</style>

<script type="text/javascript"> 

$(document).ready(function(){
	
	 $("span.subject").bind("mouseover", function(e){
		  $(e.target).addClass("subjectStyle");
	  });
	  
	  $("span.subject").bind("mouseout", function(e){
		  $(e.target).removeClass("subjectStyle"); 
	  });
	
	$("input#searchWord").keyup(function(e){
		  if(e.keyCode == 13) {
			  // 엔터를 했을 경우
			  goSearch();
		  }
	  });
	
	// 검색시 검색조건 및 검색어 유지시키기
	if( ${not empty requestScope.paraMap} ) {
	      $("select#searchType").val("${requestScope.paraMap.searchType}");
		  $("input#searchWord").val("${requestScope.paraMap.searchWord}");
	  }

});	
	
	function goView(inquiry_num_pk) {
		
		const gobackURL = "${requestScope.gobackURL}";
		//alert(gobackURL);
		
	    const searchType = $("select#searchType").val();
	    const searchWord = $("input#searchWord").val();
	      
	    location.href="<%= ctxPath%>/board_view.got?inquiry_num_pk="+inquiry_num_pk+"&searchType="+searchType+"&searchWord="+searchWord+"&gobackURL="+gobackURL;
	}
	
	
	function goSearch() {
		  const frm = document.searchFrm;
		  frm.method = "get";
		  frm.action = "<%= ctxPath%>/board_Question.got";
		  frm.submit();
	}


</script>

 <div id="ojh_content">
        <section class="ojh_page_content_inquire">
            <header class="ojh_page-header ojh_page-header--customer" style="padding: 30px 0px 100px 0px;">
              <span class="page-header__backdrop">
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
              </span>
              <h2 class="page-header__title aos-init aos-animate" data-aos="fade-up">
                <span aria-hidden="true" data-breadcrumb-menu="고객센터">고객센터</span>
                <span data-breadcrumb-current="FAQ">무엇을 도와드릴까요?</span>
              </h2>
			  
			  <form class="ojh_page_header_search">
                <fieldset class="ojh_page_header_search_fieldset">
                    <legend class="ojh_page_header_search_legend"></legend>
                    <select name="searchType" id="searchType" style="width: 90px; height: 55px; border: none; font-weight: 500;">
						<option value="inquiry_title" style="border: none;">글제목</option>
						<option value="user_id_fk" style="border: none;">글쓴이</option>
					</select>
                    <input type="text" class="ojh_page_header_search_input"  placeholder="검색어를 입력하세요" name="searchWord" id="scearhWord" value="" style=" width: 500px;">
                    <input type="text" style="display: none;"/>
                    <button class="ojh_page_header_search_submit">
                        <span>검색</span>
                    </button>
                </fieldset>
              </form>	
				
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
                        <legend>질문게시판</legend>
                        <p>갗공방 고객님들의 질문들을 모두 모았습니다.</p>
                    
                    
                    <table class="ojh_table table--row">
                       	
                      <div class="ojh_table2">
                            <div  class="ojh_table2_info t11">번호</div>
                            <div class="ojh_table2_info t12">제목</div>
                            <div  class="ojh_table2_info t13">작성자</div>
                            <div  class="ojh_table2_info t13">작성일</div>
                            <div  class="ojh_table2_info t13_1">조회수</div>
                      </div> 
					  
					   <c:if test="${empty requestScope.iqvo}">
                      		<td style="padding: 32px 0px 0px 252px";>게시글 데이터가 없습니다</td>
                       </c:if>    	
                      
                    <c:if test="${not empty requestScope.iqvo}">  
                      <ul class="ojh_table2_notice">
                        <li>
                          <c:forEach var="inquiryvo" items="${requestScope.iqvo}">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">${inquiryvo.inquiry_num_pk}</div>
                                    
                                    <c:if test="${inquiryvo.depthno == 0}">
	                                    	<span class="subject t15" name="inquiry_title" style="cursor:pointer;" onclick="goView('${inquiryvo.inquiry_num_pk}')"> ${inquiryvo.inquiry_title} </span>
	                                </c:if> 
	                                
	                                <c:if test="${inquiryvo.depthno > 0}">
	                                    	<span class="subject t15" name="inquiry_title" style="cursor:pointer;" onclick="goView('${inquiryvo.inquiry_num_pk}')"><span style="color: red; font-style: italic; padding-left: ${boardvo.depthno * 20}px;">└Re&nbsp; </span> ${inquiryvo.inquiry_title} </span>
                                    </c:if> 
                                    
                                    
                                    	<div class="ojh_table2_notice4 t16">
                                    	
                                    	<c:if test="${inquiryvo.partner_chk == 0}">
                                    		<span class="ojh_table2_notice4_1">일반사용자</span>
                                    	</c:if>
                                    	
                                    	<c:if test="${inquiryvo.partner_chk == 1}">
                                    		<span class="ojh_table2_notice4_1">파트너사용자</span>
                                    	</c:if>
                                    	
                                    	${inquiryvo.user_id_fk}
                                    	
                                    	</div>
                                    
                                    <div class="ojh_table2_notice5 t17">${inquiryvo.inquiry_date}</div>
                                    <div class="ojh_table2_notice5 t18">${inquiryvo.inquiry_viewcount}</div>           
                                </div>  
                            </a>
						  </c:forEach>
                        </li>
                    </ul>
				   </c:if>
                    </table>

                  </fieldset>
                   
	                  <div align="center" style="border: solid 0px gray; width: 70%; margin: 20px auto; ">
					    	${requestScope.pageBar}
					  </div> 
                  
                  <%--  <nav class="ojh_pagination_nav">
                    <ul class="ojh_pagination">
                        <li class="ojh_pagination_item_one">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">${requestScope.pageBar}</span>
                            </a>
                        </li>
                    </ul>
                  </nav>  --%>

                </div>
            </form>
        </section>
    </div>