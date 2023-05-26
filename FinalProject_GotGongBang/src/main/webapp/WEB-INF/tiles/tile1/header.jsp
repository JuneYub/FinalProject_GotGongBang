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
                <h1><img src="resources/img/main_got.png" width="300" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/'"></h1>
            </div>
            <div class="header-nav">
                <ul>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/service_info.got'">서비스 소개</a>
                    </li>
                    <li>
                        <a class="header-nav-button">수선사 찾기</a>
                    </li>
                    <li>
                        <a class="header-nav-button">견적 의뢰</a>
                    </li>
                    <li>
                        <a class="header-nav-button" style="cursor: pointer;" onclick="location.href='<%= ctxPath%>/Boardinquiry.got'">고객센터</a>
                    </li>
                </ul>
                
                
                
                
            </div>

            <div class="header-member-box">
                <ul class="header-member-contents">
                    <li>
                        <a>
                          	  회원가입
                        </a>
                        <span class="txt_bar"></span>
                    </li>
                    <li>
                        <a>
                           	 로그인
                        </a>
                    </li>
                </ul>
            </div>
        </section>
    </div>

     <!-- header 끝 -->
	