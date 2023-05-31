
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%
    String ctxPath = request.getContextPath();

%>   


<style type="text/css">
div#orderContent {
   padding: 50px;
   width: 1000px;
   margin: 30px auto;
   border: 1px solid #400099;
   /* background-color:#cceeff; */
    border-radius:10px;
	height:fit-content;

}

#chooseFile {
   /*  visibility: hidden; */
   display:none;
}

div.orderSelect{
	width:600px; 
	height:50px; 
	border:solid 1px gray; 
	border-radius:5px;
	display: flex;
    align-content: center;
    flex-wrap: wrap;
}
</style>
	
<script type="text/javascript">

	// == 모달 값 넘기기 == //
	var selectNum="";


	$(document).ready(function(){
		
		// i 이미지를 popover했을 때 이미지를 보여준다.
		$('a[rel=popover]').popover({
		  html: true,
		  trigger: 'hover',
		  placement: 'bottom',
		  content: function(){return '<img src="'+$(this).data('img') + '" />';}
		});
		
/* 		$(".orderSelect").click(function(){
			console.log( $("select[name='type_code_pk']").val());
		}); */
		
	
	   // == 제품 이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 시작 == //
	   
	   //같은걸 계속 잡으면 이벤트가 안 일어나도록 click 말고 change 사용. $() 이런건 jquery인데 javascript로 변경해야 사진이 뜬다
	   $(document).on("change","input.img_file1",function(e){
		   
		  const input_file = $(e.target).get(0);
		  // jQuery선택자.get(0) 은 jQuery 선택자인 jQuery Object 를 DOM(Document Object Model) element 로 바꿔주는 것이다. 
	      // DOM element 로 바꿔주어야 순수한 javascript 문법과 명령어를 사용할 수 있게 된다. 
	   
	      // 파일이름을 선택한 후, file input 엘리먼트의 files 프로퍼티를 출력해보면, 위와 같이 FileList 라는 객체가 출력되는 것을 볼 수 있다. 
	      // FileList 객체 프로퍼티(키)는 0,1 … 형태의 숫자로, 그리고 값에는 File 객체가 들어있다. 
	      // file input 엘리먼트의 files 프로퍼티의 값이 FileList 로 되어있으므로 File 객체에 접근하려면 input_file.files[i] 이런 식으로 사용하여 i 번째의 File 객체에 접근을 한다.
	   
	      
	   	  //console.log(input_file.files[0]);
	   	  /*
		      File {name: 'berkelekle심플라운드01.jpg', lastModified: 1605506138000, lastModifiedDate: Mon Nov 16 2020 14:55:38 GMT+0900 (한국 표준시), webkitRelativePath: '', size: 71317, …}
		   
		       >>설명<<
		       name : 단순 파일의 이름 string타입으로 반환 (경로는 포함하지 않는다.)
		       lastModified : 마지막 수정 날짜 number타입으로 반환 (없을 경우, 현재 시간)
		       lastModifiedDate: 마지막 수정 날짜 Date객체타입으로 반환
		       size : 64비트 정수의 바이트 단위 파일의 크기 number타입으로 반환
		       type : 문자열인 파일의 MIME 타입 string타입으로 반환 
		              MIME 타입의 형태는 type/subtype 의 구조를 가지며, 다음과 같은 형태로 쓰인다. 
		             text/plain
		             text/html
		             image/jpeg
		             image/png
		             audio/mpeg
		             video/mp4
		             ...
	     	*/   
	     	
	   		console.log(input_file.files[0].name);
	     	//berkelekle심플라운드01.jpg
	     
	   		// File 객체의 실제 데이터(내용물)에 접근하기 위해 FileReader 객체를 생성하여 사용한다.
	        const fileReader = new FileReader();
	        
	        fileReader.readAsDataURL(input_file.files[0]); // FileReader.readAsDataURL() --> 파일을 읽고, result속성에 파일을 나타내는 URL을 저장 시켜준다.
	     
	         fileReader.onload = function() { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임. 
	           // console.log(fileReader.result);
	         /*
	             data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAg 
	             이러한 형태로 출력되며, img.src 의 값으로 넣어서 사용한다.
	         */
	            document.getElementById("previewImg1").src = fileReader.result;
	        };
	        
	   });//$(document).on("change","input.img_file",function(e)
			   
			   
			   
	 //같은걸 계속 잡으면 이벤트가 안 일어나도록 click 말고 change 사용. $() 이런건 jquery인데 javascript로 변경해야 사진이 뜬다
	   $(document).on("change","input.img_file2",function(e){
		   
		  const input_file = $(e.target).get(0);
		  // jQuery선택자.get(0) 은 jQuery 선택자인 jQuery Object 를 DOM(Document Object Model) element 로 바꿔주는 것이다. 
	      // DOM element 로 바꿔주어야 순수한 javascript 문법과 명령어를 사용할 수 있게 된다. 
	   
	      // 파일이름을 선택한 후, file input 엘리먼트의 files 프로퍼티를 출력해보면, 위와 같이 FileList 라는 객체가 출력되는 것을 볼 수 있다. 
	      // FileList 객체 프로퍼티(키)는 0,1 … 형태의 숫자로, 그리고 값에는 File 객체가 들어있다. 
	      // file input 엘리먼트의 files 프로퍼티의 값이 FileList 로 되어있으므로 File 객체에 접근하려면 input_file.files[i] 이런 식으로 사용하여 i 번째의 File 객체에 접근을 한다.
	   
	      
	   	  //console.log(input_file.files[0]);
	   	  /*
		      File {name: 'berkelekle심플라운드01.jpg', lastModified: 1605506138000, lastModifiedDate: Mon Nov 16 2020 14:55:38 GMT+0900 (한국 표준시), webkitRelativePath: '', size: 71317, …}
		   
		       >>설명<<
		       name : 단순 파일의 이름 string타입으로 반환 (경로는 포함하지 않는다.)
		       lastModified : 마지막 수정 날짜 number타입으로 반환 (없을 경우, 현재 시간)
		       lastModifiedDate: 마지막 수정 날짜 Date객체타입으로 반환
		       size : 64비트 정수의 바이트 단위 파일의 크기 number타입으로 반환
		       type : 문자열인 파일의 MIME 타입 string타입으로 반환 
		              MIME 타입의 형태는 type/subtype 의 구조를 가지며, 다음과 같은 형태로 쓰인다. 
		             text/plain
		             text/html
		             image/jpeg
		             image/png
		             audio/mpeg
		             video/mp4
		             ...
	     	*/   
	     	
	   		console.log(input_file.files[0].name);
	     	//berkelekle심플라운드01.jpg
	     
	   		// File 객체의 실제 데이터(내용물)에 접근하기 위해 FileReader 객체를 생성하여 사용한다.
	        const fileReader = new FileReader();
	        
	        fileReader.readAsDataURL(input_file.files[0]); // FileReader.readAsDataURL() --> 파일을 읽고, result속성에 파일을 나타내는 URL을 저장 시켜준다.
	     
	         fileReader.onload = function() { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임. 
	           // console.log(fileReader.result);
	         /*
	             data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAg 
	             이러한 형태로 출력되며, img.src 의 값으로 넣어서 사용한다.
	         */
	            document.getElementById("previewImg2").src = fileReader.result;
	        };
	        
	   });//$(document).on("change","input.img_file",function(e)	   
		   
		   
		   
	   // == 제품 이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 끝 == //
	   
	   
	   
	   // == 모달 창 띄워지면
	   // 1. select에서 넘어온 값을 ajax로 db로 가서 해당 카테고리번호로 select해서 list 가져오기
	    $('div#selectReq').on('show.bs.modal', function(event) {          
        	selectNum = $(event.relatedTarget).data('selectNum');

        	$("div#test1").val("333"+selectNum);
        });

	   
	  
	});// ready
		
