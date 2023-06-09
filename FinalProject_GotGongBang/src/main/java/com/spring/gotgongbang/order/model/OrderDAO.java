package com.spring.gotgongbang.order.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


@Service
public class OrderDAO implements InterOrderDAO {


	@Resource
	private SqlSessionTemplate sqlsession;
	

	
	
	// ================ 이지현 시작 ==================//
	
	
	// 셀렉트 할 것 갖고 오기
	@Override
	public List<TypesVO> select_types() {
		
		List<TypesVO> typesList = sqlsession.selectList("order.select_types");
		return typesList;
	}



	// 선택한 품목 종류에 따라 요청사항 리스트 가져오기
	@Override
	public List<TypesVO> bring_request_list(String type_code_pk) {
		
		List<TypesVO> requestList = sqlsession.selectList("order.bring_request_list",type_code_pk);
		return requestList;
	}


	// 견적 요청 넣기
	@Override
	public int insert_order(Map<String, String> mapOrder) {
		
		int n1 = sqlsession.insert("order.insert_order", mapOrder);
		return n1;
	}


	// 주문번호 갖고오기
	@Override
	public int select_order_num_pk(Map<String, String> mapOrder) {
		
		int order_num_pk = sqlsession.selectOne("order.select_order_num_pk",mapOrder);
		return order_num_pk;
	}


	// 전체 사진 반복문으로 추가하기
	@Override
	public int insert_whole_img(Map<String, Object> wholeMap) {
		
		int whole1 = sqlsession.insert("order.insert_whole_img", wholeMap);
		return whole1;
	}


	// 상세 사진 반복문으로 추가하기
	@Override
	public int insert_detail_img(Map<String, Object> detailMap) {
		int detail1 = sqlsession.insert("order.insert_detail_img", detailMap);
		return detail1;
	}


	// 요청사항 목록들 반복문으로 추가하기
	@Override
	public int insert_detail_request_list(Map<String, Integer> request_list_map) {
		int request_list_num1 = sqlsession.insert("order.insert_detail_request_list", request_list_map);
		return request_list_num1;
	}
	
	
	// 견적서번호를 가지고 정보 가져오기
	@Override
	public HashMap<String, String> get_estimate_info(String estimate_num_pk) {
		
		HashMap<String, String> paymentInfo = sqlsession.selectOne("order.get_estimate_info",estimate_num_pk);
		return paymentInfo;
	}


	// 공방번호를 가지고 공방이름 가져오기
	@Override
	public String get_craft_name(int craftNum) {
		
		String craftName = sqlsession.selectOne("order.get_craft_name",craftNum);
		return craftName;
	}


	// orderDetail 테이블에 주문정보 넣어주기
	@Override
	public int insertOrderDetail(Map<String, String> paraMap) {
		int i = sqlsession.insert("order.insertOrderDetail",paraMap);
		return i;
	}


	// 견적서번호를 가지고 주문상세 정보 가져오기
	@Override
	public OrderDetailVO get_order_detail_info(String estimate_num_fk) {
		
		OrderDetailVO orderDetailInfo = sqlsession.selectOne("order.get_order_detail_info", estimate_num_fk);
		return orderDetailInfo;
	}


	// 테이블 estimate에 있는 order_status 1로 바꿔주기
	@Override
	public int updateOrderStatus(String estimate_num_pk) {
		
		int k = sqlsession.update("order.updateOrderStatus",estimate_num_pk);
		return k;
	}


	// order_num_fk 가져오기
	@Override
	public String getOrderNumPk(String estimate_num_pk) {
		String order_num_fk = sqlsession.selectOne("order.getOrderNumPk",estimate_num_pk);
		return order_num_fk;
	}


	// order_status가 0이면서 order_num_fk가 해당 번호인 얘들 전부 삭제하기
	@Override
	public int deleteEstimate(String order_num_fk) {
		int j = sqlsession.delete("order.deleteEstimate",order_num_fk);
		return j;
	}

	// 견적요청번호를 가지고 대표사진 이름 가져오기
	@Override
	public String get_img_name(int string) {
		
		String img_name = sqlsession.selectOne("order.get_img_name",string);
		return img_name;
	}
	
	// ================ 이지현 끝 ==================//

	
}
