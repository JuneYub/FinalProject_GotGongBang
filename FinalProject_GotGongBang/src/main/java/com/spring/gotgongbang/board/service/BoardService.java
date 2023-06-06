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
		
		// 조회수 증가 
		@Override
		public InquiryVO getView(Map<String, String> paraMap) {
			
			InquiryVO iqvo = dao.getView(paraMap); // 글1개 조회하기
			
			String login_userid = paraMap.get("login_userid");
			// paraMap.get("login_userid") 은 로그인을 한 상태이라면 로그인한 사용자의 userid 이고,
			// 로그인을 하지 않은 상태이라면 paraMap.get("login_userid") 은 null 이다. 
			
			if(login_userid != null && iqvo != null &&
			   !login_userid.equals(iqvo.getUser_id_fk()) ) { 
			   // 글조회수 증가는 로그인을 한 상태에서 다른 사람의 글을 읽을때만 증가하도록 한다. 
				
			   dao.setAddReadCount(iqvo.getInquiry_num_pk()); // 글조회수 1증가하기
			   iqvo = dao.getView(paraMap);	
			}
			
			return iqvo;
		}
		
		// 조회수 증가 없이 게시글 조회
		@Override
		public InquiryVO getViewWithNoAddCount(Map<String, String> paraMap) {
			
			InquiryVO iqvo = dao.getView(paraMap);
			
			return iqvo;
		}
		
		
		
		// 오준혁 끝 ===========================================================================
		
		// 이지현 시작 ===========================================================================
		// 이지현 끝 ===========================================================================
		
		// 홍용훈 시작 ===========================================================================
		// 홍용훈 끝 ===========================================================================
	
}
