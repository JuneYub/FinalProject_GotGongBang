package com.spring.gotgongbang.craft.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.craft.model.InterCraftDAO;

@Service
public class CratfService implements InterCraftService {

	@Autowired
	private InterCraftDAO cdao;

	
	// ================ 김진솔 시작 ================== //
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	@Override
	public int craft_check_name(String craft_name) {
		int n = cdao.craft_check_name(craft_name);	//n은 0 또는 1
		return n;
	}


	
	// ================ 김진솔 끝 ================== //
	
}
