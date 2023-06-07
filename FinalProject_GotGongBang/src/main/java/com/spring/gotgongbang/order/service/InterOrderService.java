package com.spring.gotgongbang.order.service;

import java.util.List;

import com.spring.gotgongbang.order.model.TypesVO;

public interface InterOrderService {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	List<TypesVO> bring_request_list(String type_code_pk);


	
	

}
