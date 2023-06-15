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

<!-- AOS 라이브러리 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("section#searchSection_id").hide();
	
	
	//엔터로 검색하기
	$("input#searchWord").bind("keydown",function(e){
		if(e.keyCode == 13){	//keycode 아니고 keyCode. 13은 엔터. 즉 암호칸에 엔터를 쳤을 경우
			goSearch();
		}
	});
	
	  
	  <%-- 검색폼에 검색어 입력시 자동완성글 띄우기 --%>
	  $("div#displayList").hide();
	  
	  $("button#goSearch").click(function(){  
		 
		  goSearch();
	  });//end of $("input#searchWord").keyup(fuction(){})------------------------------------------------------------------------- 
	  
	  
	
});//end of $(document).ready(function(){})-------------------------------------------------------------------------------------------------------


//Function Declaration
function goView(seq) {
	 
		const getNum = "${requestScope.gobackURL}";
		
		const searchType = $("select#searchType").val();  //searchType 값이 아래 ctxPath에서 해당 값으로 들어감.
		const searchWord = $("input#searchWord").val();   //searchWord 값이 아래 ctxPath에서 해당 값으로 들어감.
		
		location.href="<%= ctxPath%>/view.action?seq="+seq+"&searchType="+searchType+"&searchWord="+searchWord+"&gobackURL="+gobackURL;
		

}//end of function goView(seq)----------------------------------------------


function goSearch(){
	 
	  const wordLength = $("input#searchWord").val().trim().length;
	  //검색어에서 공백을 제외한 길이를 알아온다.
	  
	  if(wordLength == 0) {
		 alert("검색어를 입력하세요!");
	  }
	  else {
		  $.ajax({
			 url:"<%= ctxPath%>/wordSearchShow.got",
			 type:"get",
			 data:{"searchType":$("select#searchType").val().trim(),
				   "searchWord":$("input#searchWord").val().trim()},
			 dataType:"json",
			 success:function(json){
				 //console.log("확인용 json : "+JSON.stringify(json));
				 
				 let html ="";
				 if(json.length == 0) {
					 html = "<div>" +
					 			"<i class='fa-solid fa-circle-exclamation fa-2xl' style='color: #400099; display:inline-block;'></i>"+
					 			"<div>"+
						 			"<p style='font-size:15pt;'>검색결과가 없습니다.</p>"+
						 			"<p style='font-size:15pt; font-weight:bold;'>다른 검색어를 입력해주세요</p>"+
					 			"</div>"+
					 		"</div>";
				 }
				 else {
					 $.each(json, function(index, item){
						 html += "<li class='grid-column__item card-list'>" +
								 	"<figure class='card responsive-card'>" +
											"<a class='card__link' href='<%= ctxPath%>/crafts_detail.got?craft_num_pk="+item.craft_num_pk+"'>" +
												"<img loading='lazy' width='352' height='220' decoding='async' data-nimg='1' class='card__img' srcset='https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=384&amp;q=75 1x, https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75 2x' src='https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75' style='color: transparent;'>"+
												"<figcaption class='card__caption'>"+
												"<ul class='card__labels' data-badge-label='' data-badge-color='RED' data-badge-display='비즈니스'>"+
													"<li class='caption'>"+item.craft_name+"</li>"+
												"</ul>"+
												"<strong class='card__title'>"+item.craft_Introduce+"</strong>"+
												"<i class='card__note'>"+item.craft_representative+"</i>"+
												"</figcaption>"+
												
											"</a>"+
										"</figure>"+
									"</li>";
					 });// end of each
					 
				 }//else 끝
				 
				 
				 $("div#search_wrapper").html(html);
				 $("section#searchSection_id").show();
			 },
			 error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
           }
		  });//ajax---------------


	  }//end of else---------------------------
	  
	  
	  
	  
}



</script>



