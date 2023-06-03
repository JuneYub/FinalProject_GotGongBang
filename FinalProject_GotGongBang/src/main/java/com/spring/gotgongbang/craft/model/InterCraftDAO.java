package com.spring.gotgongbang.craft.model;

import java.util.List;
import java.util.Map;

import com.spring.gotgongbang.order.model.OrderVO;

public interface InterCraftDAO {

	
	
	
	// =============== 김진솔 시작 =================//
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	int craft_check_name(String craft_name);

	//공방 신청시 추가이미지 파일이 존재할때 select해오는 용도
	List<CraftVO> craft_add_image();
	
	//공방 신청정보를 DB에 insert해주는 기능
	int add_withFile(CraftVO cvo);


	
	// =============== 김진솔 끝 =================//
	
	
	
	
	
	
	
	
	// =============== 박준엽 시작 =================//

	PartnerVO getPartnerInfoByUserId(String userid);
	
	int updatePartnerInfo(PartnerVO pvo);

	int updatePartnerPwd(PartnerVO pvo);

	List<OrderVO> getAllOrders(Map<String, String> paraMap);

	int getTotalCountForEstimate();
	
	// =============== 박준엽 끝 =================//
	
	
	
	
	
	
	
	
	// =============== 김나윤 시작 =================//
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	List<CraftVO> crafts_list_select();

	CraftVO crafts_detail_select();






	//공방상세페이지를 보여주기 위해 공방정보 조회해오기
//	List<CraftVO> crafts_detail_select();
	
	
	
	// =============== 김나윤 끝 =================//
}
