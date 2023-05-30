package com.spring.gotgongbang.craft.service;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.board.model.InterBoardDAO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;
import com.spring.gotgongbang.craft.model.PartnerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.craft.model.CraftVO;
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
	
	@Override
	public int updatePartnerInfo(PartnerVO pvo) {
		int n = cdao.updatePartnerInfo(pvo);
		return n;
	}
	
	@Override
	public int updatePartnerPwd(PartnerVO pvo) {
		int n = cdao.updatePartnerPwd(pvo);
		return n;
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
	
	
	
	// ================ 김나윤 시작 ================== //
	
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_list_select(String craft_specialty) {
		List<CraftVO> craftvo = cdao.crafts_list_select(craft_specialty);
		return craftvo;
	}
	
	// ================ 김나윤 끝 ================== //
}