<%-- 본문 시작 --%>
<div class="craftList_container">
	<div class="craftListBox">
		<div class="craftSearchBox">
			<p class="craftSearchTxt">수선사 찾기</p>
		</div>
		<div class="craftSearchBar">
			<%-- 수선사 검색폼 : 공방명, 수선사명으로 검색 --%>
			<form name="craftSearchFrm" class="craftSearchFrmBox" data-aos="fade-up" data-aos-delay="0" style="display: flex;">
				<select name="searchType" id="searchType" style="height: 40px;">
		         <option name="searchType" value="craft_name">공방명</option>
		         <option name="searchType" value="craft_specialty">품목명</option>
		      </select>
		      <input type="text" name="searchWord" id="searchWord" size="80" autocomplete="off" placeholder="공방명 또는 수선사명으로 검색해주세요" /> 
		      <input type="text" style="display: none;"/>
		      <button type="button" id="goSearch" style="border:none; border-radius:5px;">검색</button>
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
	
	
	<!-- 검색결과 -->
	<section class="searchSection" id="searchSection_id">
		<div class="grid--large">
				<div class="catalog-wrapper" id="search_wrapper">
					<div class="catalog-title">검색 결과</div>
						<ul class="grid">
						</ul>
				</div>
		</div>
	</section> 
	
	
	<hr style="border: solid 1px #e8e8e8; width:100%;">
	
	<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" id="contentNew">
					<h2 class="catalog-title">최근 입점 공방</h2>
					
								<ul class="grid">
								
									<%--카드 시작 --%>
									<c:forEach var="craftvo" items="${requestScope.craftsNewList}" varStatus="status">
										<li class="grid-column__item" id="cardContent"> 
											<figure class="card responsive-card">
												<a class="card__link" href="<%= ctxPath%>/crafts_detail.got?craft_num_pk=${craftvo.craft_num_pk}">
													<img alt="이미지없음" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" src="<%=ctxPath%>/resources/img/main_test.jpg" style="color: transparent;">
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
										</c:forEach>
										<%--카드 끝 --%>
										
									</ul>
						
				</div>
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
	<p>해당되는 공방이 존재하지 않습니다.</p>
	<i class="fa-light fa-circle-exclamation fa-2xl" style="color: #400099;"></i>
</c:if>
	
<c:if test="${not empty requestScope.craftsList}">
		<section class="recommend-card">
			<div class="grid--large">
				<div class="catalog-wrapper" id="contentCategory">
					<h2 class="catalog-title" id="bag">가방/핸드백 </h2>
						
							<ul class="grid">
							
							<c:forEach var="craftvo" items="${requestScope.craftsSumList}" varStatus="status">
								<li class="grid-column__item" id="cardContent">
									<figure class="card responsive-card">
										<a class="card__link" href="<%= ctxPath%>/crafts_detail.got?craft_num_pk=${craftvo.craft_num_pk}">
											<img alt="" loading="lazy" width="352" height="220" decoding="async" data-nimg="1" class="card__img" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202208/074517-765/insight-hirenze-coursecard.png?w=750&amp;q=75" style="color: transparent;">
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
							</c:forEach>	
								
							</ul>
						
					
				</div>
				<span class="catalog-more">
					<a class="catalog-more__link" id="seeDetail" href="<%= ctxPath%>/crafts_list_10bag.got" style="margin-left:100px;">자세히 보기
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
				<div class="catalog-wrapper" id="contentCategory">
					<h2 class="catalog-title" id="shoes">신발 </h2>
						
							<ul class="grid">
							<c:forEach var="craftvo" items="${requestScope.craftsSumList}" varStatus="status">
								<li class="grid-column__item" id="cardContent"">
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
								</c:forEach>
							</ul>
						
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_20shoes.got" style="margin-left:100px;">자세히 보기
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
				<div class="catalog-wrapper" id="contentCategory">
					<h2 class="catalog-title" id="wallet">지갑/벨트 </h2>
						
							<ul class="grid">
							<c:forEach var="craftvo" items="${requestScope.craftsSumList}" varStatus="status">
								<li class="grid-column__item" id="cardContent">
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
								</c:forEach>
							</ul>
						
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_30wallet.got" style="margin-left:100px;">자세히 보기
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
				<div class="catalog-wrapper" id="contentCategory">
					<h2 class="catalog-title" id="cloth">의류수선</h2>
						
							<ul class="grid">
							<c:forEach var="craftvo" items="${requestScope.craftsSumList}" varStatus="status">
								<li class="grid-column__item" id="cardContent">
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
								</c:forEach>
							</ul>
						
					
				</div>
				
				<span class="catalog-more">
						<a class="catalog-more__link" href="<%= ctxPath%>/crafts_list_40cloth.got" style="margin-left:100px;">자세히 보기
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