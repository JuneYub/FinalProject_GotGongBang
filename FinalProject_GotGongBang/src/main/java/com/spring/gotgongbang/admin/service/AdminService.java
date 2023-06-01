package com.spring.gotgongbang.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.admin.model.AdminVO;
import com.spring.gotgongbang.admin.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService{
	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
	// === #34. 의존객체 주입하기(DI : Dependency Injection) ===
	@Autowired    //Type에 따라 알아서 Bean을 주입해준다.
	private InterAdminDAO dao;
	
	
	@Override    //로그인 체크 관련 메소드 (세션에 아이디와 비밀번호를 저장함)
    public boolean loginCheck(AdminVO avo, HttpSession session) throws Exception {
        
        boolean result = dao.loginCheck(avo);
        
        if(result) {    //로그인 성공
            
            session.setAttribute("admin_id_pk", avo.getAdmin_id_pk());
            session.setAttribute("admin_pwd", avo.getAdmin_pwd());
            
        }
        
        return result;
    }

	// ==== ==================================== 김나윤 끝 ======================================================= // 
	
}
