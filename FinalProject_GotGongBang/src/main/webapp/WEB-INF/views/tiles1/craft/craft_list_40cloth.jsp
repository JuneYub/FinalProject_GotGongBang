<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<%
   String ctxPath = request.getContextPath();
%>    
    
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<%-- 본문 시작 --%>
<div class="craftList_container">

<h2 style="margin-left: 200px;"><a href="<%= ctxPath%>/crafts_list.got">수선사 찾기</a> > <a href="#">의류수선</a> </h2>
<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="margin-left: 100px;">
					<h2 class="catalog-title">의류수선</h2>
						
						<ul class="grid">
						
							<c:forEach var="craftvo" items="${requestScope.craftsList}" varStatus="status">
							<c:if test="${fn:contains(craftvo.craft_specialty, '의류')}">
							<li class="grid-column__item card-list">
								<figure class="card responsive-card">
									<a class="card__link" href="<%= ctxPath%>/crafts_detail.got?craft_num_pk=${craftvo.craft_num_pk}">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
										<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
											<li class="caption">${craftvo.craft_name}</li>
										</ul>
										<strong class="card__title">${craftvo.craft_Introduce}</strong>
										<i class="card__note">${craftvo.craft_representative}</i>
										</figcaption>
									</a>
								</figure>
							</li>
							</c:if>
							</c:forEach>
							
						</ul>
				</div>
			</div>
		</section>		
		
</div>
<%-- 본문 끝 --%>


<script type="text/javascript">
    AOS.init();
</script>

</html>