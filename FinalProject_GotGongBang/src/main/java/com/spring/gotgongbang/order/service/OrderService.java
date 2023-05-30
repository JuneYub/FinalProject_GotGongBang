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
	// ================ 이지현 끝 ================== //
	
}
