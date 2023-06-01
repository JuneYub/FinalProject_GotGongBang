package com.spring.gotgongbang.order.model;

public class RequestListVO {
	
	private int request_num_pk;
	private int detail_type_fk;
	private int order_num_fk;
	
	public int getRequest_num_pk() {
		return request_num_pk;
	}
	public void setRequest_num_pk(int request_num_pk) {
		this.request_num_pk = request_num_pk;
	}
	public int getDetail_type_fk() {
		return detail_type_fk;
	}
	public void setDetail_type_fk(int detail_type_fk) {
		this.detail_type_fk = detail_type_fk;
	}
	public int getOrder_num_fk() {
		return order_num_fk;
	}
	public void setOrder_num_fk(int order_num_fk) {
		this.order_num_fk = order_num_fk;
	}
	
}
