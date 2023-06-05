package com.spring.gotgongbang.member.model;

import java.util.HashMap;
import java.util.List;

public interface InterMemberDAO {

	// 회원가입
	void insertMember(MemberVO membervo);

	// 이메일 중복 확인 AJAX 요청 처리
	int isEmailDuplicate(String email);

	// 아이디 중복 확인 AJAX 요청 처리
	int isIdDuplicate(String id);

	// ====== 박준엽 시작 =========================================== //
	
	List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap);

	MemberVO getUserInfoByUserId(String userid);

	int updateMemberInfoByMVO(MemberVO mvo);
	
	// ====== 박준엽 끝 =========================================== //


	
}
