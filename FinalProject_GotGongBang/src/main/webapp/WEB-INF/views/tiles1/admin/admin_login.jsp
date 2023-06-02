<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#yh_loginSubmit").click(function(){
			func_adminLogin();
		});
		
		$("input#loginPwd").keydown(function(e){
			if(e.keyCode == 13) {  //엔터를 했을 경우
				func_adminLogin();
			}
		});
		//버튼의 enter나 비번후enter 같은 기능인 func_adminLogin(); 를 해주겠다!
		
	});//end of $(document).ready(function(){})-------------------------------------------
	
	
	//Function Declaration
	function func_adminLogin() {
		 const userid = $("input#loginUserid").val(); 
	     const pwd = $("input#loginPwd").val(); 
	   
	     if(userid.trim()=="") {  //아이디를 입력하지 않으면
	        alert("아이디를 입력하세요!!");
	       $("input#loginUserid").val(""); 
	       $("input#loginUserid").focus();
	       return; // 종료 
	     }
	   
	     if(pwd.trim()=="") {  //비번을 입력하지 않으면
	       alert("비밀번호를 입력하세요!!");
	       $("input#loginPwd").val(""); 
	       $("input#loginPwd").focus();
	       return; // 종료 
	     }
	     
	     //올바르게 아이디와 비번을 입력했으면 보내준다.
	     const frm = document.adminLoginFrm;
	     
	     frm.action = "<%= ctxPath%>/adminLoginEnd.action";
	     frm.method = "post";
	     frm.submit();
	     
	}//end of function func_Login()------------------------------------------------------------



</script>



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
			<p>안녕하세요, 관리자 님!</p>			
		</div>
	</div>
	<img src="<%=ctxPath%>/resources/img/login_ad.png" alt="광고" class="svg_logo" style="width:460px; height:auto; margin-left: 30.5%; padding-top: 53px;">
</div>
<!-- 로그인폼 끝 -->


</body>
</html>