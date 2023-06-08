package com.spring.gotgongbang.craft.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.ImageVO;
import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.craft.service.InterCraftService;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.OrderVO;

@Controller
public class CraftController {
   

   @Autowired         //spring이 알아서 type에 따라서 bean을 주입해준다.
   private InterCraftService service;
   

    @Autowired   
    private FileManager fileManager;
      
   

   // 김나윤 시작
   // ===========================================================================
    
   @RequestMapping(value="/crafts_detail.got")
   public ModelAndView craftDetail(ModelAndView mav, HttpServletRequest request) {
	  //request.getParameter("")
      mav.setViewName("/craft/craft_detail.tiles1");
 //     mav.addObject("craftvo_2", craftvo_2);
      
      return mav;
   }
   
   
//   @RequestMapping(value="/crafts_list.got")
//   public ModelAndView craftList(ModelAndView mav) {
//      mav.setViewName("/craft/craft_list.tiles1");
//      return mav;
//   }
   
   @RequestMapping(value="/crafts_list_10bag.got")
   public ModelAndView craftList_10bag(ModelAndView mav) {
      mav.setViewName("/craft/craft_list_10bag.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/crafts_list_20shoes.got")
   public ModelAndView craftList_20shoes(ModelAndView mav) {
      mav.setViewName("/craft/craft_list_20shoes.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/crafts_list_30wallet.got")
   public ModelAndView craftList_30wallet(ModelAndView mav) {
      mav.setViewName("/craft/craft_list_30wallet.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/crafts_list_40cloth.got")
   public ModelAndView craftList_40cloth(ModelAndView mav) {
      mav.setViewName("/craft/craft_list_40cloth.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/crafts_list.got")
   public ModelAndView crafts_list_select(ModelAndView mav) {
      
      List<CraftVO> craftsList = null;
      
      craftsList = service.crafts_list_select();
      
      /*
      for(int i = 0; i< craftsList.size(); i++) {
         System.out.println(craftsList.get(i).getCraft_name());
         System.out.println(craftsList.get(i).getCraft_Introduce());
         
      }
      */
      
      mav.addObject("craftsList", craftsList);
      mav.setViewName("/craft/craft_list.tiles1");
      

      
      return mav;
      
   }
   
/*   
   @RequestMapping(value="/crafts_detail.got")
   public ModelAndView crafts_detail_select()
*/   
   
/*   
   @ResponseBody
   @RequestMapping(value="/wordSearchShow.action", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
   public String wordSearchShow(HttpServletRequest request) {
      
      String searchType = request.getParameter("searchType");
      String searchWord = request.getParameter("searchWord");
      
      Map<String, String> paraMap = new HashMap<>();  //map에 담아서 넘겨준다.
      paraMap.put("searchType", searchType);
      paraMap.put("searchWord", searchWord);
      
      String json = service.wordSearchShow(paraMap);  //map을 보내어준다.
      
      return json;
   }
   
*/
   
   
/*   
   @RequestMapping(value="/crafts_detail.got")
   public ModelAndView crafts_detail_select(ModelAndView mav) {
      
      CraftVO craftvo = null;
      
      craftvo = service.crafts_detail_select();
      
      
      
      mav.addObject("craftvo", craftvo);
      mav.setViewName("/craft/craft_detail.tiles1");
      

      
      return mav;
      
   }
*/   
   
/*   
   @ResponseBody
   @RequestMapping(value="/crafts_list.got")
   public ModelAndView crafts_list_select(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
      
      String craft_specialty = request.getParameter("craft_specialty");
      
      List<CraftVO> cvo = service.crafts_list_select(craft_specialty);
      
      JSONArray jsonArr = new JSONArray();
      
      for(CraftVO craftvo : cvo ) {
         JSONObject jsonObj = new JSONObject();
         jsonObj.put("craft_name", craftvo.getCraft_name());
         jsonObj.put("craft_introduce", craftvo.getCraft_Introduce());
         jsonObj.put("craft_representative", craftvo.getCraft_representative());
         jsonObj.put("craft_image", craftvo.getCraft_image());
         
         jsonArr.put(jsonObj);
         
      }
      
      System.out.println(jsonArr);
//      console.log(jsonArr);
      mav.setViewName("/craft/craft_list.tiles1");
      return mav;
   }
*/   
   
   
   
   
   
   // 김나윤 끝
   // ===========================================================================

   
   
   
   
   

   
   
   // 김진솔 시작
   // ===========================================================================
   
   @RequestMapping(value = "/craft_agree.got")      //공방 약관동의
   public ModelAndView craftAgree(ModelAndView mav) {
      mav.setViewName("craft/craftAgree.tiles1");
      return mav;
   }
   
   @RequestMapping(value = "/craft_application.got")   //공방 신청
   public ModelAndView craftApplication(ModelAndView mav) {
      mav.setViewName("craft/craftApplication.tiles1");
      return mav;
   }

   @RequestMapping(value = "/craft_complete.got")      //신청 완료 페이지
   public ModelAndView craftComplete(ModelAndView mav) {
      mav.setViewName("craft/craftComplete.tiles1");
      return mav;
   }
   
   
   // == 이미 존재하는 '공방이름'인지 알아오기 위한 것 == //
   @ResponseBody
   @RequestMapping(value = "/craft_check_name.got", method = {RequestMethod.POST})
   public String craft_check_name(HttpServletRequest request, HttpServletResponse response) {
      String craft_name = request.getParameter("nickname");
      int n = 0;
      try {
         n = service.craft_check_name(craft_name);
      } catch (Throwable e) {
            e.printStackTrace();
      }
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);

      return jsonObj.toString();
      
   }
   
   

   //공방 신청정보를(첨부파일 포함)DB에 insert해주는 기능
   @RequestMapping(value = "/craft_application_end.got", method = {RequestMethod.POST})
   public String craft_application_end(CraftVO cvo, ImageVO imgvo, MultipartHttpServletRequest mrequest, HttpServletRequest request , HttpServletResponse response) { 

	  // 이미지 파일들 가져오기
      List<MultipartFile> fileList = new ArrayList<MultipartFile>();
      fileList.add(cvo.getCraft_image());
      fileList.add(cvo.getCraft_representative_image());
      fileList.add(cvo.getCraft_certificate());
      
      int n = 0;
      /////////////////////////////////////////////////////
      // 이미지 파일 업로드
       System.out.println("확인용 fileList: " + fileList);
       
       if(!fileList.isEmpty()) {
          HttpSession session = mrequest.getSession();
         String root = session.getServletContext().getRealPath("/"); 
         //   System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root); 

         String path = root+"resources"+File.separator+"files";
         
          System.out.println("~~~~ 확인용 path => " + path);
         
          String newFileName = "";
          // WAS(톰캣)의 디스크에 저장될 파일명
         
          String originalFilename = "";
          
          byte[] bytes = null;
          // 첨부파일의 내용물을 담는 것
         
          long fileSize = 0;
          // 첨부파일의 크기
          
          for(MultipartFile mf : fileList) {
               try {
                   bytes = mf.getBytes();
                  // 첨부파일의 내용물을 읽어오는 것
                  
                  originalFilename = mf.getOriginalFilename();
                  
                  System.out.println("~~~~ 확인용 originalFilename => " + originalFilename); 
                  
                  newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
                  // 첨부되어진 파일을 업로드 하는 것이다.
                  
                  System.out.println(">>> 확인용  newFileName => " + newFileName); 
                  /*
                  cvo.setFileName(newFileName);
                  // WAS(톰캣)에 저장된 파일명(20230522103642842968758293800.pdf)
                  
                  cvo.setOrgFilename(originalFilename);
                  // 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
                  // 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
                  
                  fileSize = mf.getSize(); // 첨부파일의 크기(단위는 byte임)
                  cvo.setFileSize(String.valueOf(fileSize));
                  
                     // mf.transferTo(new File(newFileName));
                   */
             } catch (Exception e) {
                   e.printStackTrace();
             }
             
          }// end of for -------------------------------------
/*
          
          for(int i = 0; i < fileList.size() ; i++){
				 //원래 파일명
				 String orgFilename = fileList.get(i).getOriginalFilename();
				 //저장되는 파일이름
				 fileList.get(i).get
          }
  */        
          
          
          
    	  String other_career = "";
    	  other_career = request.getParameter("other_career");
    	  //System.out.println("other_career : " + other_career);

    	  if(other_career != "") {
			  session.setAttribute("other_career", other_career);
    	  }
    	  
          String hp1= request.getParameter("hp1");
    	  String hp2= request.getParameter("hp2");
    	  String hp3= request.getParameter("hp3");
    	  
    	  String craft_mobile = hp1 + hp2 + hp3;
    	  cvo.setCraft_mobile(craft_mobile);
    	  
    	 
          MultipartFile craft_add_file_name = imgvo.getCraft_add_file_name();

          n = service.add_withFile(cvo);
          if(n==1){
        	  return "redirect:/craft_complete.got";
          }else {
        	  return "javascript:history.go(0)";
          }
          
       } //end of if(!fileList.isEmpty())---------------------------
       
       return "javascript:history.go(0)";
       
   }
   
   
   
   // 김진솔 끝
   // ===========================================================================


   
   @RequestMapping(value="/estimate_inquiry_list.got")
   public ModelAndView getEstimateInquiryList(ModelAndView mav, HttpServletRequest request) {
      
      String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
      String craftNum = service.getCraftNumByPartnerId(partnerId);
      String str_currentShowPageNo = request.getParameter("currentShowPageNo");
      int totalCountForEstimate = 0;
      int sizePerPageForEstimate = 5;
      int currentShowPageNoForEstimate = 0;
      int totalPageForEstimate = 0;
      
      int startRno = 0;
      int endRno = 0;
      
      totalCountForEstimate = service.getTotalCountForEstimate();
      
      totalPageForEstimate = (int)Math.ceil((double)totalCountForEstimate/sizePerPageForEstimate);
      if(str_currentShowPageNo == null) {
         currentShowPageNoForEstimate = 1;
      }
      else {
         try {
            currentShowPageNoForEstimate = Integer.parseInt(str_currentShowPageNo);
            if(currentShowPageNoForEstimate < 1 || currentShowPageNoForEstimate > totalPageForEstimate) {
               currentShowPageNoForEstimate = 1;
            }
         }
         catch(NumberFormatException e) {
            currentShowPageNoForEstimate = 1;
         }
      }
      startRno = ((currentShowPageNoForEstimate - 1) * sizePerPageForEstimate) + 1;
      endRno = startRno + sizePerPageForEstimate - 1;
      
      Map<String, String> paraMap = new HashMap<String, String>();
      paraMap.put("startRno", String.valueOf(startRno));
      paraMap.put("endRno", String.valueOf(endRno));
      paraMap.put("craftNum", craftNum);
      
      OrderVO ovo = new OrderVO();
      List<OrderVO> ovoList = service.getAllOrders(paraMap);
      String pageBar = makePageBar(currentShowPageNoForEstimate, 10, totalPageForEstimate);
      
      mav.addObject("currentShowPageNo", currentShowPageNoForEstimate);
      mav.addObject("pageBar", pageBar);
      mav.addObject("ovoList", ovoList);
      mav.setViewName("/craft/estimateInquiryList.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/estimate_inquiry_list/bid.got")
   public ModelAndView bid(ModelAndView mav, HttpServletRequest request) {
	  String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
	  String craftNum = service.getCraftNumByPartnerId(partnerId);
	  String orderNum = request.getParameter("order_num");
	  HashMap<String, String> paraMap = new HashMap<String, String>();
	  paraMap.put("craft_num_fk", craftNum);
	  paraMap.put("order_num_fk", orderNum);
	  
	  int estimateExists = service.checkEstimateExists(paraMap);
	  OrderVO ovo = service.getOrderInfoByOrderNum(orderNum);
	  String currentShowPageNo = request.getParameter("currentShowPageNo");
	  
	  mav.addObject("estimateExists", estimateExists);
	  mav.addObject("currentShowPageNo", currentShowPageNo);
	  mav.addObject("orderNum", orderNum);
	  mav.addObject("ovo", ovo);
      mav.setViewName("/craft/bid.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/estimate_inquiry_list/bid_end.got", method = RequestMethod.POST)
   public ModelAndView bidEnd(ModelAndView mav, HttpServletRequest request) {
	  String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
	  String craftNum = service.getCraftNumByPartnerId(partnerId);
	  HashMap<String, String> paraMap = new HashMap<String, String>();
	  String proposalDuration = request.getParameter("proposalDuration");
	  String proposalPrice = request.getParameter("proposalPrice");
	  String orderNum =  request.getParameter("orderNum");
	  
	  paraMap.put("order_num_fk", orderNum);
	  paraMap.put("craft_num_fk", craftNum);
	  paraMap.put("estimate_price", proposalPrice);
	  paraMap.put("estimate_period", proposalDuration);
	  
	  int n = service.insertEstimate(paraMap);
	  if(n == 1) {
		  String message = "정상적으로 견적 제안이 완료되었습니다.";
		  String loc = "/gotgongbang/estimate_inquiry_list.got";
	      request.setAttribute("message", message);
	      request.setAttribute("loc", loc);
	  }
	  else {
		  String message = "오류가 발생하여 제안이 완료되지 못했습니다";
		  String loc = "javascript:history.go(0);";
	      request.setAttribute("message", message);
	      request.setAttribute("loc", loc);
	  }
	  
	  mav.setViewName("msg");
	  return mav;
   }
   
   @RequestMapping(value="/repair_history_list.got")
   public ModelAndView repairHistoryList(ModelAndView mav, HttpServletRequest request) {
	  String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
	  String craftNum = service.getCraftNumByPartnerId(partnerId);
	  String str_currentShowPageNo = request.getParameter("currentShowPageNo");
      int totalCountForRepariList = 0;
      int sizePerPageRepariList = 5;
      int currentShowPageNoForRepariList = 0;
      int totalPageRepariList = 0;
      
      int startRno = 0;
      int endRno = 0;
      
      totalCountForRepariList = service.getTotalCountForRepairList(craftNum);
      System.out.println("totalCountForRepariList : "+ totalCountForRepariList );
      totalPageRepariList = (int)Math.ceil((double)totalCountForRepariList/sizePerPageRepariList);
      if(str_currentShowPageNo == null) {
    	  currentShowPageNoForRepariList = 1;
      }
      else {
         try {
        	 currentShowPageNoForRepariList = Integer.parseInt(str_currentShowPageNo);
            if(currentShowPageNoForRepariList < 1 || currentShowPageNoForRepariList > totalPageRepariList) {
            	currentShowPageNoForRepariList = 1;
            }
         }
         catch(NumberFormatException e) {
        	 currentShowPageNoForRepariList = 1;
         }
      }
      startRno = ((currentShowPageNoForRepariList - 1) * sizePerPageRepariList) + 1;
      endRno = startRno + sizePerPageRepariList - 1;
      
      HashMap<String, String> paraMap = new HashMap<String, String>();
      paraMap.put("startRno", String.valueOf(startRno));
      paraMap.put("endRno", String.valueOf(endRno));
      paraMap.put("craftNum", craftNum);
	  
	  List<HashMap<String, String>> paraMapList = service.getRepariListBycraftNum(paraMap);
	  
      String pageBar = makePageBar(currentShowPageNoForRepariList, 10, totalPageRepariList);
      
      mav.addObject("currentShowPageNo", currentShowPageNoForRepariList);
      mav.addObject("pageBar", pageBar);
	  mav.addObject("paraMapList", paraMapList); 
      mav.setViewName("/craft/repairHistoryList.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/edit_craft_user_info.got")
   public ModelAndView editCraftInfo(ModelAndView mav) {
      
      String userid = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
      
      PartnerVO pvo = new PartnerVO();
      pvo = service.getPartnerInfoByUserId(userid);
      mav.addObject("pvo", pvo);
      mav.setViewName("/craft/editCraftUserInfo.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/edit_craft_user_info_end.got")
   public ModelAndView editCraftInfoEnd(ModelAndView mav, HttpServletRequest request, PartnerVO pvo) {
      
      int n = 0;
      n = service.updatePartnerInfo(pvo);
      
      if(pvo.getPartner_pwd() != null && pvo.getPartner_pwd() != "") {
         n = service.updatePartnerPwd(pvo);
      }
      String message = "";
      String loc = "";
      
      if (n == 1) {
         message = "정상적으로 변경되었습니다.";
         loc = request.getContextPath()+"/index.got";
      }
      
      else {
         message = "오류가 발생했습니다";
         loc ="javascript:history.back();";
      }

      request.setAttribute("message", message);
      request.setAttribute("loc", loc);
      mav.setViewName("msg");
      return mav;
   }
   
   @ResponseBody
   @RequestMapping(value="/update_craft_user_pwd.got", method = {RequestMethod.POST})
   public String updateCraftUserPwd(HttpServletRequest request) {
	  String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것 
	  String editPw = request.getParameter("editPw"); 
	  
	  PartnerVO pvo = new PartnerVO();
      pvo = service.getPartnerInfoByUserId(partnerId);
      int n = 0;

      if(editPw.equals(pvo.getPartner_pwd())) {
    	  n = 2;
    	  
      }
      else {
          n = service.updatePartnerPwd(pvo);
      }
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);
	  return jsonObj.toString();
   }
   
   @ResponseBody
   @RequestMapping(value="/check_insert_craftPwd.got", method = {RequestMethod.POST})
   public String checkInsertCraftPw(HttpServletRequest request) {
		String partnerId = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것 
		String insertPwd = request.getParameter("insertPwd");
		
		PartnerVO pvo = new PartnerVO();
      	pvo = service.getPartnerInfoByUserId(partnerId);
	    int n = 0;

	    if(insertPwd.equals(pvo.getPartner_pwd())) {
	    	n = 1;
	    }
	    
	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("n", n);
	    return jsonObj.toString();
   }
 
   public String makePageBar(int currentShowPageNo, int blockSize, int totalPage) {
      int loop = 1;
      int startPageNo = ((currentShowPageNo-1)/blockSize)*blockSize+1;
      
      String pageBar = "<ul class='pageBar'>";
      String url = "estimate_inquiry_list.got";
      
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
   
   
   // 박준엽 끝
   // ===========================================================================

   // 오준혁 시작
   // ===========================================================================
   // 오준혁 끝
   // ===========================================================================

   // 이지현 시작
   // ===========================================================================
   // 이지현 끝
   // ===========================================================================

   // 홍용훈 시작
   // ===========================================================================
   // 홍용훈 끝
   // ===========================================================================
}