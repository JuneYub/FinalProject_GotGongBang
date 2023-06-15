package com.spring.gotgongbang.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.admin.model.AdminDAO;
import com.spring.gotgongbang.admin.model.AdminVO;
import com.spring.gotgongbang.craft.model.CraftVO;

public interface InterAdminService {
	
	// ==== ==================================== 김나윤 시작 ======================================================= // 
	
	ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap);
	
	// ==== ==================================== 김나윤 끝 ======================================================= // 

	
	
	
	
	// ==== ==================================== 김진솔 시작 ======================================================= // 
	// 공방 목록 가져오기
	//List<CraftVO> selectCraftList();

	// 공방 한 개 보기 페이지
	CraftVO craftOneView(String craft_num_pk);

	//공방 한 개 보기 공방사진,대표자사진,자격증사진 파일 다운로드하기
	List<Map<String, String>> selectImgList(String craft_num_pk);

	//공방 정보 수정을 위해 글 조회해오기
	CraftVO craft_edit_view(String craft_num_pk);

	//공방 한 개 보기  (대표자이름, 연락처, 한줄소개, 경력기간) 수정 
	int craft_edit(CraftVO cvo);

	//공방 한 개 정보 삭제
	int craft_del(Map<String, String> paraMap);

	//공방 목록 페이징처리
	int getTotalCraftCount();

	//공방 목록 페이징처리2
	List<CraftVO> getCraftListWithPaging(Map<String, String> paraMap);

	// ==== ==================================== 김진솔 끝 ======================================================= // 

}
