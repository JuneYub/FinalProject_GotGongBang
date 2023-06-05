package com.spring.gotgongbang.member.model;

import java.sql.Timestamp;
import java.util.Map;

public interface InterMemberDAO {

	// 회원가입
	void insertMember(MemberVO membervo);

	// 이메일 중복 확인 AJAX 요청 처리
	int isEmailDuplicate(String email);

	// 아이디 중복 확인 AJAX 요청 처리
	int isIdDuplicate(String id);

	// 로그인 처리
	MemberVO getLoginMember(Map<String, String> paraMap);
	
	// MEMBER 테이블의 idle 컬럼의 값을 1로 변경
	int updateIdle(String string);

	// 로그인 기록
	void recordLoginDate(String string, Timestamp loginDate);


	
}
