package com.spring.gotgongbang.order.model;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class OrderDetailVO {

	
	/////////////////// ====== 이지현 시작 ===== ///////////////////////
	private String order_detail_id_pk; 		//주문상세번호
	private int estimate_num_fk; 			//견적서번호
	private String order_date; 				//주문날짜
	private String order_post_code; 		//우편번호
	private String order_address; 			//주소
	private String order_detail_address; 	//상세주소
	private String order_extra_address; 	//부가주소
	private String product_status; 			//상품진행상태
	private String order_name; 				//주문자명
	private String order_num; 			//주문자전화번호
	private int payment;				//금액
	
	
	
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public String getOrder_detail_id_pk() {
		return order_detail_id_pk;
	}
	public void setOrder_detail_id_pk(String order_detail_id_pk) {
		this.order_detail_id_pk = order_detail_id_pk;
	}
	public int getEstimate_num_fk() {
		return estimate_num_fk;
	}
	public void setEstimate_num_fk(int estimate_num_fk) {
		this.estimate_num_fk = estimate_num_fk;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_post_code() {
		return order_post_code;
	}
	public void setOrder_post_code(String order_post_code) {
		this.order_post_code = order_post_code;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_detail_address() {
		return order_detail_address;
	}
	public void setOrder_detail_address(String order_detail_address) {
		this.order_detail_address = order_detail_address;
	}
	public String getOrder_extra_address() {
		return order_extra_address;
	}
	public void setOrder_extra_address(String order_extra_address) {
		this.order_extra_address = order_extra_address;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_mobile) {
		this.order_num = order_mobile;
	}
	
	
	
	

	
	/////////////////// ====== 이지현 끝 ===== ///////////////////////
	
	
	
	
}




