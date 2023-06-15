package com.spring.gotgongbang.index.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.index.service.InterIndexService;
import com.spring.gotgongbang.member.model.ReviewVO;

@Component
@Controller
public class IndexController {
	
	@Autowired
	private InterIndexService service;
	
	// 김나윤 시작
	// ===========================================================================
	// 김나윤 끝
	// ===========================================================================

	// 김진솔 시작
	// ===========================================================================
	// 김진솔 끝
	// ===========================================================================

	// 박준엽 시작
	// ===========================================================================
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("redirect:/index.got");
		return mav;
	}

	@RequestMapping(value = "/index.got")
	public ModelAndView index(ModelAndView mav) {
		List<CraftVO> craftList = service.getlatestCraftList();
		List<HashMap<String, Object>> reviewList = service.getReviewList();
		mav.addObject("craftList", craftList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("index/home.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/service_info.got")
	public ModelAndView serviceInfo(ModelAndView mav) {
		mav.setViewName("index/serviceInfo.tiles1");
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
