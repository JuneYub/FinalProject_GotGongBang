
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
</style>
	
<script type="text/javascript">
	$(document).ready(function(){
		
		
		// i 이미지를 popover했을 때 이미지를 보여준다.
		$('a[rel=popover]').popover({
		  html: true,
		  trigger: 'hover',
		  placement: 'bottom',
		  content: function(){return '<img src="'+$(this).data('img') + '" />';}
		});
		
		
	
	   // == 제품 이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 시작 == //
	   
	   //같은걸 계속 잡으면 이벤트가 안 일어나도록 click 말고 change 사용. $() 이런건 jquery인데 javascript로 변경해야 사진이 뜬다
	   $(document).on("change","input.img_file",function(e){
		   
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
	            document.getElementById("previewImg").src = fileReader.result;
	        };
	        
	   });//$(document).on("change","input.img_file",function(e)
		   
		   
		   
		   // == 제품 이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 끝 == //
		   
		   
		   
		//아이디 찾기에서 x 표와 close 버튼 눌렀을 시 reset		
		$("button.idFindClose").click(function(){
			
			const iframe_idFind = document.getElementById("iframe_idFind");
			//대상 아이프레임을 선택한다.
			
			const iframe_window= iframe_idFind.contentWindow;
			// iframe 요소에 접근하는 contentWindow 와 contentDocument 의 차이점은 아래와 같다.
           // contentWindow 와 contentDocument 둘 모두 iframe 하위 요소에 접근 할 수 있는 방법이다.
          // contentWindow 는 iframe의 window(전체)을 의미하는 것이다.
          // 참고로, contentWindow.document 은 contentDocument 와 같은 것이다.
           // contentWindow 가 contentDocument 의 상위 요소이다.
			
			iframe_window.func_form_reset_empty();	//func_form_reset_empty 함수는 idFInd.jsp 파일에 정의해 둠.
		});
		
	   
	   
		
		//비밀번호 찾기에서 x 표와 close 버튼 눌렀을 시 새로고침		
		$("button.passwdFindClose").click(function(){
			
			/* === 새로고침(다시읽기) 방법 3가지 차이점 ===
           >>> 1. 일반적인 다시읽기 <<<
           window.location.reload();
           ==> 이렇게 하면 컴퓨터의 캐시에서 우선 파일을 찾아본다.
                    없으면 서버에서 받아온다. 
           
           >>> 2. 강력하고 강제적인 다시읽기 <<<
           window.location.reload(true);
           ==> true 라는 파라미터를 입력하면, 무조건 서버에서 직접 파일을 가져오게 된다.
                    캐시는 완전히 무시된다.
           
           >>> 3. 부드럽고 소극적인 다시읽기 <<<
           history.go(0);
           ==> 이렇게 하면 캐시에서 현재 페이지의 파일들을 항상 우선적으로 찾는다.
        */   
        
      		//현재 위의 중에 아무거나 가능.
			history.go(0);
           //현재 페이지를 새로고침을 함으로써 모달창에 입력한 userid 와 email의 값이 텍스트 박스에 남겨있지 않고 삭제하는 효과를 누린다
           //javascript:history.go(0);이것도 괜찮다.
		});   
	});
		
			
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
     			<select class="orderSelect" name="types_code">
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
   					<input type="file" id="chooseFile" class="img_file" name="chooseFile" accept="image/*" onchange="loadFile(this)"/>
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 		
      	 	
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static; border:solid 0px white;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static;" />
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
   					<input type="file" id="chooseFile" name="chooseFile" class="img_file" accept="image/*" onchange="loadFile(this)"/>
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
      	 		<div class="orderDivNoBorder" style="width:140px; height:140px;">
   					<label for="chooseFile" style="cursor: pointer;" class="orderDivPic">
   						<img id="previewImg" style="width:140px; height:140px; position:static;" />
	       			</label>
      	 		</div>
      	 		
			</td>
   		</tr>
   		

   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항</td>
   			
   			<td class="orderTd">
   				<div class="orderSelect">
					<p style="color:gray; cursor: pointer;"></p>
					<a style="cursor: pointer;" data-toggle="modal" data-target="#selectReq" data-dismiss="modal" data-backdrop="static">수선 요청사항을 선택해 주세요.</a>
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


  <!-- 비밀번호 찾기 실패 후 x 표나 닫기 누르면 새로고침하게 -->
  <%-- ****** 비밀번호 찾기 Modal ****** --%>
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
             <iframe id="iframe_idFind" style="border: none; width: 100%; height: 600px;" src="<%= request.getContextPath()%>/selectReq.got">
             </iframe>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger selectReqClose" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>