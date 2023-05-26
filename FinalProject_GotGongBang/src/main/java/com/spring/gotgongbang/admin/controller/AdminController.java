package com.spring.gotgongbang.admin.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class AdminController {

	// 김진솔 시작
	// ===========================================================================

	@RequestMapping(value = "/craft_agree.got")
	public ModelAndView craftAgree(ModelAndView mav) {
		mav.setViewName("admin/craftAgree.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/craft_application.got")
	public ModelAndView craftApplication(ModelAndView mav) {
		mav.setViewName("admin/craftApplication.tiles1");
		return mav;
	}

	@RequestMapping(value = "/craft_complete.got")
	public ModelAndView craftComplete(ModelAndView mav) {
		mav.setViewName("admin/craftComplete.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/craft_list.got")
	public ModelAndView craftList(ModelAndView mav) {
		mav.setViewName("admin/craftList.tiles1");
		return mav;
	}
	

	@RequestMapping(value = "/craft_view.got")
	public ModelAndView craftView(ModelAndView mav) {
		mav.setViewName("admin/craftView.tiles1");
		return mav;
	}
	// 김진솔 끝
	// ===========================================================================

	

	// 김나윤 시작
	// ===========================================================================
	// 김나윤 끝
	// ===========================================================================

	// 박준엽 시작
	// ===========================================================================

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
