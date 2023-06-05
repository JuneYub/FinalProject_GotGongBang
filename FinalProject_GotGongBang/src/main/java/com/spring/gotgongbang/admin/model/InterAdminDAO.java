package com.spring.gotgongbang.admin.model;

import java.util.Map;


public interface InterAdminDAO {

	// ==== ==================================== 김나윤 시작 ======================================================= // 
//	boolean loginCheck(AdminVO avo) throws Exception;   //로그인을 체크하는 메소드
	
	//로그인 처리하기
	String getLoginMember(Map<String, String> paraMap);
	
	// ==== ==================================== 김나윤 끝 ======================================================= // 
}
