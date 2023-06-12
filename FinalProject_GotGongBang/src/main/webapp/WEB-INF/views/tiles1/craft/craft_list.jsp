<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<%
   String ctxPath = request.getContextPath();
%>   
    
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- AOS 라이브러리 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>

<script type="text/javascript">



//Function Declaration
function goView(seq) {
	 
		const getNum = "${requestScope.gobackURL}";
		
		//	alert(gobackURL);
		/*
			/list.action?searchType= searchWord= currentShowPageNo=2
	        /list.action?searchType=subject searchWord=java
		*/
		
		const searchType = $("select#searchType").val();  //searchType 값이 아래 ctxPath에서 해당 값으로 들어감.
		const searchWord = $("input#searchWord").val();   //searchWord 값이 아래 ctxPath에서 해당 값으로 들어감.
		
		location.href="<%= ctxPath%>/view.action?seq="+seq+"&searchType="+searchType+"&searchWord="+searchWord+"&gobackURL="+gobackURL;
		//location.href=",,/view.action?seq=" + seq + "&searchType=" + searchType + "&searchWord=" + searchWord +"&gobackURL=list.action?searchType=subject&searchWord=java";
      //이기 때문에 &를 구분자로 인식하기 때문에 &gobackURL=list.action?searchType=subject나온다.   ==> 틀림 #123.으로 이동

}//end of function goView(seq)----------------------------------------------



//수선사 검색 메소드
function goSearch() {
	const frm = document.craftSearchFrm;
	frm.method = "get";
	frm.action = "<%= ctxPath%>/crafts_list.got";
	frm.submit();
}

</script>



<%-- 본문 시작 --%>
<div class="craftList_container">
	<div class="craftListBox">
		<div class="craftSearchBox">
			<p class="craftSearchTxt">수선사 찾기</p>
		</div>
		<div class="craftSearchBar">
			<form class="craftSearchFrmBox" data-aos="fade-up" data-aos-delay="0">
				<fieldset class="craftSearchFrm">
					<legend class="craftSearchFrm_title">상품 검색폼</legend>
					<input type="text" id="searchInput" placeholder="원하시는 수선 품목을 검색해보세요." />
					<input type="text" style="display: none;"/>
					<button class="searchBtn" type="button" onclick="goSearch()"></button>
				</fieldset>
			</form>
			<div class="keyWordBox">
				<ul class="keyWord">
					<li><a href="<%= ctxPath%>/crafts_list_10bag.got">#가방/핸드백</a></li>
					<li><a href="<%= ctxPath%>/crafts_list_20shoes.got">#신발</a></li>
					<li><a href="<%= ctxPath%>/crafts_list_30wallet.got">#지갑/벨트</a></li>
					<li><a href="<%= ctxPath%>/crafts_list_40cloth.got">#의류수선</a></li>
				</ul>
			</div>
		</div>
	</div>
	<%-- 
	<div class="craftListIntro">
		<span><p>명품수선은 갗공방에 맡겨보세요!</p></span>
		<div class="swipe_wrapper">
			<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" space-between="30"
		    slides-per-view="3">
		    <swiper-slide>Slide 1</swiper-slide>
		    <swiper-slide>Slide 2</swiper-slide>
		    <swiper-slide>Slide 3</swiper-slide>
		    <swiper-slide>Slide 4</swiper-slide>
		    <swiper-slide>Slide 5</swiper-slide>
		    <swiper-slide>Slide 6</swiper-slide>
		    <swiper-slide>Slide 7</swiper-slide>
		    <swiper-slide>Slide 8</swiper-slide>
		    <swiper-slide>Slide 9</swiper-slide>
		  </swiper-container>
		</div>
	</div>
	--%>
	<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="border: solid 0px blue; width:90%; height: 700px; padding: 0 auto;">
					<h2 class="catalog-title">최근 입점 공방</h2>
					
					<c:forEach var="craftvo" items="${requestScope.craftsNewList}" varStatus="status">
							<c:choose>	
								<c:when test="">
									<ul class="grid" style="border: solid 0px red; width:28%; float:left;">
										<li class="grid-column__item">
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
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
				</div>
				
				<span class="catalog-more">
					<a class="catalog-more__link" href="#">자세히 보기
						<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
						<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
						</svg>
					</a>
				</span>
			</div>
		</section>
	<nav class="topMenu" style="width:100%;">
	    <ul>
	    	<li><a class="menuLink" href="#">전체</a></li>
	        <li><a class="menuLink" href="#bag">가방/핸드백</a></li>
	        <li><a class="menuLink" href="#shoes">신발</a></li>
	        <li><a class="menuLink" href="#wallet">지갑/벨트</a></li>
	        <li><a class="menuLink" href="#cloth">의류수선</a></li>
	    </ul>
    </nav>

