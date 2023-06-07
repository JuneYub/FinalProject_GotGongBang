<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   

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
                        <legend>FAQ</legend>
                        <p>갖공방에게 가장 궁금한 질문들을 여기서 확인하세요.</p>
                        
                    <table class="ojh_table table--row">
                        <div class="ojh_list">
                            <p class="ojh_list_total">
                                총
                                <strong class="ojh_list_totalnum">10</strong>
                                건
                            </p>
                            <dl class="ojh_accordion customer-faq__list aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                                <div class="ojh_accordion__item accordion__item--show accordion__item--fade">
                                    <dt class="ojh_accordion__header">
                                        <button class="ojh_accordion__trigger" type="button" data-seq="79" data-accordion-index="0">
                                                <strong>Q.</strong>하이픈에 방문해서 상담 받을 수 있나요?</button>
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

                            </dl>
                        </div>
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