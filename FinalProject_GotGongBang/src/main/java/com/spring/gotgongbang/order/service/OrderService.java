package com.spring.gotgongbang.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.order.model.InterOrderDAO;
import com.spring.gotgongbang.order.model.OrderDetailVO;
import com.spring.gotgongbang.order.model.TypesVO;

@Component
@Service
public class OrderService implements InterOrderService {

	@Autowired
	private InterOrderDAO odao;

	@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;
	
	// ================ 이지현 시작 ================== //
	
	
	// 품목 리스트 가져오기
	@Override
	public List<TypesVO> select_types() {
		List<TypesVO> typesList = odao.select_types();
		
		return typesList;
	}
	
	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	@Override
	public List<TypesVO> bring_request_list(String type_code_pk) {
		
		List<TypesVO> requestList = odao.bring_request_list(type_code_pk);
		
		return requestList;
	}
	
	// 견적 요청 넣기
	@Override
	public int insert_order(Map<String, String> mapOrder) {
		
		int n1 = odao.insert_order(mapOrder);
		
		return n1;
	}
	
	// 주문번호 갖고오기
	@Override
	public int select_order_num_pk(Map<String, String> mapOrder) {
		
		int order_num_pk = odao.select_order_num_pk(mapOrder);
		
		return order_num_pk;
	}
	
	// 전체 사진 반복문으로 추가하기
	@Override
	public int insert_whole_img(Map<String, Object> wholeMap) {
		
		int whole1 = odao.insert_whole_img(wholeMap);
		
		return whole1;
	}
	
	// 상세 사진 반복문으로 추가하기
	@Override
	public int insert_detail_img(Map<String, Object> detailMap) {
		
		int detail1 = odao.insert_detail_img(detailMap);
		
		return detail1;
	}
	
	// 요청사항 목록들 반복문으로 추가하기
	@Override
	public int insert_detail_request_list(Map<String, Integer> request_list_map) {
		
		int request_list_num1 = odao.insert_detail_request_list(request_list_map);
		
		return request_list_num1;
	}
	
	// 견적서번호를 가지고 정보 가져오기
	@Override
	public HashMap<String, String> get_estimate_info(String estimate_num_pk) {
		
		HashMap<String, String> paymentInfo = odao.get_estimate_info(estimate_num_pk);
		
		return paymentInfo;
	}

	// 공방번호를 가지고 공방이름 가져오기
	@Override
	public String get_craft_name(int craftNum) {
		
		String craftName = odao.get_craft_name(craftNum);
		return craftName;
	}

	// orderDetail 테이블에 주문정보 넣어주기
	@Override
	public int insertOrderDetail(Map<String, String> paraMap) {
		int i = odao.insertOrderDetail(paraMap);
		return i;
	}

	// 견적서번호를 가지고 주문상세 정보 가져오기
	@Override
	public OrderDetailVO get_order_detail_info(String estimate_num_fk) {
		
		OrderDetailVO orderDetailInfo = odao.get_order_detail_info(estimate_num_fk);
		return orderDetailInfo;
	}
	
	// 테이블 estimate에 있는 order_status 1로 바꿔주기
	@Override
	public int updateOrderStatus(String estimate_num_pk) {
		
		int k = odao.updateOrderStatus(estimate_num_pk);
		return k;
	}
	
	// order_num_fk 가져오기
	@Override
	public String getOrderNumPk(String estimate_num_pk) {
		
		String order_num_fk = odao.getOrderNumPk(estimate_num_pk);
		return order_num_fk;
	}
	
	
	// order_status가 0이면서 order_num_fk가 해당 번호인 얘들 전부 삭제하기
	@Override
	public int deleteEstimate(String order_num_fk) {
		
		int j = odao.deleteEstimate(order_num_fk);
		return j;
	}
	
	
	
	// ================ 이지현 끝 ================== //
	
	
	
	
}
