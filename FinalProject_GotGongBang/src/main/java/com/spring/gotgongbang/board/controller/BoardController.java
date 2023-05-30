package com.spring.gotgongbang.board.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/Boardinquiry.got")
    public ModelAndView getBoardinquiry(ModelAndView mav) {
		
		mav.setViewName("/board/board_inquiry.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value="/BoardNotice.got")
    public ModelAndView getBoardNotice(ModelAndView mav) {
		
		mav.setViewName("/board/board_Notice.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value="/BoardQuestion.got")
    public ModelAndView getBoardQuestion(ModelAndView mav) {
		
		mav.setViewName("/board/board_BoardQuestion.tiles1");
		
		return mav;
	}
	
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
