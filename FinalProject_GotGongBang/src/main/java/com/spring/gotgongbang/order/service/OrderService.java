package com.spring.gotgongbang.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.order.model.InterOrderDAO;
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
	

	// ================ 이지현 끝 ================== //
	
	
}
