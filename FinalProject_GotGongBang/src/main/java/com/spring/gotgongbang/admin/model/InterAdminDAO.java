package com.spring.gotgongbang.admin.model;

import java.util.List;
import java.util.Map;

import com.spring.gotgongbang.craft.model.CraftVO;


public interface InterAdminDAO {

	// ==== ==================================== 김나윤 시작 ======================================================= // 
//	boolean loginCheck(AdminVO avo) throws Exception;   //로그인을 체크하는 메소드
	
	//로그인 처리하기
	String getLoginMember(Map<String, String> paraMap);

	
	// ==== ==================================== 김나윤 끝 ======================================================= // 


	
	
	
	// ==== ==================================== 김진솔 시작 ======================================================= // 
	
	// 공방 목록 가져오기
	List<CraftVO> selectCraftList();

	// 공방 한 개 보기
	CraftVO craftOneView(String craft_num_pk);

	// ==== ==================================== 김진솔 끝 ======================================================= // 

}
