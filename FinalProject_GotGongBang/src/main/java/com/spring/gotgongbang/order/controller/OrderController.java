package com.spring.gotgongbang.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.order.model.TypesVO;
import com.spring.gotgongbang.order.service.InterOrderService;

@Component
@Controller
public class OrderController {
	
	@Autowired	// Type에 따라 알아서 Bean을 주입해준다.
	private InterOrderService service;
	
	// === #155. 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) ===  
		@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
		private FileManager fileManager;
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
	public ModelAndView orderForm(ModelAndView mav,HttpServletRequest request) {
		
		List<TypesVO> typesList = service.select_types();
		
		request.setAttribute("typesList", typesList);
		
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
	
	@RequestMapping(value = "/choiceGongbang.got")
	public ModelAndView choiceGongbang(ModelAndView mav) {
		mav.setViewName("order/choiceGongbang.tiles1");
		return mav;
	}
	
	@RequestMapping(value = "/selectReq.got")
	public ModelAndView selectReq(ModelAndView mav) {
		mav.setViewName("/none_tiles/order/selectReq");
		return mav;
	}
	// 이지현 끝 ===========================================================================

	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
