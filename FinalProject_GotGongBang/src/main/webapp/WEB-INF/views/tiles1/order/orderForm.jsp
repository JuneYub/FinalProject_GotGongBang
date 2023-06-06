
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

.choose_file {
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
	var value="10";
	
	// 사진 리스트
	var img_whole_list = new Array();
	var img_detail_list = new Array();
	
	// 사진 리스트 카운트
	let img_whole_cnt = 0;
	let img_detail_cnt = 0;
	
	// 사진 html
	let img_whole_html ="";
	let img_detail_html ="";

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
	   $(document).on("change",".choose_file",function(e){
		   
		   
		   let input_file = $(e.target).get(0);
		   // jQuery선택자.get(0) 은 jQuery 선택자인 jQuery Object 를 DOM(Document Object Model) element 로 바꿔주는 것이다. 
	       // DOM element 로 바꿔주어야 순수한 javascript 문법과 명령어를 사용할 수 있게 된다. 
	   
	       // 파일이름을 선택한 후, file input 엘리먼트의 files 프로퍼티를 출력해보면, 위와 같이 FileList 라는 객체가 출력되는 것을 볼 수 있다. 
	       // FileList 객체 프로퍼티(키)는 0,1 … 형태의 숫자로, 그리고 값에는 File 객체가 들어있다. 
	       // file input 엘리먼트의 files 프로퍼티의 값이 FileList 로 되어있으므로 File 객체에 접근하려면 input_file.files[i] 이런 식으로 사용하여 i 번째의 File 객체에 접근을 한다.
	   	   //console.log( input_file.id );
		   
		   
		   let file_id = input_file.id; // 전체사진인지, 부분사진인지
		   let file_name = input_file.files[0].name;	//파일 이름
	     
	   	   // File 객체의 실제 데이터(내용물)에 접근하기 위해 FileReader 객체를 생성하여 사용한다.
	       const fileReader = new FileReader();
	        
	       fileReader.readAsDataURL(input_file.files[0]); // FileReader.readAsDataURL() --> 파일을 읽고, result속성에 파일을 나타내는 URL을 저장 시켜준다.
	     
	       // 전체사진 추가했을 경우   
	       if("img_whole" == file_id){
	    	
	    	   
	    	   if(img_whole_cnt == 3){
	    		   alert("최대 3개까지 추가 가능합니다.");
	    		   return;
	    	   }
        	   fileReader.onload = function() { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임. 
	 	       
	 	           /*
	 	               data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAg 
	 	                            이러한 형태로 출력되며, img.src 의 값으로 넣어서 사용한다.
	 	           */
	 	           img_whole_cnt ++; 
	 	           img_whole_html = "<label style='cursor: pointer;' class='orderDivPic'>" +
						 	           "<img src='" + fileReader.result + "' id='previewImg0" + img_whole_cnt + "' style='width:140px; height:140px; position:static;' />" +
						 	           "</label>";
	   			 
				   $("div[id='img_whole_num']").text(img_whole_cnt+"/3"); 
	 	           //document.getElementById("previewImg01").src = fileReader.result;
	   			   $("div[id='img_whole_div_"+img_whole_cnt+"']").html(img_whole_html); 
	   			   img_whole_list.push(file_name);
	   			   
	   						
				   
	 	        };
	        }
	      
	     	// 디테일사진 추가했을 경우   
	        else if("img_detail" == file_id){
	        	
	        	if(img_detail_cnt == 3){
		    		   alert("최대 3개까지 추가 가능합니다.");
		    		   return;
		    	   }
	        	
	        	fileReader.onload = function() { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임. 
	
		 	        img_detail_cnt ++; 
		   			img_detail_html = "<label style='cursor: pointer;' class='orderDivPic'>" +
						 	           "<img src='" + fileReader.result + "' id='previewImg1" + img_detail_cnt + "' style='width:140px; height:140px; position:static;' />" +
						 	           "</label>";
		
					$("div[id='img_detail_num']").text(img_detail_cnt+"/3"); 
		 	        //document.getElementById("previewImg01").src = fileReader.result;
		   			$("div[id='img_detail_div_"+img_detail_cnt+"']").html(img_detail_html); 
		   			img_detail_list.push(file_name);
		 	     };
	        }
	        

	   });//  $(document).on("change",".choose_file",function(e)
			   
			
		   
	   // == 제품 이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 끝 == //
	   
	   
	   
	   
	   
	   
	   
	   
	   //////// 모달 연습 중 /////////
/* 	   
	   // == 모달 창 띄워지면
	   // 1. select에서 넘어온 값을 ajax로 db로 가서 해당 카테고리번호로 select해서 list 가져오기
	    $('div#selectReq').on('show.bs.modal', function(event) {          
        	selectNum = $(event.relatedTarget).data('selectNum');

        	$("div#test1").val("333"+selectNum);
        }); */
	   
	   
	   
       // 수선 요청사항을 선택해주세요를 누르면 
	   $(".btn-modal").click(function(){
			
			/* var value = $(this).data('id'); */
			
			//$("buttn.btn-modal").attr("data-id",value);
			
		    $("#contents.body-contents").val(value);
		    $("#text-contents.body-contents").html(value);
		    
		    //console.log(value);
		    
		    
		    // 선택한 품목에 해당하는 요청사항 리스트 가져오기
		    $.ajax({
		    	  url:"<%=request.getContextPath()%>/bring_request_list.got",
		    	  
		    	  data:{"type_code_pk":value},
		    		
		    	 /* 또는
		          data:queryString,
		         */
		    	  type:"post",
		    	  dataType:"json",
		    	  success:function(json){
		    		  //console.log("확인용 : "+JSON.stringify(json));
		    		  
		    		  let html = "<ul style='list-style-type: none'>";
					  if(json.length > 0){
						  $.each(json,function(index,item){
							  html += "	<li>"+
								"<input type='radio' class='req_class' name='"+item.detail_type_pk+"' id='"+item.detail_type_pk+"' value='"+item.detail_type_pk+"'/>"+
								"<label for='"+item.detail_type_pk+"' style='display: inline-block; width: 400px; padding-left:10px;'>"+item.detail_type_name+"</label>"+
								"</li>";
						  });
					  }
					html+="</ul>";
				  		
					$("form[name='selectReq']").html(html); 
		    	  },
		    	  error: function(request, status, error){
		              alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
		      });
		    
		});
        
        
        
        
        
	   $("#modal_requestInput").click(function(){
		   
		   // == 라디오의 체크된 개수 (checked 속성이용) == //
		   const radio_cnt = $("input:radio[class='req_class']:checked").length;
		   //console.log("radio_cnt : "+radio_cnt);
		   
		   
		   // 선택한 라디오들 가져오기
		   const req_name_list = new Array();	// 얘는 요청사항 이름들 (가죽교체, 스트랩교체 )
		   const req_num_list = new Array();	// 얘는 요청사항 번호 (10, 11 )
		   
		   
		   if(radio_cnt < 1){	//체크한 제품이 없으면
			   alert("요청사항을 하나 이상 선택하세요");
		   	   return;
		   }
		   else if(radio_cnt > 3){	// 3개 이상 선택한 경우
			   alert("3개 이하로만 선택하세요");
		   	   return;
		   }
		   
		   
		   // 1개 이상 3개 이하로 선택한 경우
		   else{
			   
			   const radio_list = $("input:radio[class='req_class']").length;
			   
			   for(let i =0;i<radio_list;i++){
				   
				   
				   if( $("input:radio[class='req_class']").eq(i).prop("checked") ){//i번째 radio에 체크가 되어있냐
				   		

					   //alert("선택한 요청사항들 번호 :"+$("input:radio[class='req_class']").eq(i).val() );
					   //alert("선택한 요청사항들 이름 :"+$("input:radio[class='req_class']").eq(i).next().text());

					   
			  		   req_num_list.push($("input:radio[class='req_class']").eq(i).val());			// 수선사항 번호 리스트
			  		   req_name_list.push($("input:radio[class='req_class']").eq(i).next().text());	// 수선사항 이름 리스트
					   
					   
		
				   } // if
				   
			   } // for
			   
			   const req_name_list_join = req_name_list.join(' , ');
			   const req_num_list_join = req_num_list.join(',');	// 리스트로 들어온 값을 string으로 받음
			   
			   
			   //console.log("이름 req_name_list_join : "+req_name_list_join);
			   //console.log("번호 req_num_list_join : "+req_num_list_join);
			   
			   $("input#inputSelectList").attr("type","text");
			 
			   $("a.btn-modal").hide();
			   //$("input#inputSelectList").attr("name",reqest_list);
			   $("input#inputSelectList").val(req_name_list_join);
			   $("input[name='reqest_list']").val(req_num_list_join);
		   }
		   
		    
		});
	  
	});// ready   
	
	
	
	// 품목 선택이 바뀔때마다 모달창에 넘겨주는 품목번호 바꿔서 전달
	function changeFn(){
		let type_code_pk  = document.getElementById("type_code_pk");
		value = (type_code_pk.options[type_code_pk.selectedIndex].value);
		
		$("a.btn-modal").attr("data-selectNum",value);
		
		//alert("value = "+value);
		
		
		/* 		
		var selectedindex = city.selectedIndex;
		alert("value = "+value+" , selectedindex = "+selectedindex); 
		*/

	};
	
