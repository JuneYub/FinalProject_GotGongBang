package com.spring.gotgongbang.member.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import java.util.*;


import com.spring.gotgongbang.member.model.MemberVO;

public interface InterMemberService {

	// 회원가입 Service
	void insertMember(MemberVO membervo);

	// 비밀번호 암호화
	void encryptPassword(MemberVO membervo);

	// 이메일 중복 확인 AJAX 요청 처리
	boolean isEmailDuplicate(String email);

	// 아이디 중복 확인 AJAX 요청 처리
	boolean isIdDuplicate(String id);
  
  	// 로그인
	ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap);
	
	
	// ======== 박준엽 시작 ========================================== //
	
	List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap);

	MemberVO getUserInfoByUserId(String userid);

	int updateMemberInfoByMVO(MemberVO mvo);



	int updateMemberPwd(MemberVO mvo);
	
	// ====== 박준엽 끝 =========================================== //
}
