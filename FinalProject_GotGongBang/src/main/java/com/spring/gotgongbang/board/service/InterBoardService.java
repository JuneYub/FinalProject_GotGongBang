package com.spring.gotgongbang.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.model.NoticeVO;

public interface InterBoardService {

	
	
		
		// 김나윤 시작 ===========================================================================
		// 김나윤 끝 ===========================================================================
		
		// 김진솔 시작 ===========================================================================
		// 김진솔 끝 ===========================================================================
		
		// 박준엽 시작 ===========================================================================
		// 박준엽 끝 ===========================================================================
		
		// 오준혁 시작 ===========================================================================
		
		// 파일 첨부 기능이 없는 온라인 문의 데이터 넣기
		int add(InquiryVO iqvo);
		
		// 파일 첨부 기능이 있는 온라인 문의
		int add_withFile(InquiryVO iqvo);
		
		// 질문게시판 데이터 넘기기
		List<InquiryVO> BoardQuestionList();
		
		// 총 게시물 건수
		int getTotalCount(Map<String, String> paraMap);
		
		// 페이징 처리한 글목록 가져오기
		List<InquiryVO> iqListSearchWithPaging(Map<String, String> paraMap);
		
		// 조회수 증가 함께 게시글 조회
		InquiryVO getView(Map<String, String> paraMap);
		
		// 조회수 증가 없이 게시글 조회
		InquiryVO getViewWithNoAddCount(Map<String, String> paraMap);
		
		// 게시글  수정 페이지 완료하기 
		int edit(InquiryVO iqvo);

		// 게시글 삭제하기
		int del(Map<String, String> paraMap);
		
		// Faq 질문자 제목 조회
		List<InquiryVO> getFaq();
		// Faq admin 답글 조회
		List<InquiryVO> getFaqin();
		
		
		
		// 공지사항 - 게시물 건 수 구하기
		int getnoTotalCount(Map<String, String> paraMap);
		// 공지사항 - 페이징 처리한 게시물
		List<NoticeVO> noiqListSearchWithPaging(Map<String, String> paraMap);
		// 공지사항 글쓰기 완료
		int add_notice(NoticeVO novo);
		// 공지사항 조회수 증가와 함께 게시글 조회
		NoticeVO getnotiView(Map<String, String> paraMap);
		// 공지사항 조회수 증가 없음
		NoticeVO getnotiViewWithNoAddCount(Map<String, String> paraMap);
		// 공지사항 수정 완료
		int notiedit(NoticeVO novo);
		// 공지사항 삭제 완료
		int notidel(Map<String, String> paraMap);
				
	
		// 오준혁 끝 ===========================================================================
		
		// 이지현 시작 ===========================================================================
		// 이지현 끝 ===========================================================================
		
		// 홍용훈 시작 ===========================================================================
		// 홍용훈 끝 ===========================================================================
	
	
}
