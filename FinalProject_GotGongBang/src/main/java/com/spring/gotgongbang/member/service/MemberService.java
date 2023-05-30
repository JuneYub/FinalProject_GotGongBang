package com.spring.gotgongbang.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.member.model.InterMemberDAO;
import com.spring.gotgongbang.member.model.MemberVO;



@Service
public class MemberService implements InterMemberService {

	@Autowired
	private InterMemberDAO dao;

	// 회원가입 Service
	@Override
	public void insertMember(MemberVO membervo) {
		dao.insertMember(membervo);
	}
}
