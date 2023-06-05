<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#yh_loginSubmit").click(function(){
			func_Login();
		});
		
		$("input#pwd").keydown(function(e){
			if(e.keyCode == 13) { // 엔터를 했을 경우
				func_Login();
			}
		});
		
	});// end of $(document).ready(function()----------------------
	

	function func_Login() {
		
		const userid = $("input#userid").val(); 
	    const pwd = $("input#pwd").val(); 
	   
	    if(userid.trim()=="") {
	       alert("아이디를 입력하세요.");
	       $("input#userid").val(""); 
	       $("input#userid").focus();
	       return; // 종료 
	    }
	   
	    if(pwd.trim()=="") {
	       alert("비밀번호를 입력하세요.");
	       $("input#pwd").val(""); 
	       $("input#pwd").focus();
	       return; // 종료 
	    }
	    
	    const frm = document.loginFrm;
	    frm.action = "<%= ctxPath%>/end_login.got";
	    frm.method = "post";
	    frm.submit();
		
	}// end of function func_Login()---------------------------

</script>


<!-- 로그인폼 시작 -->
<body class="yh1_body">

<div class="yh_login_cont" style="width: 1200px; height: 550px; letter-spacing: -.5px;">
	<div class="yh_login_in">
	
		<h1><a href='<%= ctxPath%>/index.got'><img src="<%= ctxPath%>/resources/img/login_got.png" alt="패피스 로고" class="svg_logo"></a></h1>
		
		<h3 style="color: black; font-weight: 700; font-size: 12pt; margin: 15px 0;">명품 수선의 답을 찾다</h3>

		<form name="loginFrm">



			<input type="text" id="userid" name="userid" class="yh_input" placeholder="아이디" hname="아이디">
			<input type="password" id="pwd" name="pwd" class="yh_input" placeholder="비밀번호" hname="비밀번호">
			<button type="button" id="yh_loginSubmit" value="로그인" class="yh_bgColor search_btn" >로그인</button>

		</form>
		
		<div style="display: inline-flex; margin-top: 14px;">
			<a class="yh_p" href="<%= ctxPath%>/find_id.got">아이디 찾기</a>
			<div class="yh_border"></div>
			<a class="yh_p" href="<%= ctxPath%>/find_pwd.got">비밀번호 찾기</a>
			
			
		</div>
	</div>
	<a href='<%= ctxPath%>/service_info.got'>
		<img src="<%=ctxPath%>/resources/img/login_ad.png" alt="광고" class="svg_logo" style="width:460px; height:auto; margin-left: 30.5%; padding-top: 53px;">
	</a>
</div>
<!-- 로그인폼 끝 -->


</body>
</html>