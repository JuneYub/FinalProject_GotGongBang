package com.spring.gotgongbang.order.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterOrderDAO {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	List<TypesVO> bring_request_list(String type_code_pk);

	// 견적 요청 넣기
	int insert_order(Map<String, String> mapOrder);

	// 주문번호 갖고오기
	int select_order_num_pk(Map<String, String> mapOrder);

	// 전체 사진 반복문으로 추가하기
	int insert_whole_img(Map<String, Object> whole_map);

	// 상세 사진 반복문으로 추가하기
	int insert_detail_img(Map<String, Object> detail_map);
	
	// 요청사항 목록들 반복문으로 추가하기
	int insert_detail_request_list(Map<String, Integer> request_list_map);

	// 견적서번호를 가지고 정보 가져오기
	HashMap<String, String> get_estimate_info(String estimate_num_pk);

	// 공방번호를 가지고 공방이름 가져오기
	String get_craft_name(int craftNum);

}
