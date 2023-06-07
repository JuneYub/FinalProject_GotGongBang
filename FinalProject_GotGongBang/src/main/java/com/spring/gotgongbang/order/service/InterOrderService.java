package com.spring.gotgongbang.order.service;

import java.util.List;

import com.spring.gotgongbang.order.model.TypesVO;

public interface InterOrderService {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	List<TypesVO> bring_request_list(String type_code_pk);

	// 주문번호 갖고오기
	int select_order_num_pk(Map<String, String> mapOrder);

	// 전체 사진 반복문으로 추가하기
	int insert_whole_img(Map<String, Object> wholeMap);

	// 상세 사진 반복문으로 추가하기
	int insert_detail_img(Map<String, Object> detailMap);

	// 요청사항 목록들 반복문으로 추가하기
	int insert_detail_request_list(Map<String, Integer> request_list_map);


	
	

}
