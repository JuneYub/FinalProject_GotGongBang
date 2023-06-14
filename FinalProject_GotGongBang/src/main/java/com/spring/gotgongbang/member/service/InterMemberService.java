package com.spring.gotgongbang.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.WholeImgVO;

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
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	String confirmThroughMemberIdEmail(Map<String, String> paraMap);
	
	String confirmThroughPartnerIdEmail(Map<String, String> paraMap);
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	
	
	
	// ======== 홍용훈 끝 ========================================== //
	
	
	
	
	
	// ======== 박준엽 시작 ========================================== //
	
	List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap);

	MemberVO getUserInfoByUserId(String userid);

	int updateMemberInfoByMVO(MemberVO mvo);

	int updateMemberPwd(MemberVO mvo);

	List<HashMap<String, String>> getOrderListByUserId(HashMap<String, String> paraMap);

	int getTotalCountForOrderListByUserId(String userId);

	int getTotalCountProposalListByUserId(String userId);

	int getReviewCntByOrderNum(String orderNum);

	List<WholeImgVO> getWholeImgListByOrderDetailNum(String orderDetailNum);

	List<DetailImgVO> getDetailImgListByOrderDetailNum(String orderDetailNum);

	// 리뷰 이미지에 줄 번호 가져오기
	int getFixedPhotoNum();

	void insertReview(HashMap<String, Object> paraMap);

	// 후기 이미지 테이블에 추가
	void insertFixedPhoto(HashMap<String, Object> imgParaMap);

	int getCurrReviewIdByOrderDetailNum(String orderDetailNum);

	// 리뷰 작성에 넣을 견적 요청 번호와 공방 번호 가져오기
	HashMap<String, String> getOrderNumAndCraftNumByOrderDetailNum(String orderDetailNum);

	int checkOriginPwd(String encrpyInsertPwd);

	


	
	// ====== 박준엽 끝 =========================================== //
}
