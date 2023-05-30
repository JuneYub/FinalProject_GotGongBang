package com.spring.gotgongbang.craft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;

@Service
public class CratfService implements InterCraftService {

	@Autowired
	private InterCraftDAO cdao;

	
	// ================ 김진솔 시작 ================== //
	
	// 공방이름 중복체크를 위한 공방이름 조회해오기
	@Override
	public int craft_check_name(String craft_name) {
		int n = cdao.craft_check_name(craft_name);	//n은 0 또는 1
		return n;
	}


	
	// ================ 김진솔 끝 ================== //
	
	
	
	// ================ 김나윤 시작 ================== //
	
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_list_select(String craft_specialty) {
		List<CraftVO> craftvo = cdao.crafts_list_select(craft_specialty);
		return craftvo;
	}
	
	// ================ 김나윤 끝 ================== //
}
