package com.spring.gotgongbang.admin.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.gotgongbang.craft.model.CraftVO;

@Repository
public class AdminDAO implements InterAdminDAO{
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
	@Override
	public String getLoginMember(Map<String, String> paraMap) {
		String loginuser_id = sqlsession.selectOne("admin.getLoginMember", paraMap);   //1명만 select해오기 때문에 selectOne()을 사용한다. paraMap속에 아이디와 비번이 포함되어있다.
		return loginuser_id;
	}



	
	// ==== ==================================== 김나윤 끝 ======================================================= // 

	
	
	
	
	
	
	// ==== ==================================== 김진솔 시작 ======================================================= // 

	// 공방 목록
	@Override
	public List<CraftVO> selectCraftList() {
		List<CraftVO> craftList = sqlsession.selectList("admin.selectCraftList");
		return craftList;
	}

	//공방 한 개 보기
	@Override
	public CraftVO craftOneView(String craft_num_pk) {
		CraftVO craftvo = sqlsession.selectOne("admin.craftOneView",craft_num_pk);
		return craftvo;
	}
	
	// ==== ==================================== 김진솔 끝 ======================================================= // 

}
