<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
   String ctxPath = request.getContextPath();
%>    

<script type="text/javascript">

$(document).ready(function(){
/* 	
	$("tr.review_row").click(function(e){
		alert($(this).find(".review_code").text());
		
	}); */
});

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
			        				<p>공방명 | ${craftvo.craft_name}</p>
			        				<p>대표자 | ${craftvo.craft_representative}</p>
			        				<p>위치 | ${craftvo.craft_address}</p>
			        				<p>연락처 | ${craftvo.craft_mobile}</p>
		        				</div>
        					</div>
        				</div>
        			</div>
        			<div class="master_detail_2">
        				<div class="sub1_1_1">
		        			<span>전문품목 | ${craftvo.craft_specialty}</span>
		        		</div>
        				<p>경력기간 | ${craftvo.craft_career}</p>
        				<p>공방평점 | ${craftvo.craft_rating}</p>
        			</div>
       		</div>
		</div>
		<!-- div.master_intro 끝 -->
		
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
						<div class="child_content">
							<p>다양한 갗공방 입점 업체들의</p>
							<p>포트폴리오를 제공하여</p> 
							<p>고객님들의 편리한 비교와 선택을 돕습니다.</p>
						</div>
				    </div>
				    <span class="blank" style="width:1.5rem; background-color:#fff;"></span>
				    <div class="child">
						<p class="child_title">"합리적이게"</p>
						<div class="child_content">
							<p>갗공방은 복잡한 중간 과정을 없애고</p>
							<p>전국 최고의 수선 장인과 소비자를</p> 
							<p>직접 연결합니다.</p>
						</div>
				    </div>
				    <span class="blank" style="width:1.5rem; background-color:#fff;"></span>
				    <div class="child">
						<p class="child_title">"안전하게"</p>
						<div class="child_content">
							<p>의뢰하신 명품은 희망하시는 수거일에</p> 
							<p>택배 기사님께서 직접</p> 
							<p>안전하게 수거를 진행합니다.</p> 
							<p>또한 작업에 문제가 있는 경우</p> 
							<p>갗공방 기준에 따라 검수 후</p> 
							<p>1회 무상으로</p> 
							<p>재작업 서비스를 제공해드립니다.</p>
				    	</div>
				    </div>
				</div>
			</div>
		</div>
		<!-- div.detail_2 끝 -->
		
		
		<div class="detail_3">
			<img alt="" src="http://woorimp.com/img_file/ckeditor_img/3662331629.jpg" style="width:100%;">
		</div>
		<!-- div.detail_3 끝 -->
		
		
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
					<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate" style="font-size:14pt; margin-top:20px;">
						갗공방은 전국 최고의 수선 장인과 소비자를 <br>
						직접 연결하는 명품 A/S 플랫폼입니다.<br>
						어렵기만 했던 명품 A/S를<br>
						<p data-aos="fade-up" data-aos-delay="300"  style="color:navy; font-size:20pt;">내 손 안에서</p> 
						<p data-aos="fade-up" data-aos-delay="300" class="aos-init aos-animate">쉽고 편안하게 받아보세요.</p>
					</p>
				</div>
			</div>
		</div>
		<!-- div.detail_4 끝 -->
		
		
		<div class="detail_5">
			<img alt="" src="http://woorimp.com/img_file/ckeditor_img/3662331645.jpg" style="width:100%;">
		</div>
		<!-- div.detail_5 끝 -->
		
		
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
		<!-- div.detail_6 끝 -->
		
		
		<hr style="border: solid 1px #e8e8e8;">
		<div style="height:50px;">
		</div>	
		<div class="table table--col customer-notice-list__table aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
			<h2 style="font-size: 30px; font-weight: bold; margin-left: 100px; margin-bottom: 10px;">후기가 증명합니다.</h2>
		</div>
		<c:if test="${empty requestScope.reviews}">
			<div>
				<p style="font-size:14pt;">아직 작성된 후기가 없습니다.</p>
			</div>
		</c:if>
		<c:if test="${not empty requestScope.reviews}">
		<table id="reviewTbl" class="table table--col customer-notice-list__table aos-init aos-animate" data-aos="fade-up" data-aos-delay="300" style="margin-bottom:50px;">
            <thead>
            <tr>
                <th scope="col" class="tblNumber" style="width: 5%; text-align:center;">번호</th>   <!-- 후기번호 : review_id_pk -->
                <th scope="col" class="tblWriter" style="width: 8%; text-align:center;">작성자</th>  <!-- 아이디  : user_id_fk -->
                <th scope="col" class="tblRating" style="width: 8%; text-align: center;">평점</th>   <!-- 평점 : review_rating -->
                <th scope="col" class="tblCategory" style="width: 9%; text-align:center;">품목</th>
                <th scope="col" class="tblBrand" style="text-align: center;">브랜드</th>  
                <th scope="col" class="tbl">후기내용</th>   <!-- 후기내용 : review_content -->
                <th scope="col" class="fixBefore" style="width:10%;">수선전</th>
                <th scope="col" class="fixAfter" style="width:10%;">수선후</th>  
                <th scope="col" style="text-align: center;">작성일</th>  <!-- 작성일 : review_date -->
                
            </tr>
            </thead>
				<tbody>
				
					<c:forEach var="review_one" items="${requestScope.reviews}" varStatus="status">
						<tr class="review_row" >
						    <td id="${review_one.review_id_pk}" class="review_code" style="text-align: center;">${review_one.review_id_pk}</td>
						    <td style="text-align: center;">${review_one.user_id_fk}</td>
						    <td style="text-align: center;">${review_one.review_rating}</td>
						    <td style="text-align: center;">${review_one.order_product_type}</td>  <!-- 품목 -->
						    <td style="text-align: center;">${review_one.brand_name}</td> <!-- 브랜드 -->
						    <td class="customer-notice-list__table-title">
						    	${review_one.review_content}
						    </td>
						    <td>  <!-- 수선전 사진 -->
						    	<img src="<%=ctxPath%>/resources/img/orders/${review_one.whole_img_new_name}">
						    </td>
						    <td> <!-- 수선후 사진 -->
						    	<img src="<%=ctxPath%>/resources/img/review/${review_one.fixed_photo_num_pk}.png" style="width:100px; height:100px;">
						    </td> 
						    <td style="text-align: center;">${review_one.review_date}</td> 
						</tr> 
					</c:forEach>
				</tbody>
			</table>
			</c:if>
			<!-- table#reviewTbl 끝 -->
			
	</div>
	<!-- div.master_contents 끝 -->
	
</div>
<!-- div.master_container 끝 -->

<script>
    AOS.init();
</script>

