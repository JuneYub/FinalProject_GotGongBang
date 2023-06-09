package com.spring.gotgongbang.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 질문게시판 데이터 넘기기
	@Override
	public List<InquiryVO> BoardQuestionList() {
		List<InquiryVO> iqList = sqlsession.selectList("board.BoardQuestionList");
		return iqList;
	}

	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InquiryVO> iqListSearchWithPaging(Map<String, String> paraMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InquiryVO getView(Map<String, String> paraMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setAddReadCount(String inquiry_num_pk) {
		// TODO Auto-generated method stub
		
	}

	/*
	@Override
	public int insertReview(HashMap<String, String> paraMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	*/
	
	
	
	
}
