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
	/*
	@Override
	 public List<CraftVO> selectCraftList() {
		List<CraftVO> craftList = sqlsession.selectList("admin.selectCraftList");
		return craftList;
	}
	*/
	
	//공방 한 개 보기
	@Override
	public CraftVO craftOneView(String craft_num_pk) {
		CraftVO craftvo = sqlsession.selectOne("admin.craftOneView",craft_num_pk);
		return craftvo;
	}

	// 공방 한 개마다 공방사진, 대표자사진, 자격증사진 select하기
	@Override
	public List<Map<String, String>> selectImgList(String craft_num_pk) {
		List<Map<String, String>> imgList = sqlsession.selectList("admin.selectImgList",craft_num_pk);
		return imgList;
	}


	//공방 정보 수정을 위해 공방 정보 조회해오기
	@Override
	public CraftVO craft_edit_view(String craft_num_pk) {
		CraftVO cvo = sqlsession.selectOne("admin.craft_edit_view", craft_num_pk);
		return cvo;
	}
	
	//공방 한 개 보기  (대표자이름, 연락처, 한줄소개, 경력기간) 수정 
	@Override
	public int craft_edit(CraftVO cvo) {
		int n = sqlsession.update("admin.craft_edit", cvo);
		return n;
	}
	
	//공방 한 개 삭제
	@Override
	public int craft_del(Map<String, String> paraMap) {
		int n = sqlsession.delete("admin.craft_del", paraMap);
		return n;
	}

	//공방 목록 페이징처리
	@Override
	public int getTotalCraftCount() {
		int totalCount = sqlsession.selectOne("admin.getTotalCraftCount");
		return totalCount;
	}
	
	//공방 목록 페이징처리2
	@Override
	public List<CraftVO> getCraftListWithPaging(Map<String, String> paraMap) {
		List<CraftVO> craftList = sqlsession.selectList("admin.getCraftListWithPaging",paraMap);
		return craftList;

	}

	//공방 평균 별점 가져오기
	@Override
	public long craftRating(String craft_num_pk) {
		long review_avg = sqlsession.selectOne("admin.craftRating", craft_num_pk);
		return review_avg;
	}





	
	// ==== ==================================== 김진솔 끝 ======================================================= // 

}
