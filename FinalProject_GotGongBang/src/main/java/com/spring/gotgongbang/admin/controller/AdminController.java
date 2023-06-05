package com.spring.gotgongbang.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.admin.model.AdminVO;
import com.spring.gotgongbang.admin.service.AdminService;
import com.spring.gotgongbang.admin.service.InterAdminService;
import com.spring.gotgongbang.common.Sha256;
import com.spring.gotgongbang.member.controller.MemberController;

@Component
@Controller
public class AdminController {

	// 김진솔 시작
	// ===========================================================================

	@RequestMapping(value = "/craft_list.got")
	public ModelAndView craftList(ModelAndView mav) {
		mav.setViewName("admin/craftList.tiles1");
		return mav;
	}
	

	@RequestMapping(value = "/craft_view.got")
	public ModelAndView craftView(ModelAndView mav) {
		mav.setViewName("admin/craftView.tiles1");
		return mav;
	}
	
	// 김진솔 끝
	// ===========================================================================

	

	// 김나윤 시작
	// ===========================================================================
	@Autowired   
	private InterAdminService service; 
	
	//LoggerFactory 사용시 
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);  //로깅을 위한 변수
	
/*	
	//관리자 로그인 페이지에서 관리자 아이디와 패스워드를 입력후 로그인 버튼을 누를시에 맵핑되는 메소드
    //관리자 로그인을 할 수 있도록 한다.
    @RequestMapping(value="/admin_login.got")
    public ModelAndView admin_login(String admin_id_pk, String admin_pwd, HttpSession session) throws Exception {
        
        //로그인 체크도 같이 함
        AdminVO avo = new AdminVO();
        
        
        avo.setAdmin_id_pk(admin_id_pk);
        avo.setAdmin_pwd(admin_pwd);
        
        //로그인 체크를 하기위한 메소드, 로그인 체크후 결과를 result 변수에 넣는다.
        boolean result = service.loginCheck(avo, session);
        ModelAndView mav = new ModelAndView();
        
        
        if(result) {  //로그인이 성공했을시 출력되는 구문
            mav.setViewName("admin/admin_index.tiles1");    //로그인이 성공했을시 이동하게되는 뷰의 이름
            mav.addObject("admin_id_pk", session.getAttribute(admin_id_pk));
        }
        else if(session.getAttribute(admin_id_pk) == null) {    //로그인 실패 했을시 출력
                
            //로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함
            mav.setViewName("admin/admin_login.tiles1");
            
            //뷰에 전달할 값
            mav.addObject("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
        
        }
	
	        return mav;
	}
*/
	
	
	
	// === 1-1. 로그인 폼 페이지 요청 === //
	@RequestMapping(value="/admin_login.got", method={RequestMethod.GET})
	public ModelAndView login(ModelAndView mav) {
		
		mav.setViewName("admin/admin_login.tiles1");  //view단 페이지 나타내기. tiles를 사용하겠다!
	    //   /WEB-INF/views/tiles1/login/loginform.jsp 페이지를 만들어야 한다.
		return mav;
	}
	
	
	// === 1-2. 로그인 폼 페이지 요청 === //
	@RequestMapping(value="/admin_login.got", method= {RequestMethod.POST})
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request) {
		
		String userid = request.getParameter("userid");  //클라이언트가 입력한 아이디 값을 알아옴
		String pwd = request.getParameter("pwd");        //클라이언트가 입력한 비번 값을 알아옴
		
		Map<String, String> paraMap = new HashMap<String, String>();  //아이디, 비번을 Map에 담아 넘겨줌
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd));  //이때 비번 값은 암호화하여 전달함
//		System.out.println(Sha256.encrypt(pwd));
		//e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
		
		mav = service.loginEnd(mav, request, paraMap);  //서비스단의 loginEnd메소드 
		return mav;   //ModelAndView의 리턴값은 mav
	}
	
	
	// === 2. 로그아웃 처리하기 === //
	@RequestMapping(value="/logout.action")
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {
		
		//로그아웃시 시작페이지로 돌아가는 것임.
		HttpSession session = request.getSession(); 
		session.invalidate();  //세션을 완전히 비워준다.
		
		String message = "로그아웃 되었습니다!";
		String loc = "javascript:history.back()";
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");  //무조건 시작페이지로
	    //  /WEB-INF/views/msg.jsp
		
		return mav;
	}
	
	
		
	// 김나윤 끝
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
	// 홍용훈 끝
	// ===========================================================================
}
