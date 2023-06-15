package com.spring.gotgongbang.craft.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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
import com.spring.gotgongbang.common.MyUtil;
import com.spring.gotgongbang.common.Sha256;
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
    
    @Autowired
    private MyUtil myUtil;
      
   

	// 김나윤 시작
	// ===========================================================================
    
 // 공방상세페이지에 DB정보 넘겨주기
 	@RequestMapping(value="/crafts_detail.got")
 	public ModelAndView craftDetail(ModelAndView mav, HttpServletRequest request) {
 	   
 		int craft_num_pk = Integer.parseInt(request.getParameter("craft_num_pk"));
// 	    System.out.println("craft_num_pk = "+craft_num_pk);
// 	    List<String> : 공방명만 여러개 
// 	    List<CraftVO> : 여러개의 공방정보 데리고
 		
        
 		CraftVO craftvo = service.craftDetail(craft_num_pk);   //where절에서 필요한 데이터만 골라오기 위해 craft_num_pk 파라미터로 넣어준다.
 		
 		//공방상세페이지 후기정보 가져오기
 		List<Map<String, Object>> paraMap = service.review_select(craft_num_pk);
 		//System.out.println(paraMap.get("review_content"));
 		
 		mav.setViewName("/craft/craft_detail.tiles1");
 		mav.addObject("craftvo", craftvo);  //mav 안에 craftvo 넣어주기
 		mav.addObject("reviews",paraMap);	//paraMap이라는 데이터를 jsp에 넘겨서 사용할 때 review라고 부르겠다.
       
//       System.out.println(mav);
       
 		return mav;
 	}
    
    
 	// 수선사페이지에서 "가방 자세히 보기" 페이지 보여주기
 	@RequestMapping(value="/crafts_list_10bag.got")
 	public ModelAndView craftList_10bag(ModelAndView mav) {
 	   
 		List<CraftVO> craftsList = null;
 	      
 		craftsList = service.crafts_list_select();
 	      
 		mav.addObject("craftsList", craftsList);
 		mav.setViewName("/craft/craft_list_10bag.tiles1");
 		
 		return mav;
 	}
    
 	
 	// 수선사페이지에서 "신발 자세히 보기" 페이지 보여주기
 	@RequestMapping(value="/crafts_list_20shoes.got")
 	public ModelAndView craftList_20shoes(ModelAndView mav) {
 	   
 	   List<CraftVO> craftsList = null;
 	      
 	   craftsList = service.crafts_list_select();
 	   
 	   mav.addObject("craftsList", craftsList);
 	   mav.setViewName("/craft/craft_list_20shoes.tiles1");
 	   
 	   return mav;
 	}
    
 	
 	// 수선사페이지에서 "지갑/벨트 자세히 보기" 페이지 보여주기
 	@RequestMapping(value="/crafts_list_30wallet.got")
 	public ModelAndView craftList_30wallet(ModelAndView mav) {
 	   
 		List<CraftVO> craftsList = null;
 	      
 		craftsList = service.crafts_list_select();
 	   
 		mav.addObject("craftsList", craftsList);
 		mav.setViewName("/craft/craft_list_30wallet.tiles1");
 		
 		return mav;
 	}
    
 	
 	// 수선사페이지에서 "의류 자세히 보기" 페이지 보여주기
 	@RequestMapping(value="/crafts_list_40cloth.got")
 	public ModelAndView craftList_40cloth(ModelAndView mav) {
 	   
 		List<CraftVO> craftsList = null;
 	      
 		craftsList = service.crafts_list_select();
 	   
 		mav.addObject("craftsList", craftsList);
 		mav.setViewName("/craft/craft_list_40cloth.tiles1");
 		
 		return mav;
 	}
    
 	
 	// 수선사찾기 페이지 첫 화면 보여주기
 	@RequestMapping(value="/crafts_list.got")
 	public ModelAndView crafts_list_select(ModelAndView mav, HttpServletRequest request) {
       
 		List<CraftVO> craftsList = null;  //수선사 정보 DB 받아오기용
 		List<CraftVO> craftsNewList = null;  //신규입점수선사 띄우기용
 		List<CraftVO> craftsSumList = null;  //수선품목별 간단히 보기 목록 띄우기용
       
 		craftsList = service.crafts_list_select();  //수선사 정보 DB 받아오기
 		craftsNewList = service.crafts_new_select();  //신규입점수선사 띄우기
 		craftsSumList = service.crafts_sum_select();  //수선품목별 간단히 보기 목록 띄우기용
       
       
       /*
 		for(int i = 0; i< craftsNewList.size(); i++) {
 			System.out.println(craftsNewList.get(i).getCraft_name());
 			System.out.println(craftsNewList.get(i).getCraft_Introduce());
 		}
       */
       
//       System.out.println(craftsNewList);
       
       
 		mav.addObject("craftsList", craftsList);
 		mav.addObject("craftsNewList", craftsNewList);
 		mav.addObject("craftsSumList", craftsSumList);
 		mav.setViewName("/craft/craft_list.tiles1");   //뷰단 지정
       
 		return mav;  //craft_list.jsp 로 List가 전달된다.
       
 	}
 	
 	
 	
 	// 수선사찾기 페이지에서 공방명/품목으로 공방정보 검색하기
 	@ResponseBody
 	@RequestMapping(value="/wordSearchShow.got", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
 	public String wordSearchShow(HttpServletRequest request) {
 		
 		String searchType = request.getParameter("searchType");
 		String searchWord = request.getParameter("searchWord");
 		System.out.println("searchType = "+searchType);
 		System.out.println("searchWord = "+searchWord);
 		
 		Map<String, String> paraMap = new HashMap<String, String>();  //map에 담아서 넘겨준다.
 		paraMap.put("searchType", searchType);
 		paraMap.put("searchWord", searchWord);
 		
 		// 검색정보를 가지고 공방정보 가져오기
 		List<CraftVO> craftvo_list= service.wordSearchShow(paraMap);  //map을 보내어준다.
 		
// 		System.out.println("공방정보 =" +craftvo_list.get(0).getCraft_name());
 		
 		JSONArray jsonArr = new JSONArray();
 		
 		if(craftvo_list != null) {
 			for(CraftVO craftvo : craftvo_list) {  //craftvo_list : list개수만큼 반복문 돌리기 , CraftVO craftvo : CraftVO 안에 있는 애들을 하나씩 꺼내오는데 그 이름을 craftvo로!
 				JSONObject jsonObj = new JSONObject();
 				jsonObj.put("craft_name", craftvo.getCraft_name());
 				jsonObj.put("craft_Introduce", craftvo.getCraft_Introduce());
 				jsonObj.put("craft_representative", craftvo.getCraft_representative());
 				jsonObj.put("craft_num_pk", craftvo.getCraft_num_pk()); 
 			//	System.out.println("craftvo.getCraft_num_pk() "+craftvo.getCraft_num_pk());
 				
 				jsonArr.put(jsonObj);
 			}
 		}
 		
 		return jsonArr.toString();
 	}
   
   
   
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
   public ModelAndView craft_application_end(ModelAndView mav, CraftVO cvo, ImageVO imgvo,  MemberVO membervo, MultipartHttpServletRequest mrequest, HttpServletRequest request , HttpServletResponse response) { 

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
 	     String root = session.getServletContext().getRealPath("/").substring(0, 3);
         //System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root); 

 	     String path_whole = root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"craft";
 	     //System.out.println("~~~~ 확인용 path => " + path_whole);
         
         String newFileName = "";
         // WAS(톰캣)의 디스크에 저장될 파일명
         // 2381899872914.png
         
         String originalFilename = "";
         // 강아지.png, 고양이.png, 판다.png
         
         byte[] bytes = null;
          // 첨부파일의 내용물을 담는 것
         
         for(MultipartFile mf : fileList) {
               try {
                  bytes = mf.getBytes();
                  
                  originalFilename += ("," + mf.getOriginalFilename());
                  
                  newFileName += ("," + fileManager.doFileUpload(bytes, originalFilename, path_whole));

             } catch (Exception e) {
                   e.printStackTrace();
             }
             
          }// end of for -------------------------------------

          String originalFilename_ss = originalFilename.substring(1);
          String newFileName_ss = newFileName.substring(1);
        
          // 기타 경력사항이 있는 경우 세션에 저장(하고 뷰단에서 세션 remove)
    	  String other_career = "";
    	  other_career = request.getParameter("other_career");

    	  if(other_career != "") {
			  session.setAttribute("other_career", other_career);
    	  }
    	  
    	  
    	  //===================================//
    	  // 연락처(mobile) 합체~~!
          String hp1= request.getParameter("hp1");
    	  String hp2= request.getParameter("hp2");
    	  String hp3= request.getParameter("hp3");
    	  
    	  String craft_mobile = hp1 + hp2 + hp3;
    	  cvo.setCraft_mobile(craft_mobile);
    	  //===================================//
    	  
    	  String partner_id_pk = (String) session.getAttribute("partner_id_pk");
    	  
    	  cvo.setPartner_id_fk(partner_id_pk);
    	  
    	  
    	  
    	  cvo.setFileName(newFileName_ss);
    	  cvo.setOrgFilename(originalFilename_ss);

          n = service.add_withFile(cvo);
          if(n==1) {
        	  mav.addObject("message","공방 정보 등록 성공");	
        	  mav.addObject("loc", request.getContextPath()+"/end_register_partner.got");
              
          }else {
        	  mav.addObject("message","공방 정보 등록 실패");	
        	  mav.addObject("loc","javascipt:history.back()");	
   		   }
          
       } //end of if(!fileList.isEmpty())---------------------------
       mav.setViewName("msg");
   	
       return mav;
   }
   
   
   //공방 신청시 '취소' 누르면  공방회원정보를 db에서 삭제하고 회원가입으로 이동
   @RequestMapping(value = "/craft_reset.got")     
   public ModelAndView craft_reset(ModelAndView mav, PartnerVO pvo, HttpServletRequest request) {

 	  HttpSession session = request.getSession();
	  String partner_id_pk = (String) session.getAttribute("partner_id_pk");
	  //System.out.println("partner_id_pk" + partner_id_pk);
	  
	  pvo.setPartner_id_pk(partner_id_pk);
	  
 	  int m = service.del_partner(pvo);
	  
 	  //System.out.println("m : "+m);
		 if(m==1) {
		  mav.addObject("message","공방 정보 등록 취소");	
		  mav.addObject("loc", request.getContextPath()+"/register_member_first.got");
		     
		 }else {
		  mav.addObject("message","오류입니다.");	
		  mav.addObject("loc","javascipt:history.back()");	
			   }
		     
		  mav.setViewName("msg");
			
	  return mav;
   }
   
   // 김진솔 끝
   // ===========================================================================

   // 박준엽 시작
   // ===========================================================================
   
   @RequestMapping(value="/estimate_inquiry_list.got")
   public ModelAndView requiredLogin_getEstimateInquiryList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	  HttpSession session = request.getSession();
	  PartnerVO loginuser = (PartnerVO) session.getAttribute("loginpartner");
      String partnerId = loginuser.getPartner_id_pk();
      
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
      
      String url = "estimate_inquiry_list.got";
      String pageBar = myUtil.makePageBar(currentShowPageNoForEstimate, 10, totalPageForEstimate, url);
      
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
   public ModelAndView requiredLogin_repairHistoryList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	  HttpSession session = request.getSession();
	  PartnerVO loginuser = (PartnerVO) session.getAttribute("loginpartner");
      String partnerId = loginuser.getPartner_id_pk();
	  String craftNum = service.getCraftNumByPartnerId(partnerId);
	  String str_currentShowPageNo = request.getParameter("currentShowPageNo");
      int totalCountForRepariList = 0;
      int sizePerPageRepariList = 5;
      int currentShowPageNoForRepariList = 0;
      int totalPageRepariList = 0;
      
      int startRno = 0;
      int endRno = 0;
      
      totalCountForRepariList = service.getTotalCountForRepairList(craftNum);
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
	  
	  String url = "repair_history_list.got";
      String pageBar = myUtil.makePageBar(currentShowPageNoForRepariList, 10, totalPageRepariList, url);
  
      mav.addObject("currentShowPageNo", currentShowPageNoForRepariList);
      mav.addObject("pageBar", pageBar);
	  mav.addObject("paraMapList", paraMapList); 
      mav.setViewName("/craft/repairHistoryList.tiles1");
      return mav;
   }
   
   @RequestMapping(value="/edit_craft_user_info.got")
   public ModelAndView requiredLogin_editCraftInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	  HttpSession session = request.getSession();
	  PartnerVO loginpartner = (PartnerVO) session.getAttribute("loginpartner");
	  String userid = loginpartner.getPartner_id_pk(); 	   
      
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
		HttpSession session = request.getSession();
		PartnerVO loginpartner = (PartnerVO) session.getAttribute("loginpartner");
		String partnerId = loginpartner.getPartner_id_pk(); 	   
		String editPw = request.getParameter("editPw");
		String encryptEditPw = Sha256.encrypt(editPw);
		PartnerVO pvo = new PartnerVO();
      	pvo = service.getPartnerInfoByUserId(partnerId);
	    int n = 0;
	    if(encryptEditPw.equals(pvo.getPartner_pwd())) {
	    	n = 2;
	    }
		else {
			pvo.setPartner_pwd(editPw);
			n = service.updatePartnerPwd(pvo);
		}
	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("n", n);
	    return jsonObj.toString();
   }
   
	@ResponseBody
	@RequestMapping(value="/check_origin_partner_pwd.got", method = {RequestMethod.POST})
	public String checkOriginPartnerPwd(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		HttpSession session = request.getSession();
		PartnerVO loginpartner = (PartnerVO) session.getAttribute("loginpartner");
		String partnerId = loginpartner.getPartner_id_pk();
		
		PartnerVO pvo = new PartnerVO();
	    pvo = service.getPartnerInfoByUserId(partnerId);
		
		String insertPwd = request.getParameter("insertPWD");
		String encrytInsertPwd = Sha256.encrypt(insertPwd);
		
		int n = 0;
		if(encrytInsertPwd.equals(pvo.getPartner_pwd())) {
			n = 1; 
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		return jsonObj.toString();
	}
   
   @ResponseBody
   @RequestMapping(value="/update_state.got", method= {RequestMethod.POST})
   public String updateStateByOrderNum(HttpServletRequest request) {
	   String orderNum = request.getParameter("orderNum");
	   String state = request.getParameter("state");
	   
	   HashMap<String, String> paraMap = new HashMap<String, String>();
	   paraMap.put("orderNum", orderNum);
	   paraMap.put("state", state);
	   
	   int n = service.updateStateByOrderNum(paraMap);
	    
	   JSONObject jsonObj = new JSONObject();
	   jsonObj.put("n", n);
	   return jsonObj.toString();
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