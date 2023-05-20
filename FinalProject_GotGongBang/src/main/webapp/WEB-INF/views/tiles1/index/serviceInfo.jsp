<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>

<script>

</script>

<!-- 본문시작 -->
<div id="container">
	<div class="video-theme">
		<video muted autoplay loop>
			<source src="<%= ctxPath%>/resources/img/serviceInfo_bg_movie.mov">
		</video>
		
		<div class="copywright">
			<p>소중한 물건이니깐<br>
			꼼꼼하게 알아보실 수 있도록 돕습니다</p>
		</div>
		
		
	</div>	
	<div id="contents">
	
	</div>
</div>
<!--본문 끝 -->