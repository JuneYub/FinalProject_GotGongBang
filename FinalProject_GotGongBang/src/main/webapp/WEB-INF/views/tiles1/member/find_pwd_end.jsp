<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();

%>

<style>

	.login-related__content {
	    border-bottom: 3px solid #000;
	    padding: 60px 0 40px;
	    text-align: center;
	}	
	.login-related__result {
	    font-size: 26px;
	    font-weight: 700;
	    line-height: 1.54;
	}
	.login-related__description-point {
	    color: #400099;
	    font-weight: 700;
	}
	.login-related__info {
    	color: #999;
	    font-size: 18px;
	    line-height: 1.67;
	    margin-top: 10px;
	}
	.login-related__button--home {
	    margin-top: 60px;
	    width: 290px;
	}
	

</style>

<div id="content">
		
		<section class="login-search">
			<header class="login-search__header">
				<h2 class="login-search__title">비밀번호 재설정</h2>
			</header>
			
			<div class="login-related__content">
				<h3 class="login-related__result"><strong class="login-related__description-point"></strong> 계정에 등록된 메일주소로 <br> <strong class="login-related__description-point">비밀번호 재설정</strong>을 위한 이메일이 발송되었습니다.</h3>
				<p class="login-related__info">가입 시 입력하신 정보는 로그인 후 MY > 내정보에서 확인하실 수 있습니다.</p>
				<a class="button login-related__button login-related__button--home" onclick="location.href='<%= ctxPath%>/index.got'">홈으로 이동</a>
			</div>
		</section>	
</div>
	
<div class="site-top">
    <a href="#">
        <span>TOP</span>
    </a>
</div>