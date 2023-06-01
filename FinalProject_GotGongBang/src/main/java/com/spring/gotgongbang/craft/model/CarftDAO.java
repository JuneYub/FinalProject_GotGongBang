package com.spring.gotgongbang.craft.model;

import java.util.List;

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
		PartnerVO pvo = sqlsession.selectOne("craft.getPartnerInfoByUserId", userid);
		return pvo;
	}


	@Override
	public int updatePartnerInfo(PartnerVO pvo) {
		int n = sqlsession.update("craft.updatePartnerInfo", pvo);
		return n;
	}


	@Override
	public int updatePartnerPwd(PartnerVO pvo) {
		int n = sqlsession.update("craft.updatePartnerPwd", pvo);
		return n;
	}
	
	
	// =============== 박준엽 끝 =================//
	
	
	// ================ 김나윤 시작 ==================//
	
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_list_select() {
		List<CraftVO> craftvo = sqlsession.selectList("craft.crafts_list_select");
		return craftvo;
	}


	//공방상세페이지를 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_detail_select() {
		List<CraftVO> craftvo_2 = sqlsession.selectList("craft.crafts_detail_select");
		return craftvo_2;
	}
	
	
	// ================ 김나윤 끝 ==================//
	
}
