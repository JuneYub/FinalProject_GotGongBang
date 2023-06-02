package com.spring.gotgongbang.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired    //Type에 따라 알아서 Bean을 주입해준다.
	private InterAdminService service;   //이름은 내 멋대로!
	
	
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
