<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가격 제안</title>
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/main.css">
	
	<!-- Font Awesome 5 Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	  
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	<script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 
	  
	<%--  ===== 스피너 및 datepicker 를 사용하기 위해  jquery-ui 사용하기 ===== --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css" />
	<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	
	<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
	<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	
	<%-- 스와이퍼 --%>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	
	<%-- 구글 머터리얼 아이콘 --%>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	
	<%-- AOS 라이브러리 --%>
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	
</head>
<body>
	<div class="popup-container">
		<div id="requestEstimate">
			<div class="tit-estimate"><h1>견적 요청서</h1></div>
			<div class="cont-estimate">
				<table class="tbl-estimate">
					<tbody>
						<tr><td>요청자 성함</td> <td>@@@</td></tr>
						<tr><td>품목</td> <td>@@@</td></tr>
						<tr><td>브랜드</td> <td>@@@</td></tr>
						<tr><td>전체 사진</td> <td>@@@</td></tr>
						<tr><td>상세 사진</td> <td>@@@</td></tr>
						<tr><td>수선 유형</td> <td>@@@</td></tr>
						<tr><td>수선 요청사항 설명</td><td>@@@</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="cont-proposal">
		<h3>예상기간 제안</h3>
		<input class="input-proposal" type="text" placeholder="일 ">
		</div>
		<div class="cont-proposal">
		<h3>가격 제안</h3>
		<input class="input-proposal" type="text" placeholder="￦ ">
		</div>
		
		
		<div class="cont-bid-final"><a>제안하기</a></div>
		
		
	</div>
</body>
</html>