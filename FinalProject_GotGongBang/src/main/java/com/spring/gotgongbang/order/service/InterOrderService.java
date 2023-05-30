package com.spring.gotgongbang.order.service;

import java.util.List;

import com.spring.gotgongbang.order.model.TypesVO;

public interface InterOrderService {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();
	
	

}
