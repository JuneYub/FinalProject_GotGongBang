package com.spring.gotgongbang.index.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.member.model.ReviewVO;

@Repository
public class IndexDAO implements InterIndexDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;

	// 김나윤 시작 ===========================================================================
	// 김나윤 끝 ===========================================================================
	
	// 김진솔 시작 ===========================================================================
	// 김진솔 끝 ===========================================================================
	
	// 박준엽 시작 ===========================================================================
	@Override
	public List<CraftVO> getlatestCraftList() {
		List<CraftVO> craftList = sqlsession.selectList("index.getlatestCraftList");
		return craftList;
	}
	
	@Override
	public List<HashMap<String, Object>> getReviewList() {
		List<HashMap<String, Object>> reviewList = sqlsession.selectList("index.getReviewList");
		return reviewList;
	}
	// 박준엽 끝 ===========================================================================


	
	// 오준혁 시작 ===========================================================================
	// 오준혁 끝 ===========================================================================
	
	// 이지현 시작 ===========================================================================
	// 이지현 끝 ===========================================================================
	
	// 홍용훈 시작 ===========================================================================
	// 홍용훈 끝 ===========================================================================
}
