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

	@RequestMapping(value = "/adminAgree.got")
	public ModelAndView adminAgree(ModelAndView mav) {
		mav.setViewName("admin/agree.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/adminApplication.got")
	public ModelAndView adminApplication(ModelAndView mav) {
		mav.setViewName("admin/application.tiles1");
		return mav;
	}

	@RequestMapping(value = "/adminComplete.got")
	public ModelAndView adminComplete(ModelAndView mav) {
		mav.setViewName("admin/complete.tiles1");
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
