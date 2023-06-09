package com.spring.gotgongbang.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class MyUtil {
   // *** ? 다음의 데이터까지 포함한 현재 URL주소를 알려주는 메소드를 생성한다 
   public static String getCurrentURL(HttpServletRequest request) {
      
      // 웹브라우저 주소 입력창에서
      //http://localhost:9090/MyMVC/member/memberList.up?searchType=name&searchWord=유&currentShowPageNo=5&sizePerPage=3 와 같이
      // 입력되었다라면
      String currentURL = request.getRequestURL().toString();
      //System.out.println("~~~ 확인용 url =>" + currentURL);
      // ~~~ 확인용 currentURL =>http://localhost:9090/MyMVC/member/memberList.up
      
      String queryString = request.getQueryString();
      System.out.println("~~~ 확인용 queryString =>" + queryString);
      //~~~ 확인용 queryString => searchType=name&searchWord=유&currentShowPageNo=5&sizePerPage=3 (GET 방식일 경우)
      // ~~~ 확인용 queryString => null(POST 방식일 경우)
      
      if(queryString != null) { // get방식일 경우
         currentURL += "?" + queryString;
      // http://localhost:9090/MyMVC/member/memberList.up?searchType=name&searchWord=유&currentShowPageNo=5&sizePerPage=3   
      }
      String ctxPath = request.getContextPath();
      
      int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
      
      currentURL = currentURL.substring(beginIndex);
      // "/member/memberList.up?searchType=name&searchWord=유&currentShowPageNo=5&sizePerPage=3"
      
      
      return currentURL;
   }
   
   public String makePageBar(int currentShowPageNo, int blockSize, int totalPage, String url) {
	      int loop = 1;
	      int startPageNo = ((currentShowPageNo-1)/blockSize)*blockSize+1;
	      
	      String pageBar = "<ul class='pageBar'>";
	      
	      if(startPageNo != 1) {
	         pageBar += "<li class='pageBar-edge'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
	         pageBar += "<li class='pageBar-move'><a href='"+url+"?currentShowPageNo="+(startPageNo-1)+"'>[이전]</a></li>";
	      }
	      
	      while( !(loop > blockSize || startPageNo > totalPage) ) {
	         if(startPageNo == currentShowPageNo) {
	            pageBar += "<li class='pageBar-currentNo'>"+currentShowPageNo+"</li>";
	         }
	         else {
	        	 pageBar += "<li class='pageBar-currentNo'><a href='"+url+"?currentShowPageNo="+startPageNo+"'>"+startPageNo+"</a></li>";
	         }
	         
	         loop++;
	         startPageNo++;
	      }
	      
	      if( startPageNo <= totalPage) {
	         pageBar += "<li class='pageBar-move><a href='"+url+"?currentShowPageNo="+currentShowPageNo+"'>[다음]</a></li>";
	         pageBar += "<li class='pageBar-edge><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
	      }
	      
	      pageBar += "</ul>";
	      
	      return pageBar;
   }
   
   
   
}