/* 	
    // 모달에서 선택한 라디오 부모창으로 값 넘겨주기
	function getSelect(){
		let modalSel  = document.getElementById("modalSel");
		value = (modalSel.options[modalSel.selectedIndex].value);
		
		console.log(value);
		
		$("div#inputSelectList").val(value);
		
	} */
	
	
	
	
	//썸네일 클릭시 삭제.
	function fileRemove(index) {
	    console.log("index: "+index);
	    fileInfoArr.splice(index,1);
	 
	    var imgId="#img_id_"+index;
	    $(imgId).remove();
	    console.log(fileInfoArr);
	}
	
	
	function goRegister(){
		
		const img_whole_list_join = img_whole_list.join(',');
		const img_detail_list_join = img_detail_list.join(',');
		
		$("input[name='img_whole_name']").val(img_whole_list_join);
		$("input[name='img_detail_name']").val(img_detail_list_join);
		
		// 브랜드 입력
		if($("input[name='brand_name']").val().trim()==""){
			alert("빈 칸 없이 모두 입력하세요.");
			return;
		}
		
		// 사진 최소 1장 입력
		else if(img_whole_list_join=="" || img_detail_list_join==""){
			alert("사진을 항목별로 최소 1장 넣어주세요.");
			return;
		}
		
		// 요구사항 최소 1개 입력
		else if($("input#inputSelectList").val().trim()==""){
			alert("요구사항을 최소 1개 이상 선택하세요.");
			return;
		}
		
		// 수선 요구사항 입력
		else if($("textarea#orderTextarea").val().trim()==""){
			alert("수선 요구사항을 적어주세요.");
			return;
		}
		
		else{
			alert("수선 요청 신청 완료!");
			const frm = document.order_form;
			frm.action = "order_form.got";
			frm.method = "post";
			frm.submit();
		}
		
	}
		
