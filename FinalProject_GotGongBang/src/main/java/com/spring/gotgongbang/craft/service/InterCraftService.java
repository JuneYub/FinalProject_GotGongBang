package com.spring.gotgongbang.craft.service;

import java.util.List;

import com.spring.gotgongbang.craft.model.CraftVO;

public interface InterCraftService {
	
	// 공방이름 중복체크를 위한 공방이름 조회해오기
	int craft_check_name(String craft_name);

	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	List<CraftVO> crafts_list_select(String craft_specialty);

}
