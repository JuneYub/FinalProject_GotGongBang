<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   String ctxPath = request.getContextPath();
%>    

<script type="text/javascript">

/* 스크롤시 이미지 점점 하얗게 변하는 효과 */
$(window).scroll(function() {
	  var scrollTop = $(this).scrollTop();

	  $(".header-overlay").css({
	    opacity: function() {
	      var elementHeight = $(this).height();
	      return 1 - (elementHeight - scrollTop) / elementHeight * 0.3 - 0.6;
	    }
	  });
});

</script>


<div class="master_container">
	<div class="master_contents">
		<div class="master_intro">
			<img style="width:100%;" alt="메인사진" src="http://woorimp.com/img_file/ckeditor_img/3662331614.jpg">
			<div class="title">
       			<nav class="category">수선>가방>염색/클리닝</nav>
       			<h2 class="ad_sentence">처음 만난 모습 그대로</h2>
       			<span class="master_name">명품수선 장인 김장인</span>
       		</div>
       		<div class="box_suggest">
       			<button type="button" id="btn_suggest">의뢰하기</button>
       		</div>
       		<div class="master_detail">
       			<div class="master_detail_title">공방 상세정보</div>
        			<div class="master_detail_1">
        				<div class="master_detail_1_sub1">
        					<div class="sub1_child">
        						<div class="sub1_1_1">
			        				<p>공방명 | 갓공방</p>
			        				<p>대표자 | 김장인</p>
			        				<p>위치 | 서울특별시 종로구</p>
			        				<p>연락처 | 02-123-1234</p>
		        				</div>
		        				<div class="sub1_1_1">
		        					<span>염색</span>
		        					<span>수선</span>
		        				</div>
        					</div>
        				</div>
        			</div>
        			<div class="master_detail_2">
        				<p>경력기간 | </p>
        				<p>자격사항 | </p>
        				<p>공방평점   ★★★★★</p>
        			</div>
       		</div>
		</div>
		
		<div class="nice-header"> 
			<div class="header-overlay">
			</div>
		</div>
		<div class="detail_2" data-aos="fade-right" data-aos-duration="1000" data-aos-offset="500"  style="display: flex; margin: 2rem 2rem;">
			<div>
				<span>
					<span class="js-opacity-backdrop" style="opacity: 0.0636605;"></span>
				</span>
				<div>
					<h1 data-aos="fade-up" class="aos-init aos-animate">GOT GONGBANG</h1>
					<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate" style="font-size:2.1rem; font-weight: bold;">
						안 되는 수선은 없어요 <br>
						신이 만든 거 빼곤요 <br>
					</p>
				</div>
				<div class="js-opacity-backdrop-start">
					<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate">
						갗공방 파트너, 코비 수선<br>
						완벽한 명품 수선을 위해 노력하는<br>
						갖공방 파트너를 조명하는 시간.<br>
						파트너에게 궁금했던 모든 것을 답해드립니다.
					</p>
				</div>
			</div>
			<div style="display:flex; margin: 1rem auto;">
				<div class="parent">
				    <div class="child">
						<p class="child_title">"투명하게"</p>
						<p>다양한 갗공방 입점 업체들의 포트폴리오를 제공하여 고객님들의 편리한 비교와 선택을 돕습니다.</p>
				    </div>
				    <span class="blank" style="width:1.5rem; background-color:#fff;"></span>
				    <div class="child">
						<p class="child_title">합리적이게</p>
						<p>갗공방은 복잡한 중간 과정을 없애고 전국 최고의 수선 장인과 소비자를 직접 연결합니다.</p>
				    </div>
				    <span class="blank" style="width:1.5rem; background-color:#fff;"></span>
				    <div class="child">
						<p class="child_title">안전하게</p>
						<p>의뢰하신 명품은 희망하시는 수거일에 택배 기사님께서 직접 안전하게 수거를 진행합니다. 또한 작업에 문제가 있는 경우 갗공방 기준에 따라 검수 후 1회 무상으로 재작업 서비스를 제공해드립니다.</p>
				    </div>
				</div>
			</div>
		</div>
		<div class="detail_3">
			<img alt="" src="http://woorimp.com/img_file/ckeditor_img/3662331629.jpg" style="width:100%;">
		</div>
		<div class="detail_4">
			<div class="detail_4_sub" style="display:flex; margin: 50px 0; padding-left: 30px;">
				<div>
					<h1 data-aos="fade-up" class="aos-init aos-animate">GOT GONGBANG</h1>
					<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate" style="font-size:2.1rem; font-weight: bold;">
					안 되는 수선은 없어요 <br>
					신이 만든 거 빼곤요 <br>
					</p>
				</div>
				<div class="js-opacity-backdrop-start" style="margin-top: 15px; margin-left:200px; font-size:16pt;">
					<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate">
						갗공방은 전국 최고의 수선 장인과 소비자를 <br>
						직접 연결하는 명품 A/S 플랫폼입니다.<br>
						어렵기만 했던 명품 A/S를<br>
						<p data-aos="fade-up" data-aos-delay="300"  style="color:navy; font-size:20pt;">내 손 안에서<p> 쉽고 편안하게 받아보세요.
					</p>
				</div>
			</div>
		</div>
		<div class="detail_5">
			<img alt="" src="http://woorimp.com/img_file/ckeditor_img/3662331645.jpg" style="width:100%;">
		</div>
		<div class="detail_6" style="display:flex; margin: 50px 0; padding-left: 30px;">
			<div>
				<h1 data-aos="fade-up" class="aos-init aos-animate">GOT GONGBANG</h1>
				<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate" style="font-size:2.1rem; font-weight: bold;">
				안 되는 수선은 없어요 <br>
				신이 만든 거 빼곤요 <br>
				</p>
			</div>
			<div>
				<img alt="지도" src="">
			</div>
		</div>
		<hr style="border: solid 1px #e8e8e8;">
		<div style="height:50px;">
		</div>	
		<div>
			<h2 style="font-size: 30px; font-weight: bold; margin-left:155px; margin-bottom: 10px;">후기가 증명합니다.</h2>
		</div>
		<table style="width:80%; margin: 0 auto; padding-bottom: 100px;" class="table table--col customer-notice-list__table aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
			<%-- <colgroup style="width: 80%;">
			    <col width="160">
			    <col width="*">
			    <col width="180">
			    <col width="120">
			    <col width="160">
			</colgroup> --%>
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회</th>
            </tr>
            </thead>
				<tbody>
					<tr>
					    <td>
					    	49
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=143&amp;page=1&amp;search_category=PR">[아이티데일리] 하이픈 데이터마켓에 드림시큐리티 간편본인인증 및 전자서명 서비스 입점</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>264</td>
					</tr>
					<tr>
					    <td>
					    	48
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=142&amp;page=1&amp;search_category=PR">[매일신문] 셀바스AI 'OCR 상품', 하이픈코퍼레이션 데이터마켓 입점 </a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>262</td>
					</tr>
					<tr>
					    <td>
					    	47
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=141&amp;page=1&amp;search_category=PR">[IT비즈뉴스] 하이픈, 데이터마켓에 자체 개발 배송정보 추적 API 입점</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>185</td>
					</tr>
					<tr>
					    <td>
					    	46
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=140&amp;page=1&amp;search_category=PR">[매일경제] 하이픈코퍼레이션, 데이터마켓 API 상품 등록 기업에 리워드 지급</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>281</td>
					</tr>
					<tr>
					    <td>
					    	45
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=139&amp;page=1&amp;search_category=PR">[매일경제] “공공 API도 간편하게 활용하세요”…하이픈코퍼레이션, 교통정보 API 입점</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>188</td>
					</tr>
					<tr>
					    <td>
					    	44
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=138&amp;page=1&amp;search_category=PR">[테크M] 하이픈코퍼레이션 간편결제 '하이픈페이', '2022 앤어워드'서 위너상</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-03-31</td>
					    <td>191</td>
					</tr>
					<tr>
					    <td>
					    	43
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=121&amp;page=1&amp;search_category=PR">[스마트시티투데이] “API 데이터 간편하게 바우처로 해결하세요”</a>
					    </td>
					    <td>관리자</td>
					    <td>2023-01-20</td>
					    <td>392</td>
					</tr>
					<tr>
					    <td>
					    	42
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=115&amp;page=1&amp;search_category=PR">[이투뉴스] 하이픈코퍼레이션 데이터마켓에 페이스시스템 ‘REAL-EYE AI OCR 솔루션’ 입점</a>
					    </td>
					    <td>관리자</td>
					    <td>2022-12-30</td>
					    <td>488</td>
					</tr>
					<tr>
					    <td>
					    	41
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=114&amp;page=1&amp;search_category=PR">[글로벌에픽] 하이픈코퍼레이션, 엠앤와이즈와 제휴 통해 통합 메시징 기능 API 선보여</a>
					    </td>
					    <td>관리자</td>
					    <td>2022-12-30</td>
					    <td>381</td>
					</tr>
					<tr>
					    <td>
					    	40
					    </td>
					    <td class="customer-notice-list__table-title">
					    	<a class="customer-notice-list__table-link" href="/customer/notice-view?seq=113&amp;page=1&amp;search_category=PR">[IT비즈뉴스] 하이픈코퍼레이션, 웹사이트·앱 ‘웹어워드코리아’,‘스마트앱어워드코리아’ 대상 수상</a>
					    </td>
					    <td>관리자</td>
					    <td>2022-12-23</td>
					    <td>498</td>
					</tr>
				</tbody>
			</table>
			<!-- end of <table class="table table--col customer-notice-list__table aos-init aos-animate" data-aos="fade-up" data-aos-delay="300"> -->
			
	</div>
	<!-- end of <div class="master_contents"> -->
	
</div>
<!-- end of <div class="master_container"> -->

<script>
    AOS.init();
</script>

