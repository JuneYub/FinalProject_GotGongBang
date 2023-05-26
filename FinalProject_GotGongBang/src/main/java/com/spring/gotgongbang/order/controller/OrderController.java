package com.spring.gotgongbang.order.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class OrderController {
	// 김나윤 시작 ===========================================================================
	// 김나윤 끝 ===========================================================================
	
	// 김진솔 시작 ===========================================================================
	// 김진솔 끝 ===========================================================================
	
	// 박준엽 시작 ===========================================================================
	// 박준엽 끝 ===========================================================================
	
	// 오준혁 시작 ===========================================================================
	// 오준혁 끝 ===========================================================================
	
	// 이지현 시작 ===========================================================================
	@RequestMapping(value = "/buyResult.got")
	public ModelAndView buyResult(ModelAndView mav) {
		mav.setViewName("order/buyResult.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/orderDetail.got")
	public ModelAndView orderDetail(ModelAndView mav) {
		mav.setViewName("order/orderDetail.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/orderForm.got")
	public ModelAndView orderForm(ModelAndView mav) {
		mav.setViewName("order/orderForm.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/orderList.got")
	public ModelAndView orderList(ModelAndView mav) {
		mav.setViewName("order/orderList.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/payment.got")
	public ModelAndView payment(ModelAndView mav) {
		mav.setViewName("order/payment.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/selectGongbang.got")
	public ModelAndView selectGongbang(ModelAndView mav) {
		mav.setViewName("order/selectGongbang.tiles1");
		return mav;
	}
	// 이지현 끝 ===========================================================================
	
	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