</script>


 <!-- 본문시작 -->
 <div id="container">
     <div id="orderContent">
     	
     	<p class="orderTitle">견적 의뢰</p>
     	
     	<hr class="orderHr">
     	
    <form name="orderFrm" enctype="multipart/form-data">	
	<table>
      	<tr>
     		<td class="orderTd orderTdTitle">품목</td>
     		<td class="orderTd">
     			<select class="orderSelect" name="type_code_pk">
     			<c:forEach var="types" items="${requestScope.typesList}" > 
     				<option value="${types.type_code_pk}">${types.type_name}</option>
     				
     			</c:forEach>
 					
				</select>
			</td>
     	</tr>
   		<tr>
   			<td class="orderTd orderTdTitle">브랜드</td>
   			<td class="orderTd">
   				<input class="orderInput" name="brand_name" placeholder="브랜드를 직접 입력해주세요"/>
			</td>
   		</tr>
   		
   		

   		
   		<tr>
   			<td class="orderTd orderTdTitle">전체 사진&nbsp;
   				<a class="orderPop" rel="popover" data-img="<%=ctxPath%>/resources/img/order_pic_example.png">
   					<i class="fa-regular fa-circle-question"></i>
   				</a>
   			</td>
   			
   			<td class="orderTd" style="display:flex;     justify-content: space-between;">
   				<div class="orderDivPic"  style="width:140px; height:140px;">
   					<input type="file" id="chooseFile" class="img_file1" name="chooseFile" accept="image/*" onchange="loadFile(this)"/>
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 		
      	 	
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg1" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg11" style="width:140px; height:140px; position:static; border:solid 0px white;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg11" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
			</td>
   		</tr>
   		

   		
   		<tr>
   			<td class="orderTd orderTdTitle">상세 사진&nbsp;
   				<a class="orderPop" rel="popover" data-img="<%=ctxPath%>/resources/img/order_pic_example.png">
   					<i class="fa-regular fa-circle-question"></i>
   				</a>
   			</td>
   			
   			<td class="orderTd" style="display:flex; justify-content: space-between;">
   				<div class="orderDivPic"  style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg2" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg22" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg22" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
			</td>
   		</tr>
   		

   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항</td>
   			
   			<td class="orderTd">
   				<div class="orderSelect">
					<a style="cursor: pointer;  color:gray; width:600px; " data-selectNum="efef" data-toggle="modal" data-target="#selectReq" data-dismiss="modal" data-backdrop="static">수선 요청사항을 선택해 주세요.</a>
				<%-- $('select#orderSelect').val() --%>
				</div>
			</td>
   		</tr>
   		
   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항 설명</td>
   			<td class="orderTd">
    			<div class="orderReq">
		  			<p class="orderMargin pCenter">요청사항을 적으실 때는 세 가지만 기억해주세요!</p>
		  			<p class="orderMargin pCenter">
		  				<span class="hightlight">어디가</span> 
		  				<span class="lightgray">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
		  				<span class="hightlight">어때서</span> 
		  				<span class="lightgray">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
		  				<span class="hightlight">어떻게</span> 
		  			</p>
		  			<p class="orderMargin pCenter">ex. 프라다 
		  				<span class="hightlight">가방 모서리가 헤져서</span> 깨끗하게 
		  				<span class="hightlight">고쳐주세요</span> 
		  			</p>
  				</div>
		  		<div class="orderDivArea" >
		  			<textarea id="orderTextarea" placeholder="위의 안내에 따라 적어주셔야 자세하고 친절한 상담이 가능합니다." id="textarea"></textarea>
		  		</div>
			</td>
   		</tr>
   	</table>
   	</form>


	<p class="pCenter">
  		<button type="button" class="orderButton">다 음</button>			
	</p>
   	</div>

 </div>
 <!--본문 끝 -->


  <%-- ****** 수선사항 요청 Modal ****** --%>
  <div class="modal fade" id="selectReq"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title">수선 요청사항 선택</h4>
          <button type="button" class="close selectReqClose" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="idFind">
          
          
          	<form name="selectReq">
				<p>수선 유형</p>
				<ul style="list-style-type: none">
			         <li style="">
			         	<input type="radio" name="userid" id="userid" value=""/>
			            <label for="userid" style="display: inline-block; width: 250px">전체 가죽 교체</label>
			         </li>
			         
			         <li style="">
			         	<input type="radio" name="userid2" id="userid2" value=""/>
			            <label for="userid2" style="display: inline-block; width: 250px">부분 가죽 교체</label>
			         </li>
			   </ul>
			   <div id="test1"></div>
			   
			</form>
			
			
            <%--  <iframe id="iframe_idFind" style="border: none; width: 100%; height: 600px;" src="<%= request.getContextPath()%>/selectReq.got?selectNum=selectNum">
             </iframe> --%>
             
             
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" style="display: flex; justify-content: center;">
          <button style="width:450px; height:50px; background-color:#400099;" type="button" class="btn btn-secondary selectReqClose" data-dismiss="modal">선택하기</button>
        </div>
      </div>
      
    </div>
  </div>