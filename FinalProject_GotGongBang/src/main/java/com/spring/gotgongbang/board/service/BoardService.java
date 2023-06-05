package com.spring.gotgongbang.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.model.InterBoardDAO;

@Service
public class BoardService implements InterBoardService {
	
	// === #34. 의존객체 주입하기(DI : Dependency Injection) ===
		@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
		private InterBoardDAO dao;

		

		// 김나윤 시작 ===========================================================================
		// 김나윤 끝 ===========================================================================
		
		// 김진솔 시작 ===========================================================================
		// 김진솔 끝 ===========================================================================
		
		// 박준엽 시작 ===========================================================================
		// 박준엽 끝 ===========================================================================
		
		// 오준혁 시작 ===========================================================================
		
		
		// 파일 첨부 기능이 없는 온라인 문의 데이터 넣기
		@Override
		public int add(InquiryVO iqvo) {
			int n = dao.add(iqvo);
			return n;
		}

		// 파일 첨부 기능이 있는 온라인 문의
		@Override
		public int add_withFile(InquiryVO iqvo) {
			int n = dao.add_withFile(iqvo); // 첨부파일이 있는 경우  
			return n;
		}
		
		// 질문게시판 데이터 넘기기
		@Override
		public List<InquiryVO> BoardQuestionList() {
			List<InquiryVO> iqList = dao.BoardQuestionList();
			return iqList;
		}
		
		// 총 게시물 건수 구하기
		@Override
		public int getTotalCount(Map<String, String> paraMap) {
			int n =dao.getTotalCount(paraMap);
			return n;
		}
		
		// 페이징 처리한 글목록 가져오기
		@Override
		public List<InquiryVO> iqListSearchWithPaging(Map<String, String> paraMap) {
			
			List<InquiryVO> iqList = dao.iqListSearchWithPaging(paraMap);
			
			return iqList;
		}
		
		
		
		// 오준혁 끝 ===========================================================================
		
		// 이지현 시작 ===========================================================================
		// 이지현 끝 ===========================================================================
		
		// 홍용훈 시작 ===========================================================================
		// 홍용훈 끝 ===========================================================================
	
}
