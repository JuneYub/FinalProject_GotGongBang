package com.spring.gotgongbang.order.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


@Service
public class OrderDAO implements InterOrderDAO {


	@Resource
	private SqlSessionTemplate sqlsession;
	

	
	
	// ================ 이지현 시작 ==================//
	
	
	// 셀렉트 할 것 갖고 오기
	@Override
	public List<TypesVO> select_types() {
		
		List<TypesVO> typesList = sqlsession.selectList("order.select_types");
		return typesList;
	}



	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	@Override
	public List<TypesVO> bring_request_list(String type_code_pk) {
		
		List<TypesVO> requestList = sqlsession.selectList("order.bring_request_list",type_code_pk);
		return requestList;
	}
	
	
	// ================ 이지현 끝 ==================//

	
}
