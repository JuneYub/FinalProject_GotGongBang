<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
	
	function rating() {
		
	};
</script>

<div class="reviewContent">
	<div class="review-head-imgList">
	<div class="review-img-list" id="wholeImg"></div>
	<div class="review-img-list" id="detailImg"></div>
	</div>
	<p class="review-title">배송된 물건의 수선 결과가 마음에 드시나요?</p>
	
	<div class="wrap-rating">
		<div class="rating">
			  <input type="radio" id="star5" class="rating-radio" name="rating" value="5">
			  <label for="star5" class="star"></label>
			  <input type="radio" id="star4" class="rating-radio" name="rating" value="4">
			  <label for="star4" class="star"></label> 			  
			  <input type="radio" id="star3" class="rating-radio" name="rating" value="3">
			  <label for="star3" class="star"></label>	 			  
			  <input type="radio" id="star2" class="rating-radio" name="rating" value="2">
			  <label for="star2" class="star"></label>			  
			  <input type="radio" id="star1" class="rating-radio" name="rating" value="1">
			  <label for="star1" class="star"></label>
		</div>
	</div>
	
	<div class="wrap-photo-review">
		<p class="review-title">후기 사진을 등록해주세요</p>
		<div class="wrap-cont-center">
			<div class="box-photo"></div>
		</div>
		
	</div>
	
	<div class="wrap-review-write">
		<p class="review-title">상세한 후기를 부탁드려요</p>
		<div class="review-info">
			<p>✔ &nbsp;&nbsp; 50자 이상</p>
		</div>
		<div class="wrap-cont-center">
		<textarea class="review-cont-text"></textarea>
		</div>
	</div>
	
	<button ></button>
	
	
</div>