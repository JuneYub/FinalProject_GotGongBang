package com.spring.gotgongbang.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.HomeController;
import com.spring.gotgongbang.common.Sha256;
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
	
		// === 로그인 폼 페이지 요청 === //
		@RequestMapping(value="/login.got", method= {RequestMethod.GET})
		public ModelAndView login(ModelAndView mav) {
			
			mav.setViewName("member/login.tiles1");
			return mav;
	
		}
		
		
		@RequestMapping(value="/end_login.got")
		public ModelAndView end_login(ModelAndView mav, HttpServletRequest request) {
			
			String userid = request.getParameter("userid");
		    String pwd = request.getParameter("pwd");

		    Map<String, String> paraMap = new HashMap<>();
		    paraMap.put("userid", userid);
		    paraMap.put("pwd", Sha256.encrypt(pwd));

		    // service의 loginEnd() 메서드 호출하여 로그인 처리
		    mav = service.loginEnd(mav, request, paraMap);
	    
		    return mav;
		}
		
		
		@RequestMapping(value="/register_member.got")
		public ModelAndView register_member(ModelAndView mav) {
			
			mav.setViewName("member/register_member.tiles1");
			return mav;
	
		}
		
		
		// 이메일 중복 확인 AJAX 요청 처리
		@ResponseBody
		@GetMapping("/check_email.got")	    
	    public boolean checkEmail(@RequestParam("email") String email) {
	        return service.isEmailDuplicate(email);
	    }
	    
	    // 아이디 중복 확인 AJAX 요청 처리
	    @ResponseBody
	    @GetMapping("/check_id.got")
	    public boolean checkId(@RequestParam("id") String id) {
	        return service.isIdDuplicate(id);
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
			
			System.out.println("들어옴");
			service.encryptPassword(membervo);
			
			service.insertMember(membervo);
			
			return "redirect:/end_login.got";
		}
		
		@RequestMapping(value="/find_id.got")
		public ModelAndView find_id(ModelAndView mav) {
			
			mav.setViewName("member/find_id.tiles1");
			return mav;
		}
		
		@RequestMapping(value="/find_pwd.got")
		public ModelAndView find_pwd(ModelAndView mav) {
			
			mav.setViewName("member/find_pwd.tiles1");
			return mav;
		}
		// 홍용훈 끝
		// ===========================================================================
}
