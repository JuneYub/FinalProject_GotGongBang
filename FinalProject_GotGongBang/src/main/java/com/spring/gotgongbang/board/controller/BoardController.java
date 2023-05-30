package com.spring.gotgongbang.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.spring.gotgongbang.board.model.InquiryVO;
import com.sun.media.jai.util.Service;

@Component
@Controller
public class BoardController {

	
	
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
