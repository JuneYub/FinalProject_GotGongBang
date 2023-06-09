package com.spring.gotgongbang.member.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.WholeImgVO;


@Repository
public class MemberDAO implements InterMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	// ====== 홍용훈 시작 =========================================== //
	
	// 회원가입
	@Override
	public void insertMember(MemberVO membervo) {
		sqlsession.insert("member.insertMember", membervo);
	}
	
	// 공방회원가입
	@Override
	public void insertPartner(PartnerVO partnervo) {
		sqlsession.insert("member.insertPartner", partnervo);
		
	}

	// 이메일 중복 확인 AJAX 요청 처리
	@Override
	public int isEmailDuplicate(String email) {
		int n = sqlsession.selectOne("member.isEmailDuplicate", email);
		return n;
	}

	// 아이디 중복 확인 AJAX 요청 처리 (member 에서)
	@Override
	public int isIdDuplicateMember(String id) {
		int n = sqlsession.selectOne("member.isIdDuplicateMember", id);
		return n;
	}
	
	// 아이디 중복 확인 AJAX 요청 처리 (member 에서)
	@Override
	public int isIdDuplicatePartner(String id) {
		int n = sqlsession.selectOne("member.isIdDuplicatePartner", id);
		return n;
	}
	
	// 로그인 처리
	@Override
	public MemberVO getLoginMember(Map<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("member.getLoginMember", paraMap);		
		return loginuser;
	}

	// MEMBER 테이블의 idle 컬럼의 값을 1로 변경
	@Override
	public int updateIdle(String userid) {
		int n = sqlsession.update("member.updateIdle", userid);
		return n;
	}

	// 로그인 기록
	@Override
	public void recordLoginDate(String userid, int grade) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("userid", userid);
		paraMap.put("grade", grade);
        sqlsession.insert("member.recordLoginDate", paraMap);
	}
	
	// 이름과 이메일 값으로 아이디 유무 체크
	@Override
	public List<MemberVO> compareNameEmail(String name, String email) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("name", name);
		paraMap.put("email", email);
		List<MemberVO> membervo = sqlsession.selectList("member.compareNameEmail", paraMap);
		System.out.println("dao membervo : " + membervo);
		return membervo;
	}
	
	
	@Override
	public String compareNameEmailMember(Map<String, String> paraMap) {
		String memberId = sqlsession.selectOne("member.compareNameEmailMember", paraMap);
		return memberId;
	}
	
	
	@Override
	public String compareNameEmailpartner(Map<String, String> paraMap) {
		String partnerId = sqlsession.selectOne("member.compareNameEmailpartner", paraMap);
		return partnerId;
	}
	
	
	// 공방회원가입
	@Override
	public void insertPartner(MemberVO membervo) {
		sqlsession.insert("member.insertPartner", membervo);
	}
	
	
	// 이메일 중복 확인 AJAX 요청 처리 ( 공방회원 )
	@Override
	public int isEmailDuplicate_partner(String email) {
		int n = sqlsession.selectOne("member.isEmailDuplicate_partner", email);
		return n;
	}
	
	// MEMBER 테이블의 idle 컬럼의 값을 1로 변경
	@Override
	public int updateIdlePartner(String userid) {
		int n = sqlsession.update("member.updateIdlePartner", userid);
		return n;
	}
	
	// 로그인 처리 ( 공방회원 )
	@Override
	public PartnerVO getLoginPartner(Map<String, String> paraMap) {
		PartnerVO loginuser2 = sqlsession.selectOne("member.getLoginPartner", paraMap);
		return loginuser2;
	}
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	@Override
	public String confirmThroughMemberIdEmail(Map<String, String> paraMap) {
		String memberId = sqlsession.selectOne("member.confirmThroughMemberIdEmail", paraMap);
		return memberId;
	}
	
	
	@Override
	public String confirmThroughPartnerIdEmail(Map<String, String> paraMap) {
		String partnerId = sqlsession.selectOne("member.confirmThroughPartnerIdEmail", paraMap);
		return partnerId;
	}
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	
	
	// 비밀번호 변경 ( 일반회원 )
	@Override
	public int changeMemberPwd(HashMap<String, String> paraMap) {
		int n = sqlsession.update("member.changeMemberPwd", paraMap);
		return n;
	}

	// 비밀번호 변경 ( 공방회원 )
	@Override
	public int changePartnerPwd(HashMap<String, String> paraMap) {
		int n = sqlsession.update("member.changePartnerPwd", paraMap);
		return n;
	}
	
	
	
	
			
	
	
	
	
	// ====== 홍용훈 끝 =========================================== //
	
	// ====== 박준엽 시작 =========================================== //

	@Override
	public List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> proposalList = sqlsession.selectList("member.getProposalListByUserId", paraMap);
		return proposalList;
	}

	@Override
	public MemberVO getUserInfoByUserId(String userid) {
		MemberVO mvo = sqlsession.selectOne("member.getUserInfoByUserId", userid);
		return mvo;
	}

	@Override
	public int updateMemberInfoByMVO(MemberVO mvo) {
		int n = sqlsession.update("member.updateMemberInfoByMVO", mvo);
		return n;
	}

	@Override
	public int updateMemberPwd(MemberVO mvo) {
		int n = sqlsession.update("member.updateMemberPwd", mvo);
		return n;
	}
	
	@Override
	public List<HashMap<String, String>> getOrderListByUserId(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> orderList = sqlsession.selectList("member.getOrderListByUserId", paraMap);
		return orderList;
	}
	
	@Override
	public int getTotalCountForOrderListByUserId(String userId) {
		int n = sqlsession.selectOne("member.getTotalCountForOrderListByUserId", userId);
		return n;
	}
	
	@Override
	public int getTotalCountProposalListByUserId(String userId) {
		int n = sqlsession.selectOne("member.getTotalCountProposalListByUserId", userId);
		return n;
	}

	@Override
	public int getReviewCntByOrderNum(String orderNum) {
		int n = sqlsession.selectOne("member.getReviewCntByOrderNum", orderNum);
		return n;
	}

	@Override
	public List<WholeImgVO> getWholeImgListByOrderDetailNum(String orderDetailNum) {
		List<WholeImgVO> wholeImgList = sqlsession.selectList("member.getWholeImgListByOrderDetailNum", orderDetailNum);
		return wholeImgList;
	}

	@Override
	public List<DetailImgVO> getDetailImgListByOrderDetailNum(String orderDetailNum) {
		List<DetailImgVO> detailImgList = sqlsession.selectList("member.getDetailImgListByOrderDetailNum", orderDetailNum);
		return detailImgList;
	}

	@Override
	public int getFixedPhotoNum() {
		int pkNum = sqlsession.selectOne("member.getFixedPhotoNum");
		return pkNum;
	}

	@Override
	public void insertReview(HashMap<String, Object> paraMap) {
		sqlsession.insert("member.insertReview", paraMap);
	}

	@Override
	public void insertFixedPhoto(HashMap<String, Object> imgParaMap) {
		sqlsession.insert("member.insertFixedPhoto", imgParaMap);
		
	}

	@Override
	public int getCurrReviewIdByOrderDetailNum(String orderDetailNum) {
		int reviewId = sqlsession.selectOne("member.getCurrReviewIdByOrderDetailNum", orderDetailNum);
		return reviewId;
	}

	@Override
	public HashMap<String, String> getOrderNumAndCraftNumByOrderDetailNum(String orderDetailNum) {
		HashMap<String, String> paraMap = sqlsession.selectOne("member.getOrderNumAndCraftNumByOrderDetailNum", orderDetailNum);
		return paraMap;
	}

	@Override
	public int deleteReviewByOrderNum(String orderNum) {
		int n = sqlsession.delete("member.deleteReviewByOrderNum", orderNum);
		return n;
	}





	
	// ====== 박준엽 끝 =========================================== //
	
	
	
	
	
	// ====== 이지현 시작 =========================================== //
	
	
	@Override
	public int delete_user_end(Map<String, String> paraMap) {
		int i = sqlsession.selectOne("member.delete_user_end", paraMap);
		return i;
	}

	@Override
	public int delete_user_info(String user_id_pk) {
		int i = sqlsession.update("member.delete_user_info", user_id_pk);
		return i;
	}

	
	// ====== 이지현 끝 =========================================== //
	
	
	
	
}
