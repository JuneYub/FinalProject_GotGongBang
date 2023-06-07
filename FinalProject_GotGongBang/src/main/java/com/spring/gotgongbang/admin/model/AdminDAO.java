package com.spring.gotgongbang.admin.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO{
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
/*
	@Override
	public boolean loginCheck(AdminVO avo) throws Exception {
		String name = sq                  lsession.selectOne("admin.login_check", avo);
        
        //조건식 ? true일때의 값 : false일때의 값
        return (name==null) ? false : true;
	}
*/
	
	
	// === #46. 로그인 처리하기 === //
	@Override
	public String getLoginMember(Map<String, String> paraMap) {
		String loginuser_id = sqlsession.selectOne("admin.getLoginMember", paraMap);   //1명만 select해오기 때문에 selectOne()을 사용한다. paraMap속에 아이디와 비번이 포함되어있다.
		return loginuser_id;
	}
	
	// ==== ==================================== 김나윤 끝 ======================================================= // 
	
}
