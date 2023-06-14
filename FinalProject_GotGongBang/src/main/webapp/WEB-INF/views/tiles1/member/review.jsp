<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String ctxPath = request.getContextPath();
%>

<script>
	$(document).ready(function() {
		
		<%-- 이미지 미리보기 기능 
		// (중요!!) 스크립트 내에 태그를 선택하고 싶을 때
		// $(document).on("이벤트 종류", 선택자, 함수) 를 활용한다.
		--%>
		$(document).on("change", "input.img_file", function(e) {
			const input_file = $(e.target).get(0);
			const fileReader = new FileReader()
			fileReader.readAsDataURL(input_file.files[0]);
			fileReader.onload = function() {
				var fileData = fileReader.result;
				e.target.style.backgroundImage = 'url("' + fileData + '")';
				e.target.style.opacity = '1';
			}
		});
	});
	
	function writeReview() {
		var rating = 0;
		var checkboxes = $("input[name='rating']");
		for(var i = 0; i < checkboxes.length; i++) {
			if(checkboxes[i].checked) {
				rating = i+1;
			}
		}
		
		if(rating == 0) {
			alert("별점을 남겨주세요");
			var offset = $("#ratingDiv").offset();
			var offsetVal = offset.top-300; 
			$("html").animate({scrollTop:offsetVal}, 400);
			return;
		}
		
		var photoboxes = $("input[type='file']");
		photoboxes = photoboxes.toArray();
		for(var i = 0; i < photoboxes.length; i++) {
			if(photoboxes[i].value == "") {
				alert("후기 사진은 꼭 세장을 넣어주셔야 합니다.");
				var offset = $("div.wrap-photo-review").offset();
				var offsetVal = offset.top-300; 
				$("html").animate({scrollTop:offsetVal}, 400);
				return;
			}
		}
		
		
		var reviewCont = '';
		reviewCont = $("textarea#reviewText").val();
		
		if(reviewCont.trim().length < 50) {
			alert("후기는 50 글자 이상으로 작성하셔야 합니다");
			var offset = $("#reviewText").offset();
			var offsetVal = offset.top-300; 
			$("html").animate({scrollTop:offsetVal}, 400);
			return;
		}
		
		var imgArr = ["","",""];
		for(var i = 0; i < imgArr.length; i++) {
			imgArr[i] = photoboxes[i].value;
		} 
		
		var imgJoin = imgArr.join(',');
		
		$("input[name='reviewRating']").val(rating)
		$("input[name='fixPhotoName']").val(imgJoin);
		$("input[name='orderDetailNum']").val(${requestScope.orderDetailNum});
		$("input[name='orderNum']").val(${requestScope.orderNum});
		$("input[name='craftNum']").val(${requestScope.craftNum});
		
		const frm = $("form[name='reviewFrm']");
		var formData = new FormData(frm[0]);
		
		$.ajax({
			url:"<%= ctxPath%>/review_end.got",
		    processData: false,
		    contentType: false,
			type:"POST",
 			async:true,
 			data: formData,
 			dataType:"JSON",
			success:function(json) {
				if(json.n == 1) {
					alert("정상적으로 후기를 작성했습니다");
					window.location.href = '<%=ctxPath%>/order_list.got';
					
				}
				else {
					alert("후기를 작성할 수 없습니다");
					return;
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		})
	};
	
	function resetPhoto() {
		var fileInputs = $("input[type='file']");
		for(var i = 0; i < fileInputs.length; i++) {
			fileInputs[i].value='';
			fileInputs[i].style.backgroundImage = 'url("<%= ctxPath%>/resources/img/photo_frame.png")';
			fileInputs[i].style.opacity = '0.3';
		}
	}
	
</script>


<div class="reviewContent">
	<div class="review-head-imgList">
	<div class="review-img-list" id="wholeImg"></div>
	<div class="review-img-list" id="detailImg"></div>
	</div>
	<p class="review-title">배송된 물건의 수선 결과가 마음에 드시나요?</p>
	<form name="reviewFrm" enctype="multipart/form-data">
		
		<input type="hidden" name="orderDetailNum" value="" />
		<input type="hidden" name="reviewRating" value="" />
		<input type="hidden" name="fixPhotoName" value="" />
		<input type="hidden" name="orderNum" value="" />
		<input type="hidden" name="craftNum" value="" />
		
		<div class="wrap-rating" id="ratingDiv">
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
				
				<input type="file" class="box-photo img_file" name="imgAfterFixed" accept="image/*"/>
				<input type="file" class="box-photo img_file" name="imgAfterFixed" accept="image/*"/>
				<input type="file" class="box-photo img_file" name="imgAfterFixed" accept="image/*"/>
			</div>		
			<div class="wrap-reset-photo">
				<button type="button" class="btn-reset-photo" onclick="resetPhoto()">다시 첨부하기</button>
			</div>
			
		</div>
		
		<div class="wrap-review-write">
			<p class="review-title">상세한 후기를 작성해주세요</p>
			<div class="review-info">
				<p>✔ &nbsp;&nbsp; 50자 이상, 500자 이하 </p>
			</div>
			<div class="wrap-cont-center">
			<textarea id="reviewText" name="reviewContent" class="review-cont-text"></textarea>
			</div>
		</div>
	</form>

	<div class="wrap-review-btn">
		<button type="button" class="btn-write-cancle">취소하기</button>
		<button type="button" class="btn-write-end" onclick="writeReview();">작성하기</button>
	</div>
	
	
</div>