<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<title>GOTGONGBANG : 로그인</title>


<!-- 로그인폼 시작 -->
<body class="yh1_body">

<div class="yh_login_cont" style="width: 1200px; height: 550px; letter-spacing: -.5px;">
	<div class="yh_login_in">
	
		<!-- <a href="/SemiProject_3Zoe/"></a> -->
		<h1><img src="<%=ctxPath%>/resources/img/login_got.png" alt="패피스 로고" class="svg_logo"></h1>
		
		<h3 style="color: black; font-weight: 700; font-size: 12pt; margin: 15px 0;">명품 수선의 답을 찾다</h3>

		<form name="loginFrm">



			<input type="text" id="loginUserid" name="userid" class="yh_input" placeholder="아이디" hname="아이디">
			<input type="password" id="loginPwd" name="pwd" class="yh_input" placeholder="비밀번호" hname="비밀번호">
			<button type="button" id="yh_loginSubmit" value="로그인" class="yh_bgColor search_btn" >로그인</button>

		</form>
		
		<div style="display: inline-flex; margin-top: 14px;">
			<p class="yh_p" href="<%= ctxPath%>/member/agreementCheck.go">회원가입하기</p>
			<div class="yh_border"></div>
			<p class="yh_p" href="<%= ctxPath%>/login/idFind.go">비밀번호 찾기</p>
			
			
		</div>
	</div>
	<img src="<%=ctxPath%>/resources/img/login_ad.png" alt="광고" class="svg_logo" style="width:460px; height:auto; margin-left: 30.5%; padding-top: 53px;">
</div>
<!-- 로그인폼 끝 -->


</body>
</html>