package com.spring.gotgongbang.order.model;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class OrderVO {

	
	/////////////////// ====== 이지현 시작 ===== ///////////////////////

	private int order_num_pk;		// 견적요청번호 
	private String user_id_fk;		//아이디
	private String order_date;		// 요청날짜
	private String brand_name;		//브랜드
	private String request_explain;	//수선요청사항설명
	private String requests;		// 수선요청사항들
	private String orderer; 		// 견적 요청 하신 분 이름
	private String order_product_type; // 견적 요청에 대한 품목명
	
	// 이미지 테이블들
	private List<WholeImgVO> wholeImgList;		//전체이미지
	private List<DetailImgVO> detailImgList;	//상세이미지
	

	public int getOrder_num_pk() {
		return order_num_pk;
	}


	public void setOrder_num_pk(int order_num_pk) {
		this.order_num_pk = order_num_pk;
	}


	public String getUser_id_fk() {
		return user_id_fk;
	}


	public void setUser_id_fk(String user_id_fk) {
		this.user_id_fk = user_id_fk;
	}


	public String getOrder_date() {
		return order_date;
	}


	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}


	public String getBrand_name() {
		return brand_name;
	}


	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}


	public String getRequest_explain() {
		return request_explain;
	}


	public void setRequest_explain(String request_explain) {
		this.request_explain = request_explain;
	}


	public String getRequests() {
		return requests;
	}


	public void setRequests(String requests) {
		this.requests = requests;
	}


	public List<WholeImgVO> getWholeImgList() {
		return wholeImgList;
	}


	public void setWholeImgList(List<WholeImgVO> wholeImgList) {
		this.wholeImgList = wholeImgList;
	}


	public List<DetailImgVO> getDetailImgList() {
		return detailImgList;
	}


	public void setDetailImgList(List<DetailImgVO> detailImgList) {
		this.detailImgList = detailImgList;
	}


	public String getOrderer() {
		return orderer;
	}


	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}


	public String getOrder_product_type() {
		return order_product_type;
	}


	public void setOrder_product_type(String order_product_type) {
		this.order_product_type = order_product_type;
	}



	

	
	/////////////////// ====== 이지현 끝 ===== ///////////////////////
	
	
	
	
}




