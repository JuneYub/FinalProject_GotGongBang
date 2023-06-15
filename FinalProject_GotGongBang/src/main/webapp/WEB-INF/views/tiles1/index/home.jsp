<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
    <script>
    
    
    $(document).ready(function() {
    	
		Fancybox.bind("[data-fancybox]", {	 
		});
    	
    	$("div.circle-purple").css('opacity','0');
    	$("div.circle-white").css('opacity','0');
    	$("div.container-botton-copy").css('opacity','0');
    	// === 스크롤 이벤트 발생시키기 시작 ====
		$(window).scroll(function() {
			// 스크롤탑의 위치값 
		    //console.log( "$(window).scrollTop() => " + $(window).scrollTop() );
			
	        if( $(window).scrollTop() >= 90) {
	        	$("div.circle-white").addClass('fade-in-1s');
	        	$("div.circle-purple").addClass('fade-in-1s');
				
	        }
	        if( $(window).scrollTop() >= 600 ) {
				$("div.container-botton-copy").addClass('fade-in');
	        }
	        
	        if( $(window).scrollTop() >= 800 ) {
				$("div#mainIllur").addClass('fade-in');
	        }
		});
    	
		const swiper = new Swiper('.swiper', {
			  // Optional parameters
			  direction: 'horizontal',
			  loop: false,
		      slidesPerView: 3,
		      spaceBetween: 30,

			  // If we need pagination
			  pagination: {
			    el: '.swiper-pagination',
			    clickable:true,
			  },

			  // Navigation arrows
			  navigation: {
			    nextEl: '.swiper-button-next',
			    prevEl: '.swiper-button-prev',
			  },

			});

		const reviewSwiper = new Swiper('.reviewSwiper', {
			  // Optional parameters
			  direction: 'horizontal',
			  loop: false,
		      slidesPerView: 2,
		      spaceBetween: 30,



			});
		
    	
    });
    
    </script>

    <!-- 본문시작 -->
	<div id="container">

		<section>
			<div class="container-top-animator-background">
				<div class="container-top-copy fade-in">
					<p>Premium Repair Services</p>
					<p>to restore original glory</p>
				</div>
			</div>

			<div class="container-bottom-animator-background">
				<div class="container-botton-copy">
					<p>내게 맞는</p>
					<p>명품 수선사를 찾다</p>
					<div id="mainIllur"> 
						<img id="mainSearchIllur" src="<%=ctxPath%>/resources/img/main_search_illur.svg">
						<img id="mainListIllur" src="<%=ctxPath%>/resources/img/main_list_illur.svg">
					</div>
				</div>
				
			</div>
		</section>

		<div id="contents">

			<%-- 공방 슬라이드 시작 --%>
			<div>
				<div class="contents-prolist-promotional">
				<p id="contents-prolist-promotional-msg">지금 바로 전문가를 찾아보세요</p>
				<p id="contents-prolistAll-link" onclick="location.href='<%= ctxPath%>/crafts_list.got'">전체보기</p>
				</div>

				
				<div class="swiper">
					<div class="swiper-wrapper">
						
						<%-- 카드 시작 --%>
						<c:forEach var="cvo" items="${requestScope.craftList}">	
						<div class="swiper-slide" onclick="location.href='<%=ctxPath%>/crafts_detail.got?craft_num_pk=${cvo.craft_num_pk}'">
							<div class="swiper-slide-card">
								<div class="swiper-card-img">
									<span class="swiper-img-span"> 
									<img src="<%=ctxPath%>/resources/img/craft/${cvo.filename}">
									</span>
								</div>
								<div class="swiper-card-info">
									<p class="card-craft-name">${cvo.craft_name}</p>
									<p class="card-craft-intro">${cvo.craft_Introduce}</p>

									
									<c:forTokens var="specialty" items="${cvo.craft_specialty}" delims=",">
									<div class="craft-strength">${specialty}</div>
									</c:forTokens>

									<div class="card-craft-place">
										<span class="material-symbols-outlined">location_on</span>서울시
										마포구
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						<%-- 카드 끝 --%>
						
						
						
						
					</div>
					<div class="swiper-pagination"></div>

				</div>
			</div>
			<%-- 공방 슬라이드 끝 --%>
			
			<div class="banner-service-info">
				<div class="banner-cont">
					<div class="banner-title">
					갗공방에 대해서 알려드릴게요!!
					</div>
					<div class="banner-cont-txt" onclick="location.href = '<%= ctxPath%>/service_info.got'" style="cursor: pointer">
					서비스에 대해서 알고싶으시다면 >>
					</div>
				</div>
			</div>
			
				

			<%-- 후기 슬라이드 시작 --%>
			<div id="review-slide">
				<div class="contents-review-promotional">
				<p id="review-list-title">공방 업체 후기</p>
				</div>

				
				<div class="reviewSwiper">
					<div class="swiper-wrapper">
						
						<%-- 후기 카드 시작 --%>
						<c:forEach var="review" items="${requestScope.reviewList}" varStatus="status">
						<div class="swiper-slide">
							<div class="swiper-slide-card slide-review-card">
								<div class="reviewSwiper-">
									<div class="review-img">
										<div class="review-before-img">
											<span class="review-img-span">
												<c:forEach var="wholeImg" items="${review.wholeImgList}" varStatus="wholeIdx">
													<c:if test="${wholeIdx.index eq 0}">
													<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" data-fancybox="gallery${status.index}" >
														<img src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" />
													</a>
													</c:if>
					
													<c:if test="${wholeIdx.index ne 0}">
													<a href="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" data-fancybox="gallery${status.index}" >
														<img style="display: none" src="<%= ctxPath%>/resources/img/orders/${wholeImg.whole_img_new_name}" />
													</a>
													</c:if>
												</c:forEach>
												
												<c:forEach var="detailImg" items="${review.detailImgList}" varStatus="detailIdx">
													<a href="<%= ctxPath%>/resources/img/orders_detail/${detailImg.detail_img_new_name}" data-fancybox="gallery${status.index}" >
														<img style="display: none" src="<%= ctxPath%>/resources/img/orders_detail/${detailImg.detail_img_new_name}" />
													</a>
												</c:forEach>
											</span>
										</div>

										<div class="review-after-img">
											<span class="review-img-span"> 
												<c:forEach var="fixedImg" items="${review.fixedImgList}" varStatus="fixedIdx">
													<c:if test="${fixedIdx.index eq 0}">
													<a href="<%= ctxPath%>/resources/img/review/${fixedImg.file_name}" data-fancybox="galleryFixedPhoto${status.index}" >
														<img src="<%= ctxPath%>/resources/img/review/${fixedImg.file_name}" />
													</a>
													</c:if>
					
													<c:if test="${fixedIdx.index ne 0}">
													<a href="<%= ctxPath%>/resources/img/review/${fixedImg.file_name}" data-fancybox="galleryFixedPhoto${status.index}" >
														<img style="display: none" src="<%= ctxPath%>/resources/img/review/${fixedImg.file_name}" />
													</a>
													</c:if>
												</c:forEach>
											</span>
										</div>
									</div>
								</div>
								
								<div class="card-review">
									<p class="card-review-craft">${review.craft_name}</p>
									<p class="card-review-content">${review.review_content}</p>
									<div class="card-review-info">
										<span>${review.user_id_fk}</span>
										<span>${review.review_date}</span>									
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						<%-- 후기 카드 끝 --%>
						
						
						
						
					</div>
					<div class="swiper-reivew-pagination"></div>
				</div>
			</div>
			<%-- 후기 슬라이드 끝 --%>

		</div>
	


	</div>
	<!--본문 끝 -->