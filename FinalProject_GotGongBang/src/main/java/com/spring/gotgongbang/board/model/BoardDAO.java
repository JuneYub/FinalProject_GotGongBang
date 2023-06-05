package com.spring.gotgongbang.board.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 파일 첨부 기능이 없는 온라인 문의 데이터 넣기
	@Override
	public int add(InquiryVO iqvo) {
		int n = sqlsession.insert("board.add", iqvo);
		return n;
	}

	// 파일 첨부 기능이 있는 온라인 문의
	@Override
	public int add_withFile(InquiryVO iqvo) {
		
		int n = sqlsession.insert("board.add_withFile", iqvo);
		return n;
		
	}
	
	
}
