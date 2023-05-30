<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

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
                <span data-breadcrumb-current="질문 게시판">질문 게시판</span>
              </h2>

            </header>
            <form>
            	<div id="ojh_category">
                    <div class="ojh_center"> 고객센터 </div>
                    <ul class="ojh_sub_category">
                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/BoardNotice.got'">공지사항</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/Boardinquiry.got'">온라인 문의</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/BoardQuestion.got'">질문 게시판</a>
                        </li>

                        <li>
                            <a class="ojh_sub_category_info" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/BoardFaq.got'">FAQ</a>
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
                      </div> 

                      <ul class="ojh_table2_notice">
                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">10</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">9</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">8</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">7</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">6</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">5</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">4</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">3</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">2</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                        <li>
                            <a href="/">
                                <div class="ojh_table2_notice1">
                                    <div class="ojh_table2_notice2 t14">1</div>
                                    <div class="ojh_table2_notice3 t15">환불해줘요</div>
                                    <div class="ojh_table2_notice4 t16">아무개</div>
                                    <div class="ojh_table2_notice5 t17">2023.05.28</div>
                                </div>  
                            </a>

                        </li>

                    </ul>

                    </table>

                  </fieldset>
                  
                  <nav class="ojh_pagination_nav">
                    <ul class="ojh_pagination">
                        <li class="ojh_pagination_item_first">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">처음</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item_before">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">이전</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item_one">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">1</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">2</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">3</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">4</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">5</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">6</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">7</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">8</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">9</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">10</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item_next">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">다음</span>
                            </a>
                        </li>
                        <li class="ojh_pagination_item_last">
                            <a class="ojh_pagination_link" href="/">
                                <span class="ojh_pagination_name">마지막</span>
                            </a>
                        </li>
                    </ul>
                  </nav>

                </div>
            </form>
        </section>
    </div>