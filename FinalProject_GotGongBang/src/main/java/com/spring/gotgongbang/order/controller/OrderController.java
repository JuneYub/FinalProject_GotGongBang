package com.spring.gotgongbang.order.controller;

import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.spring.gotgongbang.member.model.MemberVO;
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
	public ModelAndView selectReq(ModelAndView mav, HttpServletRequest request) {
		
		
		//System.out.println("type_code_pk"+type_code_pk);
		//System.out.println("brand_name"+brand_name);
		
		mav.setViewName("/none_tiles/order/selectReq");
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/modal_prac.got")
	public ModelAndView modal_prac(ModelAndView mav) {
		
		mav.setViewName("/order/modal_prac.tiles1");
		return mav;
	}

	
	
	
	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/bring_request_list.got", method= {RequestMethod.POST},produces="text/plain;charset=UTF-8")
	public String bring_request_list(TypesVO typevo, HttpServletRequest request) {
		
		
		String type_code_pk = request.getParameter("type_code_pk");
		
		List<TypesVO> requestList = service.bring_request_list(type_code_pk);
		
		JSONArray jsonArr = new JSONArray();	//[]
		
		// 넘어온 댓글이 있으면
		if(requestList != null) {
			for(TypesVO tvo : requestList) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("detail_type_pk", tvo.getDetail_type_pk());
				jsonObj.put("type_code_pk", tvo.getType_code_pk());
				jsonObj.put("detail_type_name", tvo.getDetail_type_name());
				
				jsonArr.put(jsonObj);
			}// for
		}//if
		
		
		return jsonArr.toString();
	}
	
	
	// 폼 작성하기
	@RequestMapping(value="/order_form.got", method= {RequestMethod.POST})
	public ModelAndView order_form(ModelAndView mav, HttpServletRequest request) {
		
		
		String type_code_pk = request.getParameter("type_code_pk"); 			// 품목 : type_code_pk
		String brand_name = request.getParameter("brand_name");					//브랜드 : brand_name
		String img_whole_name = request.getParameter("img_whole_name");					//전체사진 : img_whole
		String img_detail_name = request.getParameter("img_detail_name");					//상세사진 : img_detail
		String reqest_list = request.getParameter("reqest_list");				//수선요청사항:reqest_list
		String req_textarea = request.getParameter("req_textarea");				//수선요청사항설명:req_textarea
		/*
		    type_code_pk = 30
			brand_name = ㄷㄹㄷㄹ
			img_whole_name = 1_품목.PNG,2_브랜드.PNG
			img_detail_name = 1_품목.PNG,4_상세.PNG
			reqest_list = 30,31,32
			req_textarea = ㄷㄹㄷㄹㄴㄴㄴㄴ
		 */
		
		HttpSession session = request.getSession();
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		
		
		Map<String,String> mapOrder = new HashMap<String, String>();
		mapOrder.put("user_id_fk", loginuser.getUser_id_pk());
		mapOrder.put("brand_name", brand_name);
		mapOrder.put("request_explain", req_textarea);
		mapOrder.put("requests", reqest_list);
		mapOrder.put("order_product_type", type_code_pk);
		mapOrder.put("orderer", loginuser.getName());
		
		//private int order_num_pk;		// 견적요청번호 

		int n1 = service.insert_order(mapOrder);
		
		if(n1 == 1) {
			
		}
		
		
		mav.setViewName("index/home.tiles1");
		return mav;
	}
	

	// 이지현 끝 ===========================================================================

	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
