package com.spring.gotgongbang.order.model;

import java.util.List;
import java.util.Map;

public interface InterOrderDAO {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	List<TypesVO> bring_request_list(String type_code_pk);

	// 견적 요청 넣기
	int insert_order(Map<String, String> mapOrder);

}
