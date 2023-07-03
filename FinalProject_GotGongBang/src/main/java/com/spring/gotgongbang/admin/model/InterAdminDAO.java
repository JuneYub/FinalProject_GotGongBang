package com.spring.gotgongbang.admin.model;

import java.util.List;
import java.util.Map;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.member.model.ReviewVO;


public interface InterAdminDAO {

	// ==== ==================================== 김나윤 시작 ======================================================= // 
	//로그인 처리하기
	String getLoginMember(Map<String, String> paraMap);

	
	// ==== ==================================== 김나윤 끝 ======================================================= // 


	
	
	
	// ==== ==================================== 김진솔 시작 ======================================================= // 
	
	// 공방 목록 가져오기
	//List<CraftVO> selectCraftList();

	// 공방 한 개 보기
	CraftVO craftOneView(String craft_num_pk);

	// 공방 한 개마다 공방사진, 대표자사진, 자격증사진 select하기
	List<Map<String, String>> selectImgList(String craft_num_pk);

	//공방 정보 수정을 위해 공방 정보 조회해오기
	CraftVO craft_edit_view(String craft_num_pk);
	
	//공방 한 개 보기  (대표자이름, 연락처, 한줄소개, 경력기간) 수정 
	int craft_edit(CraftVO cvo);

	//공방 한 개 삭제
	int craft_del(Map<String, String> paraMap);

	//공방목록 페이징처리
	int getTotalCraftCount();
	
	//공방목록 페이징처리2
	List<CraftVO> getCraftListWithPaging(Map<String, String> paraMap);

	//공방 평균 별점 가져오기
	long craftRating(String craft_num_pk);



	// ==== ==================================== 김진솔 끝 ======================================================= // 

}
