package com.spring.gotgongbang.craft.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.board.model.InterBoardDAO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;
import com.spring.gotgongbang.craft.model.PartnerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.craft.model.InterCraftDAO;


@Service
public class CratfService implements InterCraftService {

	@Autowired
	private InterCraftDAO cdao;
	
	// =============== 박준엽 시작 ==================== //
	
	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		
		PartnerVO pvo = new PartnerVO();
		
		pvo = cdao.getPartnerInfoByUserId(userid);
		
		return pvo;
	}

	// =============== 박준엽 끝 ==================== // 
	
	// ================ 김진솔 시작 ================== //
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	@Override
	public int craft_check_name(String craft_name) {
		int n = cdao.craft_check_name(craft_name);	//n은 0 또는 1
		return n;
	}


	
	// ================ 김진솔 끝 ================== //
	
}
