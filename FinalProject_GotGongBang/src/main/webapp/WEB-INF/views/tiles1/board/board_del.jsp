<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
   String ctxPath = request.getContextPath();
%>   
<style type="text/css">

	#inquiry_title {border: solid 1px #e6e6e6;
    					padding: 0px 0px 0px 25px;}
	
	.ojh_qulist { border: none !important
	
</style>

<script type="text/javascript">

  $(document).ready(function(){
	 
	  $("button#btnDelete").click(function(){
		  
		  const frm = document.delFrm;
		  frm.method = "post";
		  frm.action = "<%= ctxPath %>/delEnd.got";
		  frm.submit();
		  
	  });
	  
  });// end of $(document).ready(function(){})-------------------------------

</script>


  <div id="ojh_content">
        <section class="ojh_page_content_inquire">
            <header class="ojh_page-header ojh_page-header--customer" style="height: 200px">
              <span class="page-header__backdrop">
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
                <span class="page-header__backdrop-item"></span>
              </span>
              <h2 class="page-header__title aos-init aos-animate" data-aos="fade-up">
                <span aria-hidden="true" data-breadcrumb-menu="고객센터">고객센터</span>
                <span data-breadcrumb-current="FAQ">상세보기</span>
              </h2>

            </header>
            
            <form name="delFrm">
               <div class="ojh_delcheck">
               		<div class="ojh_delcheck_small">
               			<div style="margin: 40px 0px 0px 40px;">
	               			<div style=" font-size: 30px; font-weight: 700;">
	               				<input type="hidden" name="inquiry_num_pk" value="${requestScope.inquiry_num_pk}" />
	               				<div> 게시물을 삭제 하시겠습니까? </div>
	               			</div>		
	               			
	               			<div class="ojh_buttbox">
			               		<button class="ojh_delcheck_butt1" id="btnDelete">확인</button>
			               		<button class="ojh_delcheck_butt2" onclick="javascript:history.back()">취소</button>
	               			</div>
               			</div>	
               			
               		</div>
 			   </div>
              
            </form>
        </section>
    </div>