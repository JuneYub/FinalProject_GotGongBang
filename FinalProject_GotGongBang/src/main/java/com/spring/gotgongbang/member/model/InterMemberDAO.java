package com.spring.gotgongbang.member.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.WholeImgVO;

public interface InterMemberDAO {

	// ====== 홍용훈 시작 =========================================== //
	
	// 일반회원가입
	void insertMember(MemberVO membervo);
	
	// 공방회원가입
	void insertPartner(PartnerVO partnervo);

	// 이메일 중복 확인 AJAX 요청 처리
	int isEmailDuplicate(String email);

	// 아이디 중복 확인 AJAX 요청 처리
	int isIdDuplicateMember(String id);
	
	// 아이디 중복 확인 AJAX 요청 처리
	int isIdDuplicatePartner(String id);
	
	// 로그인 처리
	MemberVO getLoginMember(Map<String, String> paraMap);
	
	// MEMBER 테이블의 idle 컬럼의 값을 1로 변경
	int updateIdle(String string);

	// 로그인 기록
	void recordLoginDate(String id, int grade);
	
	// 이름과 이메일 값으로 아이디 유무 체크
	List<MemberVO> compareNameEmail(String name, String email);
	
	
	String compareNameEmailMember(Map<String, String> paraMap);
	
	
	String compareNameEmailpartner(Map<String, String> paraMap);
	
	// 공방회원가입
	void insertPartner(MemberVO membervo);
	
	// 이메일 중복 확인 AJAX 요청 처리 ( 공방회원 )
	int isEmailDuplicate_partner(String email);
	
	// PARTNER 테이블의 idle 컬럼의 값을 1로 변경
	int updateIdlePartner(String string);
	
	// 로그인 처리 ( 공방회원 )
	PartnerVO getLoginPartner(Map<String, String> paraMap);
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	String confirmThroughMemberIdEmail(Map<String, String> paraMap);
	
	String confirmThroughPartnerIdEmail(Map<String, String> paraMap);
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	
	// 비밀번호 변경 ( 일반회원 )
	int changeMemberPwd(HashMap<String, String> paraMap);
	
	// 비밀번호 변경 ( 공방회원)
	int changePartnerPwd(HashMap<String, String> paraMap);
	
	
	
	// ====== 홍용훈 끝 =========================================== //

	// ====== 박준엽 시작 =========================================== //
	
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

	int getFixedPhotoNum();

	void insertReview(HashMap<String, Object> paraMap);

	void insertFixedPhoto(HashMap<String, Object> imgParaMap);

	int getCurrReviewIdByOrderDetailNum(String orderDetailNum);

	HashMap<String, String> getOrderNumAndCraftNumByOrderDetailNum(String orderDetailNum);








	

	// ====== 박준엽 끝 =========================================== //


	
	// ====== 이지현 시작 =========================================== //
	
	int delete_user_end(Map<String, String> paraMap);
	
	int delete_partner_end(Map<String, String> paraMap);
	
	int delete_user_info(String user_id_pk);
	
	int delete_partner_info(String partner_id_pk);
	// ====== 이지현 끝 =========================================== //

	

	

	
	
}