</script>


 <!-- 본문시작 -->
 <div id="container">
     <div id="orderContent">
     	
     	<p class="orderTitle">견적 의뢰</p>
     	
     	<hr class="orderHr">
    <form name="order_form" enctype="multipart/form-data">	
	<table>
      	<tr>
     		<td class="orderTd orderTdTitle">품목</td>
     		<td class="orderTd">
     			<select class="orderSelect" id="type_code_pk" name="type_code_pk" onchange="changeFn()">
     			<c:forEach var="types" items="${requestScope.typesList}" > 
     				<option name="type_code_pk" value="${types.type_code_pk}">${types.type_name}</option>
     				
     			</c:forEach>
 					
				</select>
			</td>
     	</tr>
   		<tr>
   			<td class="orderTd orderTdTitle">브랜드</td>
   			<td class="orderTd">
   				<input class="orderInput" name="brand_name" autocomplete='off' placeholder="브랜드를 직접 입력해주세요"/>
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
   					<input type="hidden" name="img_whole_name"/>
   					<input type="file" id="img_whole" class="choose_file" name="img_whole" accept="image/*" />
   					<label for="img_whole" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div id="img_whole_num" style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 	
      	 		<div id="img_whole_div_1" class="orderDivNoBorder" style="width:140px; height:140px;">
   					
      	 		</div>
      	 		
      	 		<div id="img_whole_div_2" class="orderDivNoBorder" style="width:140px; height:140px;">
   					
      	 		</div>
      	 		
      	 		<div id="img_whole_div_3" class="orderDivNoBorder" style="width:140px; height:140px;">
   					
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
   				<div class="orderDivPic"  style="width:140px;  height:140px;">
   				<input type="hidden" name="img_detail_name"/>
   				<input type="file" id="img_detail" class="choose_file" name="img_detail" accept="image/*" />
   					<label for="img_detail" style="cursor: pointer;" class="orderDivPic">
		       			<i class="fa-regular fa-image fa-4x" style="color:lightgray;"></i>
		       			<div id="img_detail_num" style="text-align: center;">0/3</div>
	       			</label>
      	 		</div>
      	 		
      	 		
      	 		<div id="img_detail_div_1" class="orderDivNoBorder" style="width:140px; height:140px;">
   				
      	 		</div>
      	 		
      	 		<div id="img_detail_div_2" class="orderDivNoBorder" style="width:140px; height:140px;">
   			
      	 		</div>
      	 		
      	 		<div id="img_detail_div_3" class="orderDivNoBorder" style="width:140px; height:140px;">
   				
      	 		</div>
      	 		
			</td>
   		</tr>
   		

   		<tr>
   			<td class="orderTd orderTdTitle">수선 요청사항</td>
   			
   			<td class="orderTd">
   				<div class="orderSelect">
					<a class="btn-modal" style="cursor: pointer;  color:gray; width:600px; " data-selectNum="" data-toggle="modal" data-target="#selectReq" data-dismiss="modal" data-backdrop="static">수선 요청사항을 선택해 주세요.</a>
					<input id="inputSelectList"  type="hidden" style="width:600px; height:50px; border-radius:5px; border:solid 1px black; font-size:12pt;" readonly></input>
					<input type="hidden" name="reqest_list"/>
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
		  			<textarea name="req_textarea" id="orderTextarea" placeholder="위의 안내에 따라 적어주셔야 자세하고 친절한 상담이 가능합니다." id="textarea"></textarea>
		  		</div>
			</td>
   		</tr>
   	</table>
   	</form>


	<p class="pCenter">
  		<button type="button" class="orderButton" onclick="goRegister()">다 음</button>			
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
				<!-- ajax로 라디오 추가됨 -->

			</form>
			
			
            <%--  <iframe id="iframe_idFind" style="border: none; width: 100%; height: 600px;" src="<%= request.getContextPath()%>/selectReq.got?selectNum=selectNum">
             </iframe> --%>
             
             
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" style="display: flex; justify-content: center;">
          <button id="modal_requestInput" style="width:450px; height:50px; background-color:#400099;" type="button" class="btn btn-secondary selectReqClose" data-dismiss="modal" data-reqList="">선택하기</button>
        </div>
      </div>
      
    </div>
  </div>