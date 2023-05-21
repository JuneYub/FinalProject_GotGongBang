<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script>
</script>
    

<!-- (어드민) 공방등록 약관동의 본문시작 -->
<div id="admin_container">
    <div id="admin_contents">
        <form action="" id="joinForm">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li style="font-size: 13pt;">공방 등록을 위한 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다. GOT GongBang을 이용해 주셔서 감사합니다. 본 약관은 다양한 본 서비스의 이용과 관련하여 서비스를 제공하는 GOT GongBang 주식회사와 이를 이용하는 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                     </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>공방 등록을 위한 이용약관 동의(필수)</li>
                    </ul>
                    <textarea name="" id="">본 약관은 정식 공방 등록을 위하여 사단법인 대한의류수선 리폼 협회 회원증을 필수로 요구함과, 공방 등록 신청 후 GOT GongBang 주식회사와의 전화 연락 협의를 통해 진행함의 내용을 포함하고 있습니다.</textarea>
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1">비동의</button></li>
                <li><button class="fpmgBt2">동의</button></li>
            </ul>
        </form>

    </div>

</div>
<!--본문 끝 -->
