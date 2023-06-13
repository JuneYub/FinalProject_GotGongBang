package com.spring.gotgongbang.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.model.InterBoardDAO;
import com.spring.gotgongbang.board.model.NoticeVO;
import com.spring.gotgongbang.common.FileManager;

@Service
public class BoardService implements InterBoardService {
	
	// === #34. 의존객체 주입하기(DI : Dependency Injection) ===
		@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
		private InterBoardDAO dao;

		
		@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
		private FileManager fileManager;
		

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
			
			// 원글쓰기, 답변인지 구분
			if("".equals(iqvo.getFk_seq())) {
				int groupno = dao.getGroupno_max() + 1;
				iqvo.setGroupno(String.valueOf(groupno));
			}
			int n = dao.add(iqvo);
			return n;
		}

		// 파일 첨부 기능이 있는 온라인 문의
		@Override
		public int add_withFile(InquiryVO iqvo) {
			
			if("".equals(iqvo.getFk_seq())) {
				int groupno = dao.getGroupno_max() + 1;
				iqvo.setGroupno(String.valueOf(groupno));
			}
			
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
		
		// 게시글을 조회하면서 조회수 1 증가.
		@Override
		public InquiryVO getView(Map<String, String> paraMap) {
			
			InquiryVO iqvo = dao.getView(paraMap); // 글1개 조회하기
		//	System.out.println("service 확인용 iqvo" + iqvo);
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

		
		// 게시글  수정 페이지 완료하기
		@Override
		public int edit(InquiryVO iqvo) {
			int n = dao.edit(iqvo);
			return n;
		}
		
		// 게시글 삭제하기
		@Override
		public int del(Map<String, String> paraMap) {
			int n =dao.del(paraMap);
			
			// 파일첨부 게시물이라면 파일 삭제
			if(n==1) {
				String path = paraMap.get("path");
				String inquiry_fileName = paraMap.get("inquiry_fileName");
				
				if( inquiry_fileName !=null && !"".equals(inquiry_fileName) ) {
					try {
						fileManager.doFileDelete(inquiry_fileName, path);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
			return n;
		}
		
		// Faq 조회
		@Override
		public List<InquiryVO> getFaq() {
			List<InquiryVO> iqvo = dao.getFaq();
			return iqvo;
		}
		// Faq admin 답글 조회
		@Override
		public List<InquiryVO> getFaqin() {
			List<InquiryVO> iqvoin = dao.getFaqin();
			return iqvoin;
		}
		
		/////////////////////////////////////////////////////////////	
		
		// 공지사항 - 게시물 건 수 구하기
		@Override
		public int getnoTotalCount(Map<String, String> paraMap) {
			int n =dao.getnoTotalCount(paraMap);
			return n;
		}
		
		// 공지사항 - 페이징 처리한 게시물
		@Override
		public List<NoticeVO> noiqListSearchWithPaging(Map<String, String> paraMap) {

			List<NoticeVO> novo = dao.noiqListSearchWithPaging(paraMap);
			
			return novo;
		}
		// 공지사항 글쓰기 완료
		@Override
		public int add_notice(NoticeVO novo) {
			int n = dao.add_notice(novo);
			return n;
		}
		// 공지사항 조회수 증가와 함께 게시글 조회
		@Override
		public NoticeVO getnotiView(Map<String, String> paraMap) {
			
				NoticeVO novo = dao.getnotiView(paraMap); 
			
				String login_userid = paraMap.get("login_userid");
				
				
				if(login_userid != null && novo != null &&
				   !login_userid.equals(novo.getAdmin_id_fk()) ) { 
				  
				   dao.setAddReadCount(novo.getNotice_num_pk()); 
				   novo = dao.getnotiView(paraMap);	
				}
				
				return novo;
		}
		
		// 공지사항 조회수 증가 없음
		@Override
		public NoticeVO getnotiViewWithNoAddCount(Map<String, String> paraMap) {
			
			NoticeVO novo = dao.getnotiView(paraMap);
			
			return novo;
		}
		
		// 공지사항 수정 완료
		@Override
		public int notiedit(NoticeVO novo) {
			int n = dao.notiedit(novo);
			return n;
		}

		
		/////////////////////////////////////////////////////////////	
		
		
		// 오준혁 끝 ===========================================================================
		
		// 이지현 시작 ===========================================================================
		// 이지현 끝 ===========================================================================
		
		// 홍용훈 시작 ===========================================================================
		// 홍용훈 끝 ===========================================================================
	
}
