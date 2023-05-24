<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
<script>
</script>


<!-- (어드민) 공방 신청 완료 본문시작 -->
<div id="admin_container">
    <div id="admin_contents">
        <div id="admin_complete">
            <div id="complete">
                공방 신청
            </div>
            <div id="complete_content">
                공방 신청이 완료 되었습니다.<br>
                자격요건 심사 후 GOT GongBang과의 전화 협의 통해 정식 공방 자격을 인정 받으실 수 있습니다. (2~3일 소요)
                <div class="submit_box">
                    <button class="submit_go" type="button" onclick="">확인</button>
                </div>
            </div>
        </div>

    </div>

</div>
<!--본문 끝 -->