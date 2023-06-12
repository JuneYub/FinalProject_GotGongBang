<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ======= #27. tile1 중 header 페이지 만들기 (#26.번은 없다 샘이 장난침.) ======= --%>
<%
	String ctxPath = request.getContextPath();

%>
    <!-- headr 시작 -->

    <div id="header">
        <section class="header-section">
             <div class="h1-logo">
                <h1><img src="<%= ctxPath%>/resources/img/main_got.png" width="300" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/'"></h1>
            </div>
            <div class="header-nav">
            <c:if test="${sessionScope.loginuser != null and sessionScope.loginuser.user_id_pk == 'admin'}">
                 <ul>
                    <li>
                        <a class="header-nav-button" style="padding: 10px 12px;" onclick="location.href='<%= ctxPath%>/service_info.got'">서비스 소개</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="padding: 10px 12px;" onclick="location.href='<%= ctxPath%>/crafts_list.got'">수선사 찾기</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="padding: 10px 12px;" onclick="location.href='<%= ctxPath%>/orderForm.got'">견적 의뢰</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="padding: 10px 12px;" onclick="location.href='<%= ctxPath%>/board_inquiry.got'">고객센터</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="padding: 10px 12px;">Admin</a>
                    </li>
                </ul>
             </c:if>
            <c:if test="${sessionScope.loginuser.user_id_pk ne 'admin'}">
            	 <ul>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/service_info.got'">서비스 소개</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/crafts_list.got'">수선사 찾기</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/orderForm.got'">견적 의뢰</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/board_inquiry.got'">고객센터</a>
                    </li>
                </ul>
              </c:if> 
                
            </div>

            <div class="header-member-box">
                <ul class="header-member-contents">
	                <c:if test="${empty sessionScope.loginuser}">
	                    <li>
	                        <a onclick="location.href='<%= ctxPath%>/register_member_first.got'">
	                          	  회원가입
	                        </a>
	                        <span class="txt_bar"></span>
	                    </li>
	                    <li>
	                        <a onclick="location.href='<%= ctxPath%>/login.got'">
	                           	 로그인
	                        </a>
	                    </li>
	                </c:if>
	                
	                <c:if test="${not empty sessionScope.loginuser}">
	                	<li>
	                        <a onclick="location.href='<%= ctxPath%>/proposal_list.got'">
	                          	  ${(sessionScope.loginuser).name}님 환영합니다.
	                        </a>
	                        <span class="txt_bar"></span>
	                    </li>
	                    <li>
	                        <a onclick="location.href='<%= ctxPath%>/logout.got'">
	                           	 로그아웃
	                        </a>
	                    </li>
	                </c:if>
                </ul>
            </div>
        </section>
    </div>

     <!-- header 끝 -->
	