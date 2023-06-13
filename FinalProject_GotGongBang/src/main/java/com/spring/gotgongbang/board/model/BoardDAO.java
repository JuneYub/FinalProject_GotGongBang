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
	//	System.out.println("DAO iqvo 확인용" + iqvo);
		return iqvo;
	}
	
	// 글조회수 1증가하기
	@Override
	public void setAddReadCount(String inquiry_num_pk) {
		sqlsession.update("board.setAddReadCount", inquiry_num_pk);
	}
	
	// 게시글  수정 페이지 완료하기
	@Override
	public int edit(InquiryVO iqvo) {
		int n = sqlsession.update("board.edit", iqvo);
		return n;
	}
	
	// 게시글 삭제하기
	@Override
	public int del(Map<String, String> paraMap) {
		int n = sqlsession.delete("board.del", paraMap);
		return n;
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	// Faq 조회
	@Override
	public List<InquiryVO> getFaq() {
		List<InquiryVO> iqvo = sqlsession.selectList("board.getFaq");
		return iqvo;
	}
	// Faq admin 답글 조회
		@Override
		public List<InquiryVO> getFaqin() {
		List<InquiryVO> iqvoin = sqlsession.selectList("board.getFaqin");
		return iqvoin;
	}
	
	///////////////////////////////////////////////////////////////////////////	
	
	// groupno 의 최대값 알아오기
	@Override
	public int getGroupno_max() {
		int maxgroupno = sqlsession.selectOne("board.getGroupno_max");
		return maxgroupno;
	}
	
	
	////////////////////////////////// 공지사항 /////////////////////////////////////////	
	
	// 공지사항 - 게시물 건 수 구하기
	@Override
	public int getnoTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.getnoTotalCount", paraMap);
		return n;
	}
	
	// 공지사항 - 페이징 처리한 게시물
	@Override
	public List<NoticeVO> noiqListSearchWithPaging(Map<String, String> paraMap) {
		List<NoticeVO> novo = sqlsession.selectList("board.noiqListSearchWithPaging", paraMap);
		return novo;
	}
	// 공지사항 글쓰기 완료
	@Override
	public int add_notice(NoticeVO novo) {
		int n = sqlsession.insert("board.add_notice", novo);
		return n;
	}
	
	// 공지사항 조회수 증가와 함께 게시글 조회
	@Override
	public NoticeVO getnotiView(Map<String, String> paraMap) {
		
		NoticeVO novo = sqlsession.selectOne("board.getnotiView",paraMap);
		
		return novo;
		
	}
	
	// 공지사항 수정 완료
	@Override
	public int notiedit(NoticeVO novo) {
		int n = sqlsession.update("board.notiedit", novo);
		return n;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
}
