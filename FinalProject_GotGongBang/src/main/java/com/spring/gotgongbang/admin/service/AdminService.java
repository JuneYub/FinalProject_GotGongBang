package com.spring.gotgongbang.admin.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.admin.model.AdminVO;
import com.spring.gotgongbang.admin.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService{
	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
	// === #34. 의존객체 주입하기(DI : Dependency Injection) ===
	@Autowired    //Type에 따라 알아서 Bean을 주입해준다.
	private InterAdminDAO dao;
	
/*	
	@Override    //로그인 체크 관련 메소드 (세션에 아이디와 비밀번호를 저장함)
    public boolean loginCheck(AdminVO avo, HttpSession session) throws Exception {
        
        boolean result = dao.loginCheck(avo);
        
        if(result) {    //로그인 성공
            
        	//세션에 아이디, 비밀번호 값 저장하기
            session.setAttribute("admin_id_pk", avo.getAdmin_id_pk());
            session.setAttribute("admin_pwd", avo.getAdmin_pwd());
            
        }
        
        return result;
    }
*/

	@Override
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap) {
		
		AdminVO loginuser = dao.getLoginMember(paraMap);  //map을 넘겨준다.
		
		if(loginuser == null) {  //로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
			//  /WEB-INF/views/msg.jsp 파일을 생성한다.
		}
		
		else { //아이디와 암호가 존재하는 경우
			
				//로그인 되어지면 세션에 정보를 넣어두어야 한다.
				HttpSession session = request.getSession();
				//메모리에 생성되어져 있는 session을 불러오는 것이다.
				
				session.setAttribute("loginuser", loginuser);
				// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
				
					
				// 로그인을 해야만 접근할 수 있는 페이지에 로그인을 하지 않은 상태에서 접근을 시도한 경우 
                // "먼저 로그인을 하세요!!" 라는 메시지를 받고서 사용자가 로그인을 성공했다라면
                // 화면에 보여주는 페이지는 시작페이지로 가는 것이 아니라
                // 조금전 사용자가 시도하였던 로그인을 해야만 접근할 수 있는 페이지로 가기 위한 것이다.
				String goBackURL = (String)session.getAttribute("goBackURL");
				
				if(goBackURL != null) {
					mav.setViewName("redirect:"+goBackURL);
					session.removeAttribute("goBackURL");  //세션에서 반드시 제거해주어야 한다.
				}
				else {
					mav.setViewName("redirect:/index.got");  //로그인 되지마자 시작페이지로 이동. 나중에 goback 쓸 거!
				}
			}
				
		return mav;
			
		}


	
	// ==== ==================================== 김나윤 끝 ======================================================= // 
	
}
