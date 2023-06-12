package com.spring.gotgongbang.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import com.spring.gotgongbang.member.model.MemberVO;

public interface InterMemberService {
	
	// ======== 홍용훈 시작 ========================================== //

	// 일반회원가입 Service
	void insertMember(MemberVO membervo);

	// 비밀번호 암호화
	void encryptPassword(MemberVO membervo);

	// 이메일 중복 확인 AJAX 요청 처리
	boolean isEmailDuplicate(String email);

	// 아이디 중복 확인 AJAX 요청 처리
	boolean isIdDuplicate(String id);
  
  	// 로그인
	ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap);
	
	// 이름과 이메일 값으로 아이디 유무 체크
	List<MemberVO> compareNameEmail(String name, String email);
	
	
	String compareNameEmailMember(Map<String, String> paraMap);
	
	
	String compareNameEmailpartner(Map<String, String> paraMap);
	
	// 공방회원가입 Service
	void insertPartner(MemberVO membervo);
	
	// 이메일 중복 확인 AJAX 요청 처리 ( 공방회원 )
	boolean isEmailDuplicate_partner(String email);
	
	
	
	// ======== 홍용훈 끝 ========================================== //
	
	
	
	
	
	// ======== 박준엽 시작 ========================================== //
	
	List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap);

	MemberVO getUserInfoByUserId(String userid);

	int updateMemberInfoByMVO(MemberVO mvo);

	int updateMemberPwd(MemberVO mvo);

	List<HashMap<String, String>> getOrderListByUserId(HashMap<String, String> paraMap);

	int getTotalCountForOrderListByUserId(String userId);

	int getTotalCountProposalListByUserId(String userId);
	


	
	// ====== 박준엽 끝 =========================================== //
}
