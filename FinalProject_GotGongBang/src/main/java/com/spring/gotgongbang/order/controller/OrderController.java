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
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
		
		
		HttpSession session = request.getSession();
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser==null) {
			
		}
		else {
			
		}
		
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
	

   // 즉, 2개이상의 DML 처리를 해야하므로 Transaction 처리를 해야 한다. (여기서는 3개의 DML 처리가 일어남)
   // >>>>> 트랜잭션처리를 해야할 메소드에 @Transactional 어노테이션을 설정하면 된다. 
   // rollbackFor={Throwable.class} 은 롤백을 해야할 범위를 말하는데 Throwable.class 은 error 및 exception 을 포함한 최상위 루트이다. 
   // 즉, 해당 메소드 실행시 발생하는 모든 error 및 exception 에 대해서 롤백을 하겠다는 말이다.

	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor= {Throwable.class})
	@RequestMapping(value="/order_form.got", method= {RequestMethod.POST})
	public ModelAndView order_form(ModelAndView mav, HttpServletRequest request) {
		
		
		String type_code_pk = request.getParameter("type_code_pk"); 			// 품목번호 : type_code_pk
		String order_product_type = request.getParameter("order_product_type"); // 품목이름 : order_product_type
		String brand_name = request.getParameter("brand_name");					//브랜드 : brand_name
		String img_whole_name = request.getParameter("img_whole_name");			//전체사진 : img_whole
		String img_detail_name = request.getParameter("img_detail_name");		//상세사진 : img_detail
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
		mapOrder.put("order_product_type", order_product_type);
		mapOrder.put("orderer", loginuser.getName());
		
		//private int order_num_pk;		// 견적요청번호 

		// 견적 요청 넣기
		int n1 = service.insert_order(mapOrder);
		
		if(n1 == 1) {
			
			int order_num_pk = service.select_order_num_pk(mapOrder);
			// 주문번호 갖고오기
			
			String[] arr_img_whole_name = img_whole_name.split("\\,");
			String[] arr_img_detail_name = img_detail_name.split("\\,");
			
			Map<String,Object> whole_map = new HashMap<String, Object>();
			// 전체 사진 
			
			Map<String,Object> detail_map = new HashMap<String, Object>();
			// 상세 사진 
			
			int[] whole_num = {-1,-1,-1};
			int[] detail_num = {-1,-1,-1};
			
			if (order_num_pk != 0) {
				
				whole_map.put("whole_img_num_pk",order_num_pk);
				detail_map.put("detail_img_num_pk",order_num_pk);
				
				// 전체 사진
				for(int i =0; i<arr_img_whole_name.length;i++) {
					
					String whole_img_name = arr_img_whole_name[i];
					whole_map.put("whole_img_name",whole_img_name);
					
					whole_num[i] = service.insert_whole_img(whole_map);
					// 전체 사진 반복문으로 추가하기
					
					whole_map.remove("whole_img_name");
				}
				
				// 부분사진
				for(int i =0; i<arr_img_detail_name.length;i++) {
					
					String detail_img_name = arr_img_detail_name[i];
					detail_map.put("detail_img_name",detail_img_name);
					
					detail_num[i] = service.insert_detail_img(detail_map);
					// 상세 사진 반복문으로 추가하기
					
					detail_map.remove("detail_img_name");
				}
				
				
				// 오류없이 사진들 잘 넣었으면
				if(whole_num[0]!=0 && whole_num[1]!=0 &&whole_num[2]!=0 &&
						detail_num[0]!=0 &&detail_num[1]!=0 &&detail_num[2]!=0 ){
					
					// 수선 요청사항 리스트에 넣기
					String[] arr_reqest_list = reqest_list.split("\\,");
					
					Map<String,Integer> request_list_map = new HashMap<String, Integer>();
					// 요청사항 목록들
					
					request_list_map.put("order_num_fk", order_num_pk);
					
					int[] request_list_num = {-1,-1,-1};
					
					// 요청사항 목록들 추가하기
					for(int i =0; i<arr_reqest_list.length;i++) {
						
						int detail_type_fk = Integer.parseInt(arr_reqest_list[i]) ;
						request_list_map.put("detail_type_fk",detail_type_fk);
						
						request_list_num[i] = service.insert_detail_request_list(request_list_map);
						// 요청사항 목록들 반복문으로 추가하기
						
						request_list_map.remove("detail_type_fk");
					}
				}
				
			}
			else {
				
			}
			
			
			
		}
		else {
			
		}
		
		
		mav.setViewName("index/home.tiles1");
		return mav;
	}
	

	// 이지현 끝 ===========================================================================

	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
