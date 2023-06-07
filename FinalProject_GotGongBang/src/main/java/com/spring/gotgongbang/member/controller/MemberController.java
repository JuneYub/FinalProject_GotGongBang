package com.spring.gotgongbang.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
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
import com.spring.gotgongbang.craft.model.PartnerVO;
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

		@RequestMapping(value="/proposal_list.got")
		public ModelAndView proposalList(ModelAndView mav, HttpServletRequest request) {
			String userId = "testMember"; // 테스트를 위해서 유저아이디를 지정해준 것 이후에는 세션을 통해서 지정할 예정
		    int startRno = 1;
		    int endRno = 5;
		    
		    HashMap<String, String> paraMap = new HashMap<String, String>();
		    paraMap.put("userId", userId);
		    paraMap.put("startRno", String.valueOf(startRno));
		    paraMap.put("endRno", String.valueOf(endRno));
		    
			request.getParameter("startRno");
			request.getParameter("endRno");
			
			List<HashMap<String, String>> proposalList = service.getProposalListByUserId(paraMap);
			
			mav.addObject("proposalList", proposalList);
			mav.setViewName("member/proposal_list.tiles1");
			return mav;
		}
		
		@RequestMapping(value="/edit_user_info.got")
		public ModelAndView editUserInfo(ModelAndView mav, HttpServletRequest request) {
		      String userid = "testMember"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
		      
		      MemberVO mvo = new MemberVO();
		      mvo = service.getUserInfoByUserId(userid);
		      mav.addObject("mvo", mvo);
		      mav.setViewName("member/editUserInfo.tiles1");
		      return mav;
		}
		
		@RequestMapping(value="/edit_user_info_end.got")
		public ModelAndView editUserInfoEnd(ModelAndView mav, HttpServletRequest request, MemberVO mvo) {
			int n = 0;
		    n = service.updateMemberInfoByMVO(mvo);
		      
		    if(mvo.getPwd() != null && mvo.getPwd() != "") {
		       n = service.updateMemberPwd(mvo);
		    }
		    String message = "";
		    String loc = "";
		      
		    if (n == 1) {
		       message = "정상적으로 변경되었습니다.";
		       loc = request.getContextPath()+"/index.got";
		    }
		      
		    else {
		       message = "오류가 발생했습니다";
		       loc ="javascript:history.back();";
		    }

		    request.setAttribute("message", message);
	     	request.setAttribute("loc", loc);
		    mav.setViewName("msg");
			
			
			return mav;
		}
		
		@ResponseBody
		@RequestMapping(value="/update_user_pwd.got")
		public String updateUserPwd(HttpServletRequest request) {
			String userId = "testMember"; // 테스트를 위해서 유저아이디를 지정해준 것 이후에는 세션을 통해서 지정할 예정
			  String editPw = request.getParameter("editPw"); 
			  
		      MemberVO mvo = new MemberVO();
		      mvo = service.getUserInfoByUserId(userId);
		      int n = 0;

		      if(editPw.equals(mvo.getPwd())) {
		    	  n = 2;
		      }
		      else {
		    	  mvo.setPwd(editPw);
		          n = service.updateMemberPwd(mvo);
		      }
		      
		      JSONObject jsonObj = new JSONObject();
		      jsonObj.put("n", n);
			  return jsonObj.toString();
		}
		
		
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
