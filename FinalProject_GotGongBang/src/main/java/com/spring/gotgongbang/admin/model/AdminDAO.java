package com.spring.gotgongbang.admin.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO{
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
	@Override
	public boolean loginCheck(AdminVO avo) throws Exception {
		String name = sqlsession.selectOne("admin.login_check", avo);
        
        //조건식 ? true일때의 값 : false일때의 값
        return (name==null) ? false : true;
	}
	
	
	// ==== ==================================== 김나윤 끝 ======================================================= // 
	
}
