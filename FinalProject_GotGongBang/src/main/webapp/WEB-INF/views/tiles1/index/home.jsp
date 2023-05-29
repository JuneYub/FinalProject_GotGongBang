<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>   
    <script>
    
    
    $(document).ready(function() {
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
	        if( $(window).scrollTop() >= 100 ) {
				$("div.container-botton-copy").addClass('fade-in');
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

			  // If we need pagination
			  pagination: {
			    el: '.swiper-pagination',
			    clickable:true,
			  },

			});
		
    	
    });
    
    </script>

    <!-- 본문시작 -->
	<div id="container">
		<div class="circle-purple"></div>
		<div class="circle-white"></div>
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
				</div>
			</div>
		</section>

		<div id="contents">

			<%-- 공방 슬라이드 시작 --%>
			<div>
				<div class="contents-prolist-promotional">
				<p id="contents-prolist-promotional-msg">지금 바로 전문가를 찾아보세요</p>
				<p id="contents-prolistAll-link">전체보기</p>
				</div>

				
				<div class="swiper">
					<div class="swiper-wrapper">
					
						<div class="swiper-slide">
							<%-- 카드 시작 --%>
							<div class="swiper-slide-card">
								<div class="swiper-card-img">
									<span class="swiper-img-span"> <img
										src="<%=ctxPath%>/resources/img/main_test.jpg">
									</span>
								</div>
								<div class="swiper-card-info">
									<p class="card-craft-name">공방명</p>
									<p class="card-craft-intro">공방 한줄 소개입니다</p>

									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>

									<div class="card-craft-place">
										<span class="material-symbols-outlined">location_on</span>서울시
										마포구
									</div>
								</div>
							</div>
							<%-- 카드 끝 --%>
						</div>
						
						<div class="swiper-slide">
							<%-- 카드 시작 --%>
							<div class="swiper-slide-card">
								<div class="swiper-card-img">
									<span class="swiper-img-span"> <img
										src="<%=ctxPath%>/resources/img/main_test.jpg">
									</span>
								</div>
								<div class="swiper-card-info">
									<p class="card-craft-name">공방명</p>
									<p class="card-craft-intro">공방 한줄 소개입니다</p>

									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>

									<div class="card-craft-place">
										<span class="material-symbols-outlined">location_on</span>서울시
										마포구
									</div>
								</div>
							</div>
							<%-- 카드 끝 --%>
						</div>
						
						<div class="swiper-slide">
							<%-- 카드 시작 --%>
							<div class="swiper-slide-card">
								<div class="swiper-card-img">
									<span class="swiper-img-span"> <img
										src="<%=ctxPath%>/resources/img/main_test.jpg">
									</span>
								</div>
								<div class="swiper-card-info">
									<p class="card-craft-name">공방명</p>
									<p class="card-craft-intro">공방 한줄 소개입니다</p>

									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>

									<div class="card-craft-place">
										<span class="material-symbols-outlined">location_on</span>서울시
										마포구
									</div>
								</div>
							</div>
							<%-- 카드 끝 --%>
						</div><div class="swiper-slide">
							<%-- 카드 시작 --%>
							<div class="swiper-slide-card">
								<div class="swiper-card-img">
									<span class="swiper-img-span"> 
									<img src="<%=ctxPath%>/resources/img/main_test.jpg">
									</span>
								</div>
								<div class="swiper-card-info">
									<p class="card-craft-name">공방명</p>
									<p class="card-craft-intro">공방 한줄 소개입니다</p>

									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>
									<div class="craft-strength">가방</div>

									<div class="card-craft-place">
										<span class="material-symbols-outlined">location_on</span>서울시
										마포구
									</div>
								</div>
							</div>
							<%-- 카드 끝 --%>
						</div>
						
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
				<p id="review-list-link">전체보기</p>
				</div>

				
				<div class="reviewSwiper">
					<div class="swiper-wrapper">
						
						<%-- 후기 카드 시작 --%>
						<div class="swiper-slide">
							<div class="swiper-slide-card slide-review-card">
								<div class="reviewSwiper-">
									<div class="review-img">
										<div class="review-before-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>

										<div class="review-after-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>
									</div>
								</div>

								<div class="card-review">
									<p class="card-review-craft">하늘공방</p>
									<p class="card-review-content">리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용</p>
									<div class="card-review-info">
										<span>testID</span>
										<span>YY/MM/DD</span>									
									</div>
								</div>
							</div>
						</div>
						<%-- 후기 카드 끝 --%>
						
						<%-- 후기 카드 시작 --%>
						<div class="swiper-slide">
							<div class="swiper-slide-card slide-review-card">
								<div class="reviewSwiper-">
									<div class="review-img">
										<div class="review-before-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>

										<div class="review-after-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>
									</div>
								</div>

								<div class="card-review">
									<p class="card-review-craft">하늘공방</p>
									<p class="card-review-content">리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용</p>
									<div class="card-review-info">
										<span>testID</span>
										<span>YY/MM/DD</span>									
									</div>
								</div>
							</div>
						</div>
						<%-- 후기 카드 끝 --%>

						<%-- 후기 카드 시작 --%>
						<div class="swiper-slide">
							<div class="swiper-slide-card slide-review-card">
								<div class="reviewSwiper-">
									<div class="review-img">
										<div class="review-before-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>

										<div class="review-after-img">
											<span class="review-img-span"> <img
												src="<%=ctxPath%>/resources/img/main_test.jpg">
											</span>
										</div>
									</div>
								</div>

								<div class="card-review">
									<p class="card-review-craft">하늘공방</p>
									<p class="card-review-content">리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용</p>
									<div class="card-review-info">
										<span>testID</span>
										<span>YY/MM/DD</span>									
									</div>
								</div>
							</div>
						</div>
						<%-- 후기 카드 끝 --%>
						
						
					</div>
					<div class="swiper-reivew-pagination"></div>
				</div>
			</div>
			<%-- 후기 슬라이드 끝 --%>

		</div>
	


	</div>
	<!--본문 끝 -->