package com.spring.gotgongbang.order.controller;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.OrderDetailVO;
import com.spring.gotgongbang.order.model.TypesVO;
import com.spring.gotgongbang.order.model.WholeImgVO;
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

	

	
	
	@RequestMapping(value = "/orderForm.got")
	public ModelAndView requiredLogin_orderForm(HttpServletRequest request, HttpServletResponse response,ModelAndView mav) {
		
		
		HttpSession session = request.getSession();
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		

		
		List<TypesVO> typesList = service.select_types();
		
		request.setAttribute("typesList", typesList);
		
		mav.setViewName("order/orderForm.tiles1");
		
		
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
	public ModelAndView requiredLogin_order_form(HttpServletRequest request, HttpServletResponse response,ModelAndView mav, MultipartHttpServletRequest mrequest) {
		
		
		String type_code_pk = request.getParameter("type_code_pk"); 			// 품목번호 : type_code_pk
		String order_product_type = request.getParameter("order_product_type"); // 품목이름 : order_product_type
		String brand_name = request.getParameter("brand_name");					//브랜드 : brand_name
		String img_whole_name = request.getParameter("img_whole_name");			//전체사진 : img_whole
		String img_detail_name = request.getParameter("img_detail_name");		//상세사진 : img_detail
		String reqest_list_num = request.getParameter("reqest_list_num");		//수선요청사항 번호(자르기용):reqest_list_num
		String reqest_list_name = request.getParameter("reqest_list_name");		//수선요청사항 이름(insert용):reqest_list_name
		String req_textarea = request.getParameter("req_textarea");				//수선요청사항설명:req_textarea
		
		
		
		// 사진 업로드용
		List<MultipartFile> whole_img_list = mrequest.getFiles("img_whole");
		List<MultipartFile> detail_img_list = mrequest.getFiles("img_detail");
		
		
		// 사진의 원래 이름
		List<String> whole_img_origin = new ArrayList<>();
		List<String> detail_img_origin = new ArrayList<>();
		
		// 사진의 새로운 이름
		List<String> whole_img_new = new ArrayList<>();
		List<String> detail_img_new = new ArrayList<>();
		
		
		
		//System.out.println("whole_img_list "+whole_img_list);
		//System.out.println("detail_img_list "+detail_img_list);
		
		HttpSession session = mrequest.getSession();
	    String root = session.getServletContext().getRealPath("/").substring(0, 3);
	    //System.out.println(root);
	    //String path_whole = root + "resources"+File.separator+"img\\orders";
	    //C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FinalProject_GotGongBang\resources\img\orders
	    
	    //String path_whole = root + "resources"+File.separator+"img"+File.separator+"orders";
	    
	    String path_whole = root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"orders";
	    //root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"++File.separator+"order";
	    
	    //String path_detail = root + "resources"+File.separator+"img"+File.separator+"orders_detail";
		// 확인용 path_detail => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FinalProject_GotGongBang\resources\img\orders
	    String path_detail = root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"orders_detail";
	    //root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"++File.separator+"order";
	    
	    
	    //System.out.println("~~~~ 확인용 path_whole => " + path_whole);
	    //System.out.println("~~~~ 확인용 path_detail => " + path_detail);

	    
	    
	    
	     // >>> whole_img 첨부파일을 위의 path 경로에 올리기 <<<  //
	     String[] arr_attachFilename_whole = null;
	     
	     if(whole_img_list != null && whole_img_list.size() > 0) {
	    	 
	    	 arr_attachFilename_whole = new String[whole_img_list.size()];
	    	 
	    	 for(int i = 0; i<whole_img_list.size(); i++) {
	    		 
	    		 MultipartFile mtfile_whole = whole_img_list.get(i);
	    		 
		    	  String newFileName = "";
		   		  // WAS(톰캣)의 디스크에 저장될 파일명
		   		  
		   		  byte[] bytes = null;
		   		  // 첨부파일의 내용물을 담는 것
	   		  
	    		 //System.out.println("파일명 : "+ mtfile_whole.getOriginalFilename()+"/ 파일크기 : "+mtfile_whole.getSize());
	    		 // 파일명 : berkelekle심플라운드01.jpg/ 파일크기 : 71317
	    		 
	    		 
	    		 
	    		 try {
	    			 
	    			// == MultipartFile 을 File로 변환하여 탐색기 저장폴더에 저장하기 시작 == //
	    			 
	    			 bytes = mtfile_whole.getBytes();
	    			 
	    			 whole_img_origin.add(i,mtfile_whole.getOriginalFilename());
	    			 newFileName = fileManager.doFileUpload(bytes, mtfile_whole.getOriginalFilename(), path_whole);
	    			 whole_img_new.add(i,newFileName);
	    			 
		    		 File attachFile_whole = new File(path_whole+File.separator+newFileName);
		    		 // 빈껍데기만 생성
		    		 
		    		 mtfile_whole.transferTo(attachFile_whole);
		    		 //빈껍데기 파일에 mtfile안에 있는 내용 옮기기
		    		 
		    		// == MultipartFile 을 File로 변환하여 탐색기 저장폴더에 저장하기 끝 == //
		    		 
		    		 
		    		 arr_attachFilename_whole[i] = mtfile_whole.getOriginalFilename();
		    		 
	    		 }catch(Exception e) {
	    			 e.printStackTrace();
	    		 }
	    		 
	    	 }//for
	    	 
	     } // if(fileList != null && fileList.size() > 0)
	     
	     
	     
	     // >>> detail_img 첨부파일을 위의 path 경로에 올리기 <<<  //
	     String[] arr_attachFilename_detail = null;
	     
	     if(detail_img_list != null && detail_img_list.size() > 0) {
	    	 
	    	 arr_attachFilename_detail = new String[detail_img_list.size()];
	    	 
	    	 for(int i = 0; i<detail_img_list.size(); i++) {
	    		 
	    		 MultipartFile mtfile_detail = detail_img_list.get(i);
	    		 //System.out.println("파일명 : "+ mtfile_detail.getOriginalFilename()+"/ 파일크기 : "+mtfile_detail.getSize());
	    		 // 파일명 : berkelekle심플라운드01.jpg/ 파일크기 : 71317
	    		 
	    		 String newFileName = "";
		   		  // WAS(톰캣)의 디스크에 저장될 파일명
		   		  
		   		  byte[] bytes = null;
		   		  // 첨부파일의 내용물을 담는 것
	    		 
	    		 try {
	    			 
	    			// == MultipartFile 을 File로 변환하여 탐색기 저장폴더에 저장하기 시작 == //
	    			 
	    			 bytes = mtfile_detail.getBytes();
	    			 
	    			 detail_img_origin.add(i,mtfile_detail.getOriginalFilename());
	    			 newFileName = fileManager.doFileUpload(bytes, mtfile_detail.getOriginalFilename(), path_detail);
	    			 detail_img_new.add(i,newFileName);
	    			 
		    		 File attachFile_detail = new File(path_detail+File.separator+newFileName);
		    		 // 빈껍데기만 생성
		    		 
		    		 mtfile_detail.transferTo(attachFile_detail);
		    		 //빈껍데기 파일에 mtfile안에 있는 내용 옮기기
		    		 
		    		// == MultipartFile 을 File로 변환하여 탐색기 저장폴더에 저장하기 끝 == //
		    		 
		    		 
		    		 arr_attachFilename_detail[i] = mtfile_detail.getOriginalFilename();
		    		 
	    		 }catch(Exception e) {
	    			 e.printStackTrace();
	    		 }
	    		 
	    	 }//for
	    	 
	     } // if(fileList != null && fileList.size() > 0)
	    
	    
	    
		//System.out.println("reqest_list_num "+reqest_list_num);
		//System.out.println("reqest_list_name "+reqest_list_name);
		/*
		    type_code_pk = 30
			brand_name = ㄷㄹㄷㄹ
			img_whole_name = 1_품목.PNG,2_브랜드.PNG
			img_detail_name = 1_품목.PNG,4_상세.PNG
			reqest_list = 30,31,32
			req_textarea = ㄷㄹㄷㄹㄴㄴㄴㄴ
		 */
		

		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		
		Map<String,String> mapOrder = new HashMap<String, String>();
		mapOrder.put("user_id_fk", loginuser.getUser_id_pk());
		mapOrder.put("brand_name", brand_name);
		mapOrder.put("request_explain", req_textarea);
		mapOrder.put("requests", reqest_list_name);
		mapOrder.put("order_product_type", order_product_type);
		mapOrder.put("orderer", loginuser.getName());
		/*
		 * user_id_fk wlgus
			brand_name efefe
			request_explain efefe
			requests 2,11
			order_product_type 가방/핸드백
			orderer 이지현
		 * */
		
		
		//private int order_num_pk;		// 견적요청번호 

		// 견적 요청 넣기
		int n1 = service.insert_order(mapOrder);
		//System.out.println("n1 = "+n1);
		
		if(n1 == 1) {
			
			int order_num_pk = service.select_order_num_pk(mapOrder);
			// 주문번호 갖고오기
			
			//System.out.println("order_num_pk = "+order_num_pk);
			
			String[] arr_img_whole_name = img_whole_name.split("\\,");
			String[] arr_img_detail_name = img_detail_name.split("\\,");
			
			Map<String,Object> whole_map = new HashMap<String, Object>();
			// 전체 사진 
			
			Map<String,Object> detail_map = new HashMap<String, Object>();
			// 상세 사진 
			
			int[] whole_num = {-1,-1,-1};
			int[] detail_num = {-1,-1,-1};
			
			if (order_num_pk != 0) {
				
				whole_map.put("order_num_pk",order_num_pk );
				detail_map.put("order_num_pk",order_num_pk);
				

				// 전체 사진
				for(int i =0; i<arr_img_whole_name.length;i++) {
					
					String whole_img_name = arr_img_whole_name[i];
					whole_map.put("whole_img_name",whole_img_name);
					whole_map.put("whole_img_new_name",whole_img_new.get(i));
					
					whole_num[i] = service.insert_whole_img(whole_map);
					// 전체 사진 반복문으로 추가하기
					//System.out.println("whole num "+i+"="+whole_num[i]);
					whole_map.remove("whole_img_name");
					whole_map.remove("whole_img_new_name");
				}
				
				// 상세사진
				for(int i =0; i<arr_img_detail_name.length;i++) {
					
					String detail_img_name = arr_img_detail_name[i];
					detail_map.put("detail_img_name",detail_img_name);
					detail_map.put("detail_img_new_name",detail_img_new.get(i));
					
					detail_num[i] = service.insert_detail_img(detail_map);
					// 상세 사진 반복문으로 추가하기
					//System.out.println("detail_num  ="+i+"="+detail_num[i]);
					detail_map.remove("detail_img_name");
					whole_map.remove("detail_img_new_name");
				}
				
				
				// 오류없이 사진들 잘 넣었으면
				if(whole_num[0]!=0 && whole_num[1]!=0 &&whole_num[2]!=0 &&
						detail_num[0]!=0 &&detail_num[1]!=0 &&detail_num[2]!=0 ){
					
					   
					// 수선 요청사항 리스트에 넣기  
					String[] arr_reqest_list = reqest_list_num.split("\\,"); 
					
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
						
						//System.out.println("request_list_num"+i+" = "+request_list_num[i]);
						
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
	
	
	// 결제정보 입력하는 페이지
	@RequestMapping(value = "/payment.got")
	public ModelAndView requiredLogin_payment(HttpServletRequest request, HttpServletResponse response,ModelAndView mav) {
		
		
		HttpSession session = request.getSession();
		
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");


		String estimate_num_pk = request.getParameter("estimate_num_pk");
	
		try {
			int k =Integer.parseInt(estimate_num_pk) ;
			
			if(estimate_num_pk==null) {
				String message = "비정상적인 접근입니다.";
				String loc = request.getContextPath()+"/index.got";
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);					
				
				mav.setViewName("msg");
				// /WEB-INF/views/msg.jsp 파일을 생성한다.
			}
			else {
				mav.addObject("estimate_num_pk",estimate_num_pk);
				
				// 견적서번호를 가지고 정보 가져오기
				HashMap<String,String> paymentInfo = service.get_estimate_info(estimate_num_pk);
				
				
				// 해당 견적서번호가 실제로 있는지 확인하기
				if(paymentInfo ==null) {
					String message = "비정상적인 접근입니다.";
					String loc = request.getContextPath()+"/index.got";
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);					
					
					mav.setViewName("msg");
					// /WEB-INF/views/msg.jsp 파일을 생성한다.
				}
				
				else {
					// 로그인 된 사람의 정보가 견적요청에 넣은 아이디와 같은지 체크하기.
					 String paymentId = paymentInfo.get("user_id_fk");
					 if(!paymentId.equals(loginuser.getUser_id_pk())) {

						String message = "비정상적인 접근입니다.";
						String loc = request.getContextPath()+"/index.got";
						
						mav.addObject("message", message);
						mav.addObject("loc", loc);					
						
						mav.setViewName("msg");
						// /WEB-INF/views/msg.jsp 파일을 생성한다.
					}
					
					else {
						int craftNum = Integer.parseInt(String.valueOf(paymentInfo.get("craft_num_fk")) );
						
						// 공방번호를 가지고 공방이름 가져오기
						String craft_name = service.get_craft_name(craftNum );
						
						// 견적요청번호를 가지고 대표사진 이름 가져오기
						String img_name = service.get_img_name(Integer.parseInt(String.valueOf(paymentInfo.get("order_num_pk")) ));
						//String img_name = service.get_img_name(paymentInfo.get("order_num_pk"));
						mav.addObject("img_name",img_name);
						
						// order_num_pk를 가지고 사진 하나 가져오기 
						
						
						paymentInfo.put("craft_name", craft_name);
						
						mav.addObject("paymentInfo", paymentInfo);
						
						mav.setViewName("order/payment.tiles1");
					}
				}

			}
			
		}catch(NumberFormatException e) {
			String message = "비정상적인 접근입니다.";
			String loc = request.getContextPath()+"/index.got";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);					
			
			mav.setViewName("msg");
			// /WEB-INF/views/msg.jsp 파일을 생성한다.
		}
		
		
		return mav;
	}
	
	

	// 결제하러 가는 페이지
	@RequestMapping(value = "/requiredLogin_PurchaseEnd.got")
	public ModelAndView requiredLogin_PurchaseEnd(HttpServletRequest request, HttpServletResponse response,ModelAndView mav) {
		
		
		//System.out.println("type_code_pk"+type_code_pk);
		//System.out.println("brand_name"+brand_name);
		
		
		HttpSession session = request.getSession();
		
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		
		// 로그인 한 유저와 결제하는 사용자가 다르면
		if(!request.getParameter("user_id_pk").equals(loginuser.getUser_id_pk()) ) {
			
		}
		
		// 아이디와 이메일 보내기
		request.setAttribute("user_id_pk", loginuser.getUser_id_pk()); 
		request.setAttribute("email", loginuser.getEmail()); 
		request.setAttribute("price", Integer.parseInt(request.getParameter("price")) ); 

		
		mav.setViewName("/none_tiles/order/paymentGateway");
		return mav;
	}
	
	
	
	// 결제한 내용 order_detail에 넣고 결제정보 페이지 넘어가기
	@RequestMapping(value = "/requiredLogin_insertOrderDetail.got")
	public ModelAndView requiredLogin_insertOrderDetail(HttpServletRequest request, HttpServletResponse response,ModelAndView mav) {
		
		String order_name = request.getParameter("order_name");						//주문자명
		String order_mobile = request.getParameter("order_mobile");					//주문자폰번호
		String order_post_code = request.getParameter("order_post_code");			//우편번호
		String order_address = request.getParameter("order_address");				//주소
		String order_detail_address = request.getParameter("order_detail_address");	//상세주소
		String estimate_num_fk = request.getParameter("estimate_num_fk");			//견적서번호
		String payment = request.getParameter("estimante_price");					//가격
		
		Map<String,String> paraMap = new HashMap<>();
		
		paraMap.put("order_name", order_name);
		paraMap.put("order_num", order_mobile);
		paraMap.put("order_post_code", order_post_code);
		paraMap.put("order_address", order_address);
		paraMap.put("order_detail_address", order_detail_address);
		paraMap.put("estimate_num_fk", estimate_num_fk);
		paraMap.put("payment", payment);
		
		// orderDetail 테이블에 주문정보 넣어주기
		int i = service.insertOrderDetail(paraMap);

		mav.addObject("estimate_num_fk", estimate_num_fk);
		
		
		
		String estimate_num_pk = request.getParameter("estimate_num_fk");
		
		// 테이블 estimate에 있는 order_status 1로 바꿔주기
		int k = service.updateOrderStatus(estimate_num_pk);
		
		// order_num_fk 가져오기
		String order_num_fk = service.getOrderNumPk(estimate_num_pk );
		
		System.out.println("order_num_fk "+order_num_fk);
		
		// order_status가 0이면서 order_num_fk가 해당 번호인 얘들 전부 삭제하기
		int j = service.deleteEstimate(order_num_fk );
		
		if(i==1) {
			
			
		  estimate_num_pk = request.getParameter("estimate_num_fk");
			
			
			
			// 견적서번호를 가지고 정보 가져오기
			HashMap<String,String> paymentInfo = service.get_estimate_info(estimate_num_pk);
			
			int craftNum = Integer.parseInt(String.valueOf(paymentInfo.get("craft_num_fk")) );
			// 공방번호를 가지고 공방이름 가져오기
			String craft_name = service.get_craft_name(craftNum );
			
			paymentInfo.put("craft_name", craft_name);
			
			mav.addObject("paymentInfo", paymentInfo);
			
			
			// 견적요청번호를 가지고 대표사진 이름 가져오기
			String img_name = service.get_img_name(Integer.parseInt(String.valueOf(paymentInfo.get("order_num_pk")) ));

			mav.addObject("img_name",img_name);
			
			/////////////// 결제 정보 확인하기 ////////////////
			// 견적서번호를 가지고 주문상세 정보 가져오기
			OrderDetailVO orderDetailInfo = service.get_order_detail_info(estimate_num_fk);
			mav.addObject("orderDetailInfo", orderDetailInfo);
			
			mav.setViewName("order/buyResult.tiles1");
		}
		
		return mav;
	}
		
	/*
	 * // 결제한 후 결과 페이지 보여주기
	 * 
	 * @RequestMapping(value = "buyResult.got") public ModelAndView
	 * requiredLogin_buyResult(HttpServletRequest request, HttpServletResponse
	 * response,ModelAndView mav) {
	 * 
	 * 
	 * 
	 * mav.setViewName("order/buyResult.tiles1"); return mav; }
	 */
	

	// 이지현 끝 ===========================================================================

	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
