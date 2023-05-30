package com.spring.gotgongbang.member.model;

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

}
