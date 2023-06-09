package com.spring.gotgongbang.member.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterMemberDAO {

	// ====== 홍용훈 시작 =========================================== //
	
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
	
	// 이름과 이메일 값으로 아이디 유무 체크
	List<MemberVO> compareNameEmail(String name, String email);
	
	
	String compareNameEmailMember(Map<String, String> paraMap);
	
	
	String compareNameEmailpartner(Map<String, String> paraMap);
	
	
	
	
	
	
	
	
	
	
	
	
	// ====== 홍용훈 끝 =========================================== //

	// ====== 박준엽 시작 =========================================== //
	
	List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap);

	MemberVO getUserInfoByUserId(String userid);

	int updateMemberInfoByMVO(MemberVO mvo);

	int updateMemberPwd(MemberVO mvo);





	
	// ====== 박준엽 끝 =========================================== //


	
}
