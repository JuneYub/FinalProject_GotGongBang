package com.spring.gotgongbang.craft.service;

import java.util.Map;

import com.spring.gotgongbang.craft.model.PartnerVO;

public interface InterCraftService {
	
	//이미 존재하는 '공방이름'인지 알아오기 위한 것
	int craft_check_name(String craft_name);

	PartnerVO getPartnerInfoByUserId(String userid);



}
