package com.spring.gotgongbang.board.model;

import java.util.List;

public interface InterBoardDAO {
	
	// 파일 첨부 기능이 없는 온라인 문의 데이터 넣기
	int add(InquiryVO iqvo);
	
	// 파일 첨부 기능이 있는 온라인 문의
	int add_withFile(InquiryVO iqvo);
	
	// 질문게시판 데이터 넘기기
	List<InquiryVO> BoardQuestionList();
	
	
	

}
