package com.spring.gotgongbang.craft.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CarftDAO implements InterCraftDAO {


	@Resource
	private SqlSessionTemplate sqlsession;

	
	
	// ================ 김진솔 시작 ==================//
	
	// 공방이름 중복체크를 위한 공방이름 조회해오기
	@Override
	public int craft_check_name(String craft_name) {
		int n = sqlsession.selectOne("craft.craft_check_name", craft_name);
		return n;		//n은 0 또는 1 (없/있)
	}
	
	
	
	// ================ 김진솔 끝 ==================//

	
}
