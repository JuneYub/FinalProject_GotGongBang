package com.spring.gotgongbang.craft.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.OrderVO;
import com.sun.mail.handlers.image_gif;


@Repository
public class CarftDAO implements InterCraftDAO {


	@Resource
	private SqlSessionTemplate sqlsession;

	
	
	// ================ 김진솔 시작 ==================//
	
	
	
	
	// 이미 존재하는 '공방이름'인지 알아오기 위한 것
	@Override
	public int craft_check_name(String craft_name) {
		int n = sqlsession.selectOne("craft.craft_check_name", craft_name);
		return n;		//n은 0 또는 1 (없/있)
	}
	
	//공방 신청시 추가이미지 파일이 존재할때 select해오는 용도
	/*@Override
	public List<CraftVO> craft_add_image() {
		List<CraftVO> AddimgList = sqlsession.selectList("craft.craft_add_image");
		return AddimgList;
	}*/
	
	//공방 신청정보를 DB에 insert해주는 기능
	@Override
	public int add_withFile(CraftVO cvo) {
		int n = sqlsession.insert("craft.add_withFile", cvo);
		return n;
	}
	

	// 공방 정보를 등록하지 않으면 공방회원가입 불가
	@Override
	public int del_partner(PartnerVO pvo) {
		int m = sqlsession.delete("craft.del_partner", pvo);
		return m;
	}
	
	// ================ 김진솔 끝 ==================//

	
	
	
	
	// =============== 박준엽 시작 =================//
	
	// 파트너 개인정보 변경을 위한 정보 가져오기
	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		PartnerVO pvo = sqlsession.selectOne("craft.getPartnerInfoByUserId", userid);
		return pvo;
	}


	@Override
	public int updatePartnerInfo(PartnerVO pvo) {
		int n = sqlsession.update("craft.updatePartnerInfo", pvo);
		return n;
	}


	@Override
	public int updatePartnerPwd(PartnerVO pvo) {
		int n = sqlsession.update("craft.updatePartnerPwd", pvo);
		return n;
	}
	
	@Override
	public List<OrderVO> getAllOrders(Map<String, String> paraMap) {
		List<OrderVO> ovoList = sqlsession.selectList("craft.getAllOrders", paraMap);
		return ovoList;
	}
	
	@Override
	public int getTotalCountForEstimate() {
		int totalCountForEstimate = sqlsession.selectOne("craft.getTotalCountForEstimate");
		return totalCountForEstimate;
	}
	
	@Override
	public OrderVO getOrderInfoByOrderNum(String orderNum) {
		OrderVO ovo = sqlsession.selectOne("craft.getOrderInfoByOrderNum", Integer.parseInt(orderNum));
		return ovo;
	}
	
	@Override
	public String getCraftNumByPartnerId(String partnerId) {
		String craftNum = sqlsession.selectOne("craft.getCraftNumByPartnerId", partnerId);
		return craftNum;
	}
	
	@Override
	public int insertEstimate(HashMap<String, String> paraMap) {
		return sqlsession.insert("craft.insertEstimate", paraMap);
	}
	
	@Override
	public int checkEstimateExists(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("craft.checkEstimateExists", paraMap);
		return n;
	}
	
	@Override
	public int getTotalCountForRepairList(String craftNum) {
		int totalCount = sqlsession.selectOne("craft.getTotalCountForRepairList", craftNum);
		return totalCount;
	}

	@Override
	public int updateStateByOrderNum(HashMap<String, String> paraMap) {
		return sqlsession.update("craft.updateStateByOrderNum", paraMap);
	}
	
	@Override
	public List<HashMap<String, String>> getRepariListBycraftNum(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> paraMapList = sqlsession.selectList("craft.getRepariListBycraftNum", paraMap);
		return paraMapList;
	}
	

	
	
	// =============== 박준엽 끝 =================//
	
	
	
	
	
	
	
	
	// ================ 김나윤 시작 ==================//
	
	// 공방 목록을 보여주기 위해 공방정보 조회해오기
	@Override
	public List<CraftVO> crafts_list_select() {
		List<CraftVO> craftvo = sqlsession.selectList("craft.crafts_list_select");
		return craftvo;
	}

	//수선사 찾기 페이지에서 간략히 수선사 목록 보여주기
	@Override
	public List<CraftVO> crafts_sum_select() {
		List<CraftVO> craftvo = sqlsession.selectList("craft.crafts_sum");
		return craftvo;
	}
	
	//수선사 상세페이지를 보여주기 위해 공방정보 조회해오기
	@Override
	public CraftVO crafts_detail_select(int craft_num_pk) {
		CraftVO craftvo = sqlsession.selectOne("craft.craft_detail", craft_num_pk);
	//	System.out.println(craftvo);
		return craftvo;
	}

	//수선사 찾기 페이지에서 상단 최근입점공방을 알아오기
	@Override
	public List<CraftVO> crafts_new_select() {
		List<CraftVO> craftvo = sqlsession.selectList("craft.craft_new");
		return craftvo;
	}

	// 검색정보를 가지고 공방정보 가져오기
	@Override
	public List<CraftVO> wordSearchShow(Map<String, String> paraMap) {
		List<CraftVO> craftvo_list = sqlsession.selectList("craft.wordSearchShow", paraMap);
		return craftvo_list;
	}

	//공방상세페이지 후기정보 가져오기
	@Override
	public List<Map<String, Object>> review_select(int craft_num_pk) {
		List<Map<String, Object>> paraMap = sqlsession.selectList("craft.review_select", craft_num_pk);
		return paraMap;
	}

	//filename에서 공방 사진 1개만 잘라서 가지고 오기
	@Override
	public List<CraftVO> crafts_img_select() {
		List<CraftVO> craftvo = sqlsession.selectList("craft.crafts_img");
		return craftvo;
	}


	// ================ 김나윤 끝 ==================//
	
	
	
	// ====== 이지현 시작 =========================================== //
	
	
	@Override
	public int delete_partner_end(Map<String, String> paraMap) {
		int i = sqlsession.selectOne("craft.delete_partner_end", paraMap);
		return i;
	}

	@Override
	public int delete_partner_info(String user_id_pk) {
		int i = sqlsession.update("craft.delete_partner_info", user_id_pk);
		return i;
	}

	
	// ====== 이지현 끝 =========================================== //
	
}
