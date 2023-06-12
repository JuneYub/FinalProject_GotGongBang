package com.spring.gotgongbang.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.gotgongbang.order.model.OrderDetailVO;
import com.spring.gotgongbang.order.model.TypesVO;

public interface InterOrderService {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	List<TypesVO> bring_request_list(String type_code_pk);
	
	// 견적 요청 넣기
	int insert_order(Map<String, String> mapOrder);

	// 주문번호 갖고오기
	int select_order_num_pk(Map<String, String> mapOrder);

	// 전체 사진 반복문으로 추가하기
	int insert_whole_img(Map<String, Object> wholeMap);

	// 상세 사진 반복문으로 추가하기
	int insert_detail_img(Map<String, Object> detailMap);

	// 요청사항 목록들 반복문으로 추가하기
	int insert_detail_request_list(Map<String, Integer> request_list_map);

	// 견적서번호를 가지고 정보 가져오기
	HashMap<String, String> get_estimate_info(String estimate_num_pk);

	// 공방번호를 가지고 공방이름 가져오기
	String get_craft_name(int craftNum);
	
	// orderDetail 테이블에 주문정보 넣어주기
	int insertOrderDetail(Map<String, String> paraMap);

	// 견적서번호를 가지고 주문상세 정보 가져오기
	OrderDetailVO get_order_detail_info(String estimate_num_fk);

	// 테이블 estimate에 있는 order_status 1로 바꿔주기
	int updateOrderStatus(String estimate_num_pk);

	// order_num_fk 가져오기
	int getOrderNumPk(int estimate_num_pk);

	// order_status가 0이면서 order_num_fk가 해당 번호인 얘들 전부 삭제하기
	int deleteEstimate(int order_num_fk);


	
	

}
