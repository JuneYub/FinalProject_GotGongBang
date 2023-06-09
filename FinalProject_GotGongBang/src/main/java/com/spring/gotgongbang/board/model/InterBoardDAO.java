package com.spring.gotgongbang.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterBoardDAO {
	
	// 파일 첨부 기능이 없는 온라인 문의 데이터 넣기
	int add(InquiryVO iqvo);
	
	// 파일 첨부 기능이 있는 온라인 문의
	int add_withFile(InquiryVO iqvo);
	
	// 질문게시판 데이터 넘기기
	List<InquiryVO> BoardQuestionList();
	
	// 총 게시물 건수 구하기
	int getTotalCount(Map<String, String> paraMap);
	
	// 페이징 처리한 글목록 가져오기
	List<InquiryVO> iqListSearchWithPaging(Map<String, String> paraMap);
	
	// 1개 조회하기 
	InquiryVO getView(Map<String, String> paraMap);
	// 글조회수 1증가하기
	void setAddReadCount(String inquiry_num_pk);

//	int insertReview(HashMap<String, String> paraMap);
	
	// 게시글  수정 페이지 완료하기
	int edit(InquiryVO iqvo);
	
	// 게시글 삭제하기
	int del(Map<String, String> paraMap);
	
	// Faq 조회
	List<InquiryVO> getFaq();
	
	
	
	

}
