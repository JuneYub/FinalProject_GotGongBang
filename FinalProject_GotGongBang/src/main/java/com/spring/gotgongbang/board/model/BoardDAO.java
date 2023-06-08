package com.spring.gotgongbang.board.model;

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
	
	// 총 게시물 건수 구하기
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.getTotalCount", paraMap);
		return n;
	}
	
	// 페이징 처리한 글목록 가져오기
	@Override
	public List<InquiryVO> iqListSearchWithPaging(Map<String, String> paraMap) {
		List<InquiryVO> iqList = sqlsession.selectList("board.iqListSearchWithPaging", paraMap);
		return iqList;
	}
	
	// 1개 조회하기 
	@Override
	public InquiryVO getView(Map<String, String> paraMap) {
		InquiryVO iqvo = sqlsession.selectOne("board.getView",paraMap);
		return iqvo;
	}
	
	// 글조회수 1증가하기
	@Override
	public void setAddReadCount(String inquiry_num_pk) {
		sqlsession.update("board.setAddReadCount", inquiry_num_pk);
	}
	
	
	
	
	
	
}
