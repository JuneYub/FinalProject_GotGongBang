package com.spring.gotgongbang.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.HomeController;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.member.service.InterMemberService;
import com.spring.gotgongbang.member.service.MailSendService;

@Component
@Controller
public class MemberController {
		// 김나윤 시작
		// ===========================================================================
		// 김나윤 끝
		// ===========================================================================

		// 김진솔 시작
		// ===========================================================================
		// 김진솔 끝
		// ===========================================================================

		// 박준엽 시작
		// ===========================================================================

		
		
		
		// 박준엽 끝
		// ===========================================================================

		// 오준혁 시작
		// ===========================================================================
		// 오준혁 끝
		// ===========================================================================

		// 이지현 시작
		// ===========================================================================
		// 이지현 끝
		// ===========================================================================

		// 홍용훈 시작
		// ===========================================================================
	
		private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	
		@Autowired
		private MailSendService mailService;
		@Autowired
		private InterMemberService service;
	
		@RequestMapping(value="/login.got")
		public ModelAndView login(ModelAndView mav) {
			
			mav.setViewName("member/login.tiles1");
			return mav;
	
		}
		
		@RequestMapping(value="/register_member.got")
		public ModelAndView register_member(ModelAndView mav) {
			
			mav.setViewName("member/register_member.tiles1");
			return mav;
	
		}
		
		@RequestMapping(value="/end_login.got")
		public ModelAndView end_login(ModelAndView mav) {
			
			mav.setViewName("member/end_login.tiles1");
			return mav;
	
		}
		
		// 이메일 인증
		@ResponseBody
	    @RequestMapping(value="/member/email_check.got")
		public String email_check(String email) {
			
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			
			return mailService.joinEmail(email);
			
		}
		
		// 회원가입 get
		@RequestMapping(value="/register.got", method=RequestMethod.GET)
		public void register() {
			
		}
		
		// 회원가입 post
		@RequestMapping(value="/register.got", method=RequestMethod.POST)
		public String register(MemberVO membervo) {
			
			service.insertMember(membervo);
			
			return "redirect:/end_login.got";
		}
		// 홍용훈 끝
		// ===========================================================================
}
