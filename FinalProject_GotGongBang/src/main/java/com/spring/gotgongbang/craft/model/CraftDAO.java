package com.spring.gotgongbang.craft.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CraftDAO implements InterCraftDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // remote_FinalProject_2 에 연결 

	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		PartnerVO pvo = sqlsession.selectOne("gotgongbang.getPartnerInfoByUserId", userid);
		return pvo;
	}
	
	
}
