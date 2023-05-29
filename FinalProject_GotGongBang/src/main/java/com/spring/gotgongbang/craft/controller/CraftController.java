package com.spring.gotgongbang.craft.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.craft.service.InterCraftService;

@Controller
public class CraftController {
	
	@Autowired
	private InterCraftService service;
	
	// 김나윤 시작
	// ===========================================================================
	// 김나윤 끝
	// ===========================================================================

	// 김진솔 시작
	// ===========================================================================

	@RequestMapping(value = "/craft_agree.got")
	public ModelAndView craftAgree(ModelAndView mav) {
		mav.setViewName("craft/craftAgree.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/craft_application.got")
	public ModelAndView craftApplication(ModelAndView mav) {
		mav.setViewName("craft/craftApplication.tiles1");
		return mav;
	}

	@RequestMapping(value = "/craft_complete.got")
	public ModelAndView craftComplete(ModelAndView mav) {
		mav.setViewName("craft/craftComplete.tiles1");
		return mav;
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
		
		String userid = "test1234"; // 현재는 테스트 계저으로 로그인 이후에 세션 값으로 수정할 것
		
		PartnerVO pvo = new PartnerVO();
		pvo = service.getPartnerInfoByUserId(userid);
		
		mav.addObject("pvo", pvo);
		mav.setViewName("/craft/editCraftUserInfo.tiles1");
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
