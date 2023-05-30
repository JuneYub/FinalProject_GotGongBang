package com.spring.gotgongbang.craft.model;

import java.util.Map;

public interface InterCraftDAO {

	// =============== 김진솔 시작 =================//
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	int craft_check_name(String craft_name);
	
	// =============== 김진솔 끝 =================//
	
	// =============== 박준엽 시작 =================//

	PartnerVO getPartnerInfoByUserId(String userid);
	
	int updatePartnerInfo(PartnerVO pvo);

	int updatePartnerPwd(PartnerVO pvo);
	
	// =============== 박준엽 끝 =================//
}
