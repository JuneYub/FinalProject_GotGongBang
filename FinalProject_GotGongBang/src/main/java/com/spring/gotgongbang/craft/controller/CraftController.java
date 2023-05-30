package com.spring.gotgongbang.craft.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.craft.service.InterCraftService;

@Controller
public class CraftController {
	

	@Autowired			//spring이 알아서 type에 따라서 bean을 주입해준다.
	private InterCraftService service;
	

    @Autowired   
    private FileManager fileManager;
	   
	

	// 김나윤 시작
	// ===========================================================================
	@RequestMapping(value="/crafts_detail.got")
	public ModelAndView craftDetail(ModelAndView mav) {
		mav.setViewName("/craft/craft_detail.tiles1");
		return mav;
	}
	
	@RequestMapping(value="/crafts_list.got")
	public ModelAndView craftList(ModelAndView mav) {
		mav.setViewName("/craft/craft_list.tiles1");
		return mav;
	}
	
	@RequestMapping(value="/crafts_listDetail.got")
	public ModelAndView craftListDetail(ModelAndView mav) {
		mav.setViewName("/craft/craft_listDetail.tiles1");
		return mav;
	}
	
	
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
//		console.log(jsonArr);
		mav.setViewName("/craft/craft_list.tiles1");
		return mav;
	}
*/	
	
	
	
	
	
	// 김나윤 끝
	// ===========================================================================

	
	
	
	
	

	
	
	// 김진솔 시작
	// ===========================================================================
	
	@RequestMapping(value = "/craft_agree.got")		//공방 약관동의
	public ModelAndView craftAgree(ModelAndView mav) {
		mav.setViewName("craft/craftAgree.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/craft_application.got")	//공방 신청
	public ModelAndView craftApplication(ModelAndView mav) {
		mav.setViewName("craft/craftApplication.tiles1");
		return mav;
	}

	@RequestMapping(value = "/craft_complete.got")		//신청 완료 페이지
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
	

	
	
	
	
	
	
	
	
	
	
	// 김진솔 끝
	// ===========================================================================

	
	
	
	// 박준엽 시작
	// ===========================================================================

	
	@RequestMapping(value="/estimate_inquiry_list.got")
	public ModelAndView getEstimateInquiryList(ModelAndView mav) {
		mav.setViewName("/craft/estimateInquiryList.tiles1");
		return mav;
	}
	
	@RequestMapping(value="/estimate_inquiry_list/bid.got")
	public ModelAndView bid(ModelAndView mav) {
		mav.setViewName("/none_tiles/craft/bid");
		return mav;
	}
	
	@RequestMapping(value="/repair_history_list.got")
	public ModelAndView repairHistoryList(ModelAndView mav) {
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
