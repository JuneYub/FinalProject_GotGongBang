package com.spring.gotgongbang.order.model;

import java.util.List;

public interface InterOrderDAO {

	// 품목 리스트 가져오기
	List<TypesVO> select_types();

}
