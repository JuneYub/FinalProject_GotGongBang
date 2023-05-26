package com.spring.gotgongbang.craft.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CraftController {
	// 김나윤 시작
	// ===========================================================================
	@RequestMapping(value="/craft_detail.got")
	public ModelAndView craftDetail(ModelAndView mav) {
		mav.setViewName("/craft/craft_detail.tiles1");
		return mav;
	}
	
	@RequestMapping(value="/craft_list.got")
	public ModelAndView craftList(ModelAndView mav) {
		mav.setViewName("/craft/craft_list.tiles1");
		return mav;
	}
	
	@RequestMapping(value="/craft_listDetail.got")
	public ModelAndView craftListDetail(ModelAndView mav) {
		mav.setViewName("/craft/craft_listDetail.tiles1");
		return mav;
	}
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
