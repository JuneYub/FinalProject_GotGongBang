package com.spring.gotgongbang.craft.service;

import java.util.List;
import com.spring.gotgongbang.craft.model.CraftVO;
import java.util.Map;

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.order.model.OrderVO;

public interface InterCraftService {
	
	//이미 존재하는 '공방이름'인지 알아오기 위한 것
	int craft_check_name(String craft_name);


	// ==== ==================================== 박준엽 시작 ======================================================= // 

	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	List<CraftVO> crafts_list_select(String craft_specialty);

	PartnerVO getPartnerInfoByUserId(String userid);
	
	int updatePartnerInfo(PartnerVO pvo);

	int updatePartnerPwd(PartnerVO pvo);

	List<OrderVO> getAllOrders(Map<String, String> paraMap);

	int getTotalCountForEstimate();

	
	// ==== ==================================== 박준엽 끝 ======================================================= //


}
