package com.spring.gotgongbang.craft.service;

import java.util.HashMap;
import java.util.List;
import com.spring.gotgongbang.craft.model.CraftVO;

import java.util.Map;

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.order.model.OrderVO;

public interface InterCraftService {
	
	// ==== ==================================== 김진솔 시작 ======================================================= // 

	//이미 존재하는 '공방이름'인지 알아오기 위한 것
	int craft_check_name(String craft_name);

	//공방 신청정보를 DB에 insert해주는 기능
	int add_withFile(CraftVO cvo);

	
	// ==== ==================================== 김진솔 끝 ======================================================= // 

	
	
	
	
	

	// ==== ==================================== 박준엽 시작 ======================================================= // 

	PartnerVO getPartnerInfoByUserId(String userid);
	
	int updatePartnerInfo(PartnerVO pvo);

	int updatePartnerPwd(PartnerVO pvo);

	List<OrderVO> getAllOrders(Map<String, String> paraMap);

	int getTotalCountForEstimate();

	OrderVO getOrderInfoByOrderNum(String orderNum);
	
	String getCraftNumByPartnerId(String partnerId);
	
	int insertEstimate(HashMap<String, String> paraMap);
	
	int checkEstimateExists(HashMap<String, String> paraMap);
	
	List<HashMap<String, String>> getRepariListBycraftNum(HashMap<String, String> paraMap);
	
	int getTotalCountForRepairList(String craftNum);
	
	int updateStateByOrderNum(HashMap<String, String> paraMap);
	
	
	// ==== ==================================== 박준엽 끝 ======================================================= //

	
	
	
	

	
	
	// ==== ==================================== 김나윤 시작 ======================================================= // 

	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	List<CraftVO> crafts_list_select();
	
	//수선사 찾기 페이지에서 간략히 수선사 목록 보여주기
	List<CraftVO> crafts_sum_select();

	//수선사 상세페이지를 보여주기 위해 공방정보 조회해오기
	CraftVO craftDetail(int craft_num_pk);

	//수선사 찾기 페이지에서 상단 최근입점공방을 알아오기
	List<CraftVO> crafts_new_select();

	// 검색정보를 가지고 공방정보 가져오기
	List<CraftVO> wordSearchShow(Map<String, String> paraMap);

	//공방상세페이지 후기정보 가져오기
	List<Map<String, Object>> review_select(int craft_num_pk);

	// 공방 정보를 등록하지 않으면 공방회원가입 불가
	int del_partner(PartnerVO pvo);
	
	// ==== ==================================== 김나윤 끝 ======================================================= // 

	
	
	
	// ==== ==================================== 이지현 시작 ======================================================= // 
	
	boolean delete_partner_end(Map<String, String> paraMap);

	int delete_partner_info(String user_id_pk);
	
	// ==== ==================================== 이지현 끝 ======================================================= // 
}
