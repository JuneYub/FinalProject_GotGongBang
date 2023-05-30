<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String ctxPath = request.getContextPath();
%>   
    
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Font Awesome 6 Icons --> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!--     직접 만든 CSS   -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

<!-- AOS 라이브러리 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>

<script type="text/javascript">


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
					<button class="searchBtn" type="submit"></button>
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
				<div class="catalog-wrapper">
					<h2 class="catalog-title">신규 입점 공방</h2>
						<ul class="grid" style="margin: 0 auto;">
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="<% %>>/products/insight-hirenze" >
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">매력적인 사람이 되는 12가지 대화 스킬</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-leejongbeom">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="BEST" data-badge-color="RED" data-badge-display="만화/웹툰">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">몰입도를 높이는 매력적인 캐릭터의 비밀</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-junwoosung">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="콘텐츠/마케팅">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">다시 세우는 기준, 고객을 움직이는 브랜딩 전략</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
						</ul>
					<span class="catalog-more">
				<a class="catalog-more__link" href="#">자세히 보기
				<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
				<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
				</svg>
				</a>
				</span>
				</div>
			</div>
		</section>
	<nav class="topMenu" style="width:100%;">
	    <ul>
	    	<li><a class="menuLink" href="#">전체</a></li>
	        <li><a class="menuLink" href="#">가방/핸드백</a></li>
	        <li><a class="menuLink" href="#">신발</a></li>
	        <li><a class="menuLink" href="#">지갑/벨트</a></li>
	        <li><a class="menuLink" href="#">의류수선</a></li>
	    </ul>
    </nav>
    <!--
    <div class="cardList">
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg" src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
		</div> 
		<hr style="width:90%; color:#efefef;">
		
		<div class="cardList" style="clear: left;">
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg" src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
		</div> -->
		<!-- end of <div class="cardList"> -->
		<!-- 
		<hr style="width:90%; color:#efefef;">
		<div class="cardList" style="clear: left;">
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg" src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
			<div style="display:flex;">
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
				<div data-aos="fade-up" data-aos-delay="0" class="item_cardBox">
					<img class="cardImg"  src="https://fapis-backend-cms.s3.ap-northeast-2.amazonaws.com/media/images/tueldaum4.original.jpg">
					<div class="item_card">
						<p>공방명</p>
						<p>공방설명 간단하게 넣기</p>
						<p><i class="fa-solid fa-location-dot" style="color: #400099;"></i>공방위치: 서울 서초구</p>
					</div>
				</div>
			</div>
		</div> -->
		<!-- end of <div class="cardList"> -->
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper">
					<h2 class="catalog-title">가방/핸드백 </h2>
						<ul class="grid">
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-hirenze">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
												<li class="caption">${craftvo.craft_name}</li>
											</ul>
											<strong class="card__title">${craftvo.craft_introduce}</strong>
											<i class="card__note">${craftvo.craft_representative}</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-leejongbeom">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="BEST" data-badge-color="RED" data-badge-display="만화/웹툰">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">몰입도를 높이는 매력적인 캐릭터의 비밀</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-junwoosung">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="콘텐츠/마케팅">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">다시 세우는 기준, 고객을 움직이는 브랜딩 전략</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
						</ul>
					<span class="catalog-more">
				<a class="catalog-more__link" href="#">자세히 보기
				<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
				<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
				</svg>
				</a>
				</span>
				</div>
			</div>
		</section>
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper">
					<h2 class="catalog-title">신발 </h2>
						<ul class="grid">
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-hirenze">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">매력적인 사람이 되는 12가지 대화 스킬</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-leejongbeom">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="BEST" data-badge-color="RED" data-badge-display="만화/웹툰">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">몰입도를 높이는 매력적인 캐릭터의 비밀</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-junwoosung">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="콘텐츠/마케팅">
												<li class="caption">수강가능</li>
											</ul>
											<strong class="card__title">다시 세우는 기준, 고객을 움직이는 브랜딩 전략</strong>
											<i class="card__note">공방명</i>
										</figcaption>
									</a>
								</figure>
							</li>
						</ul>
					<span class="catalog-more">
				<a class="catalog-more__link" href="#">자세히 보기
				<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
				<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
				</svg>
				</a>
				</span>
				</div>
			</div>
		</section>
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper">
					<h2 class="catalog-title">지갑/벨트 </h2>
						<ul class="grid">
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-hirenze">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">매력적인 사람이 되는 12가지 대화 스킬</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-leejongbeom">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="BEST" data-badge-color="RED" data-badge-display="만화/웹툰">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">몰입도를 높이는 매력적인 캐릭터의 비밀</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-junwoosung">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="콘텐츠/마케팅">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">다시 세우는 기준, 고객을 움직이는 브랜딩 전략</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
						</ul>
					<span class="catalog-more">
				<a class="catalog-more__link" href="#">자세히 보기
				<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
				<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
				</svg>
				</a>
				</span>
				</div>
			</div>
		</section>
		
		<hr style="border: solid 1px #e8e8e8; with:90%;">
		
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper">
					<h2 class="catalog-title">의류수선</h2>
						<ul class="grid">
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-hirenze">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="비즈니스">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">매력적인 사람이 되는 12가지 대화 스킬</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-leejongbeom">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/050129-765/insight-leejongbeom-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="BEST" data-badge-color="RED" data-badge-display="만화/웹툰">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">몰입도를 높이는 매력적인 캐릭터의 비밀</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
							<li class="grid-column__item">
								<figure class="card responsive-card">
									<a class="card__link" href="/products/insight-junwoosung">
										<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" srcset="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75 2x" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074359-765/insight-junwoosung-coursecard.png?w=750&amp;q=75" style="color: transparent;">
										<figcaption class="card__caption">
											<ul class="card__labels" data-badge-label="" data-badge-color="RED" data-badge-display="콘텐츠/마케팅">
												<li class="caption">공방명</li>
											</ul>
											<strong class="card__title">다시 세우는 기준, 고객을 움직이는 브랜딩 전략</strong>
											<i class="card__note">대표자명</i>
										</figcaption>
									</a>
								</figure>
							</li>
						</ul>
					<span class="catalog-more">
				<a class="catalog-more__link" href="#">자세히 보기
				<svg width="15" height="12" viewBox="0 0 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" class="catalog-more__icon">
				<path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path>
				</svg>
				</a>
				</span>
				</div>
			</div>
		</section>
		
		
</div>
<%-- 본문 끝 --%>


<script type="text/javascript">
    AOS.init();
</script>

</html>