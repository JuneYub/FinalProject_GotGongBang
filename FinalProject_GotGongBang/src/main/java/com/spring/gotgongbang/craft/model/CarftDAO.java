package com.spring.gotgongbang.craft.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CarftDAO implements InterCraftDAO {


	@Resource
	private SqlSessionTemplate sqlsession;

	
	
	// ================ 김진솔 시작 ==================//
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	@Override
	public int craft_check_name(String craft_name) {
		int n = sqlsession.selectOne("craft.craft_check_name", craft_name);
		return n;		//n은 0 또는 1 (없/있)
	}
	
	
	// ================ 김진솔 끝 ==================//

	// =============== 박준엽 시작 =================//
	
	// 파트너 개인정보 변경을 위한 정보 가져오기
	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		PartnerVO pvo = sqlsession.selectOne("gotgongbang.getPartnerInfoByUserId", userid);
		return pvo;
	}
	// =============== 박준엽 끝 =================//
	
}
