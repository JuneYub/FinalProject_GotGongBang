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
	
	
	// 이미지 테이블들
	private List<MultipartFile> whole_img_name;		//전체이미지
	private List<MultipartFile> detail_img_name;	//상세이미지
	
	
	// 요청사항
	private List<Integer> detail_type_fk;	// 수선유형번호 리스트

	
	
	
	
	

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


	public List<MultipartFile> getWhole_img_name() {
		return whole_img_name;
	}


	public void setWhole_img_name(List<MultipartFile> whole_img_name) {
		this.whole_img_name = whole_img_name;
	}


	public List<MultipartFile> getDetail_img_name() {
		return detail_img_name;
	}


	public void setDetail_img_name(List<MultipartFile> detail_img_name) {
		this.detail_img_name = detail_img_name;
	}


	public List<Integer> getDetail_type_fk() {
		return detail_type_fk;
	}


	public void setDetail_type_fk(List<Integer> detail_type_fk) {
		this.detail_type_fk = detail_type_fk;
	}

	/////////////////// ====== 이지현 끝 ===== ///////////////////////

	
	
	
}




