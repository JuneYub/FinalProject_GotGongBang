<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

<<style type="text/css">

</style>

<script type="text/javascript">
 
 function goView(notice_num_pk) {
		
		const gobackURL = "${requestScope.gobackURL}";
		//alert(gobackURL);
		
	    const searchType = $("select#searchType").val();
	    const searchWord = $("input#searchWord").val();
	      
	    location.href="<%= ctxPath%>/board_notiview.got?notice_num_pk="+notice_num_pk+"&gobackURL="+gobackURL;
 }
 
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
                <span data-breadcrumb-current="공지사항">공지사항</span>
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
                        <legend>공지사항</legend>
                        <p>갗공방의 새로운 소식과 유용한 정보를 이곳에서 한번에 확인하세요.</p>
                        
                    <table class="ojh_table table--row">
                      
					  <div class="ojh_table2">
                            <div  class="ojh_table2_info t11">번호</div>
                            <div class="ojh_table2_info t12">제목</div>
                            <div  class="ojh_table2_info t13">작성자</div>
                            <div  class="ojh_table2_info t13">작성일</div>
                            <div  class="ojh_table2_info t13_1">조회수</div>
                      </div> 
                      
                      <c:if test="${empty requestScope.novo}">
                      		<td style="padding: 32px 0px 0px 252px";>게시글 데이터가 없습니다</td>
                      </c:if>    	
                      
						<c:if test="${not empty requestScope.novo}">  
	                      <ul class="ojh_table2_notice">
	                        <li>
	                          <c:forEach var="novo" items="${requestScope.novo}">
	                                <div class="ojh_table2_notice1">
	                                    <div class="ojh_table2_notice2 t14">${novo.notice_num_pk}</div>
	                                    
	                                    
		                                 <span class="subject t15" name="notice_title" style="cursor:pointer;" onclick="goView('${novo.notice_num_pk}')"> ${novo.notice_title} </span>
		                                 
		                               
	                                    <div class="ojh_table2_notice4 t16">${novo.admin_id_fk}</div>
	                                    <div class="ojh_table2_notice5 t17">${novo.notice_date}</div>
	                                    <div class="ojh_table2_notice5 t18">${novo.notice_viewcount}</div>           
	                                </div>  
	                            </a>
							  </c:forEach>
	                        </li>
	                    </ul>
					   </c:if>
							
						<c:if test="${sessionScope.loginuser.user_id_pk == 'admin'}"> 
							<button class="ojh_css-214ym4 e4nu7ef3" type="button" width="150" height="42" radius="0" onclick="javascript:location.href='<%= request.getContextPath()%>/board_noticeiq.got'">
	                                <span class="ojh_css-ymwvow e4nu7ef1">글쓰기</span>
	                        </button>
                        </c:if>
                    </table>

                  </fieldset>
                  
                   <div align="center" style="border: solid 0px gray; width: 70%; margin: 20px auto; ">
					    	${requestScope.pageBar}
				   </div> 

               </div>
            </form>
        </section>
    </div>