<c:if test="${empty requestScope.craftsList}">
	해당되는 공방이 존재하지 않습니다.
</c:if>

	
<c:if test="${not empty requestScope.craftsList}">
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="border: solid 0px blue; width:90%; height: 700px; padding: 0 auto;">
					<h2 class="catalog-title" id="bag">가방/핸드백 </h2>
						<c:forEach var="craftvo" items="${requestScope.craftsList}" varStatus="status">
							<c:choose>	
								<c:when test="${craftvo.craft_specialty eq '가방/핸드백'}">
									<ul class="grid" style="border: solid 0px red; width:28%; float:left;">
										<li class="grid-column__item">
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
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
					
				</div>
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_10bag.got">자세히 보기
							<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
							<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
							</svg>
						</a>
					</span>
			</div>
		</section>
	
		
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="border: solid 0px blue; width:90%; height: 700px; padding: 0 auto;">
					<h2 class="catalog-title" id="shoes">신발 </h2>
						<c:forEach var="craftvo" items="${requestScope.craftsList}">
							<c:choose>	
								<c:when test="${craftvo.craft_specialty eq '신발'}">
									<ul class="grid" style="border: solid 0px red; width:28%; float:left;">
										<li class="grid-column__item">
											<figure class="card responsive-card">
												<a class="card__link" href="/products/insight-hirenze">
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
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_20shoes.got">자세히 보기
							<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
							<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
							</svg>
						</a>
					</span>
			</div>
		</section>
	
		
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="border: solid 0px blue; width:90%; height: 700px; padding: 0 auto;">
					<h2 class="catalog-title" id="wallet">지갑/벨트 </h2>
						<c:forEach var="craftvo" items="${requestScope.craftsList}">
							<c:choose>	
								<c:when test="${craftvo.craft_specialty eq '지갑/벨트'}">
									<ul class="grid" style="border: solid 0px red; width:28%; float:left;">
										<li class="grid-column__item">
											<figure class="card responsive-card">
												<a class="card__link" href="/products/insight-hirenze">
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
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_30wallet.got">자세히 보기
							<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
							<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
							</svg>
						</a>
					</span>
			</div>
		</section>
	
		
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" style="border: solid 0px blue; width:90%; height: 700px; padding: 0 auto;">
					<h2 class="catalog-title" id="cloth">의류수선</h2>
						<c:forEach var="craftvo" items="${requestScope.craftsList}">
							<c:choose>	
								<c:when test="${craftvo.craft_specialty eq '의류'}">
									<ul class="grid" style="border: solid 0px red; width:28%; float:left;">
										<li class="grid-column__item">
											<figure class="card responsive-card">
												<a class="card__link" href="/products/insight-hirenze">
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
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_40cloth.got">자세히 보기
							<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
							<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
							</svg>
						</a>
					</span>
			</div>
		</section>
	
		
		
</c:if>	

	
	
</div>
<%-- 본문 끝 --%>


<script type="text/javascript">
    AOS.init();
</script>

</html>