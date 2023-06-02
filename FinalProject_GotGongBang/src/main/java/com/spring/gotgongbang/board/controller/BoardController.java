package com.spring.gotgongbang.board.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.service.InterBoardService;
import com.spring.gotgongbang.common.FileManager;
import com.sun.media.jai.util.Service;

@Component
@Controller
public class BoardController {

	@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterBoardService service;
	
	@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;
	
	// 김진솔 시작
		// ===========================================================================
		// 김진솔 끝
		// ===========================================================================

	
	// 김나윤 시작
		// ===========================================================================
		// 김나윤 끝
		// ===========================================================================

	// 박준엽 시작
		// ===========================================================================

		// 박준엽 끝
		// ===========================================================================

	// 오준혁 시작
	// ===========================================================================
	
	// 고객센터 페이지 불러오기
	@RequestMapping(value="/Boardinquiry.got")
	public ModelAndView getBoardInquiry(ModelAndView mav) {
		
		mav.setViewName("/board/board_inquiry.tiles1");
		
		return mav;		
	
	}
	
	// 공지사항 페이지 불러오기
	@RequestMapping(value="/BoardNotice.got")
    public ModelAndView getBoardNotice(ModelAndView mav) {
		
		mav.setViewName("/board/board_Notice.tiles1");
		
		return mav;
	}
	
	// 질문게시판 페이지 불러오기
	@RequestMapping(value="/BoardQuestion.got")
    public ModelAndView getBoardQuestion(ModelAndView mav) {
		
		mav.setViewName("/board/board_BoardQuestion.tiles1");
		
		return mav;
	}
	
	// FAQ 페이지 불러오기
	@RequestMapping(value="/BoardFaq.got")
    public ModelAndView getBoardFaq(ModelAndView mav) {
		
		mav.setViewName("/board/board_BoardFaq.tiles1");
		
		return mav;
	}
	
	// 온라인 문의 완료
	@RequestMapping(value="/BoardinquiryEnd.got", method={RequestMethod.POST})
	public ModelAndView pointPlus_iqEnd(Map<String, String> paraMap, ModelAndView mav, InquiryVO iqvo, MultipartHttpServletRequest request) {
		
		MultipartFile attach = iqvo.getAttach();
		
		if( !attach.isEmpty() ) {
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			
			System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root);
			// ~~~~ 확인용 webapp 의 절대경로 => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FinalProject_GotGongBang\
			
			String path = root+"resources"+File.separator+"files";
			
			 String newFileName = "";
			   // WAS(톰캣)의 디스크에 저장될 파일명 
			   
			   byte[] bytes = null;
			   // 첨부파일의 내용물을 담는 것
			   
			   long fileSize = 0;
			   // 첨부파일의 크기
			   
			   try {
					bytes = attach.getBytes();
					// 첨부파일의 내용물을 읽어오기
					
					String originalFilename = attach.getOriginalFilename();
					
			      System.out.println("~~~~ 확인용 originalFilename => " + originalFilename); 
				    // ~~~~ 확인용 originalFilename => LG_싸이킹청소기_사용설명서.pdf
					
					newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
					// 첨부되어진 파일을 업로드 하는 것이다.
					
			 		System.out.println(" === 확인용  newFileName => " + newFileName); 
				    // === 확인용  newFileName => 202306011525152650695539266000.pdf
				
					iqvo.setInquiry_fileName(newFileName);
					// WAS(톰캣)에 저장된 파일명(20230522103642842968758293800.pdf)
					
					iqvo.setInquiry_orgFilename(originalFilename);
					// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
					// 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
					
					fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
					iqvo.setInquiry_fileSize(String.valueOf(fileSize));
				
			   } catch (Exception e) {
				e.printStackTrace();
			   }
		}
		
		// 파일 첨부가 있는 온라인문의
		
		int n = 0;
		
		if( attach.isEmpty() ) {
			// 파일첨부가 없는 경우
			n = service.add(iqvo);
		}
		else {
			// 파일첨부가 있는 경우
			n = service.add_withFile(iqvo);
		}
		
		if(n==1) {
			mav.setViewName("/board/board_BoardQuestion.tiles1");
			
		}
		else {
			mav.setViewName("/board/board_BoardInquiery.tiles1");
		}
		
		// 파일 첨부 기능 없이 온라인 문의 데이터값 넘겨보기
		/*
		   int n = service.add(iqvo);
		  
		   mav.setViewName("/board/board_BoardQuestion.tiles1");
		*/
		
		return mav;
	}
	
		// 오준혁 끝
		// ===========================================================================

	// 이지현 시작
		// ===========================================================================
		// 이지현 끝
		// ===========================================================================

	// 홍용훈 시작
		// ===========================================================================
		// 홍용훈 끝
		// ===========================================================================
	
	
	
}
