package com.spring.gotgongbang.craft.service;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.board.model.InterBoardDAO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;
import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.OrderVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;


@Service
public class CratfService implements InterCraftService {

	@Autowired
	private InterCraftDAO cdao;
	
	
	// =============== 박준엽 시작 ==================== //
	
	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		PartnerVO pvo = new PartnerVO();
		pvo = cdao.getPartnerInfoByUserId(userid);
		return pvo;
	}
	
	@Override
	public int updatePartnerInfo(PartnerVO pvo) {
		int n = cdao.updatePartnerInfo(pvo);
		return n;
	}
	
	@Override
	public int updatePartnerPwd(PartnerVO pvo) {
		int n = cdao.updatePartnerPwd(pvo);
		return n;
	}
	
	@Override
	public List<OrderVO> getAllOrders(Map<String, String> paraMap) {
		List<OrderVO> ovoList = cdao.getAllOrders(paraMap);
		return ovoList;
	}
	
	@Override
	public int getTotalCountForEstimate() {
		int totalCountForEstimate = cdao.getTotalCountForEstimate(); 
		return totalCountForEstimate;
	}
	
	@Override
	public OrderVO getOrderInfoByOrderNum(String orderNum) {
		OrderVO ovo = cdao.getOrderInfoByOrderNum(orderNum);
		return ovo;
	}
	
	@Override
	public String getCraftNumByPartnerId(String partnerId) {
		String craftNum = cdao.getCraftNumByPartnerId(partnerId);
		return craftNum;
	}
	
	@Override
	public int insertEstimate(HashMap<String, String> paraMap) {
		int n = cdao.insertEstimate(paraMap);
		return n;
	}
	
	@Override
	public int checkEstimateExists(HashMap<String, String> paraMap) {
		int n = cdao.checkEstimateExists(paraMap);
		return n;
	}
	
	@Override
	public List<HashMap<String, String>> getRepariListBycraftNum(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> paraMapList = cdao.getRepariListBycraftNum(paraMap);
		return paraMapList;
	}
	
	@Override
	public int getTotalCountForRepairList(String craftNum) {
		int totalCount = cdao.getTotalCountForRepairList(craftNum);
		return totalCount;
	}
	
	@Override
	public int updateStateByOrderNum(HashMap<String, String> paraMap) {
		int n = cdao.updateStateByOrderNum(paraMap);
		return n;
	}
	
	

	// =============== 박준엽 끝 ==================== // 
	
	
	
	
	
	
	
	// ================ 김진솔 시작 ================== //
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	@Override
	public int craft_check_name(String craft_name) {
		int n = cdao.craft_check_name(craft_name);	//n은 0 또는 1
		return n;
	}
	
	//공방 신청시 추가이미지 파일이 존재할때 select해오는 용도
	/*@Override
	public List<CraftVO> craft_add_image() {
		 List<CraftVO> AddimgList = cdao.craft_add_image();
		 return AddimgList;
	}*/
	
	
	//공방 신청정보를 DB에 insert해주는 기능
	@Override
	public int add_withFile(CraftVO cvo) {
		int n  = cdao.add_withFile(cvo);
		return n;
	}

	

	// 공방 정보를 등록하지 않으면 공방회원가입 불가
	@Override
	public int del_partner(PartnerVO pvo) {
		int m = cdao.del_partner(pvo);
		return m;
	}

	// ================ 김진솔 끝 ================== //
	
	
	
	
	
	
	
	
	
	
	
	// ================ 김나윤 시작 ================== //
	
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_list_select() {
		List<CraftVO> craftvo = cdao.crafts_list_select();
		return craftvo;
	}

	//수선사 상세정보 조회하기
	@Override
	public CraftVO craftDetail(int craft_num_pk) {
		CraftVO craftvo = cdao.crafts_detail_select(craft_num_pk);
	//	System.out.println(craftvo);
		return craftvo;
	}

	//수선사 찾기 페이지에 신규입점공방 보여주기
	@Override
	public List<CraftVO> crafts_new_select() {
		List<CraftVO> craftnewvo = cdao.crafts_new_select();
		return craftnewvo;
	}

	// 검색정보를 가지고 공방정보 가져오기
	@Override
	public List<CraftVO> wordSearchShow(Map<String, String> paraMap) {
		List<CraftVO> craftvo_list  = cdao.wordSearchShow(paraMap);
		return craftvo_list;
	}

	//공방상세페이지 후기정보 가져오기
	@Override
	public List<Map<String, Object>> review_select(int craft_num_pk) {
		List<Map<String, Object>> paraMap = cdao.review_select(craft_num_pk);
		return paraMap;
	}
	
	//수선사 찾기 페이지에서 간략히 수선사 목록 보여주기
	@Override
	public List<CraftVO> crafts_sum_select() {
		List<CraftVO> craftvo = cdao.crafts_sum_select();
		return craftvo;
	}


  
  
  
  
  
  


	
	
	// ================ 김나윤 끝 ================== //
}
