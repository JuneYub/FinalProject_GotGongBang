package com.spring.gotgongbang.member.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO implements InterMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 회원가입
	@Override
	public void insertMember(MemberVO membervo) {
		sqlsession.insert("member.insertMember", membervo);
	}

	// 이메일 중복 확인 AJAX 요청 처리
	@Override
	public int isEmailDuplicate(String email) {
		int n = sqlsession.selectOne("member.isEmailDuplicate", email);
		return n;
	}

	// 아이디 중복 확인 AJAX 요청 처리
	@Override
	public int isIdDuplicate(String id) {
		int n = sqlsession.selectOne("member.isIdDuplicate", id);
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
	public void recordLoginDate(String userid, Timestamp loginDate) {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("loginDate", loginDate);
        sqlsession.insert("member.recordLoginDate", paraMap);
	}

	
	
}
