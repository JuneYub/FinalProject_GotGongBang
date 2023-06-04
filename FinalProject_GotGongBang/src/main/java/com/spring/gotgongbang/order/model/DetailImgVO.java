package com.spring.gotgongbang.order.model;


public class DetailImgVO {
	private int detail_img_num_pk;
	private int order_num_fk;
	private String detail_img_name;
	public int getDetail_img_num_pk() {
		return detail_img_num_pk;
	}
	public void setDetail_img_num_pk(int detail_img_num_pk) {
		this.detail_img_num_pk = detail_img_num_pk;
	}
	public int getOrder_num_fk() {
		return order_num_fk;
	}
	public void setOrder_num_fk(int order_num_fk) {
		this.order_num_fk = order_num_fk;
	}
	public String getDetail_img_name() {
		return detail_img_name;
	}
	public void setDetail_img_name(String detail_img_name) {
		this.detail_img_name = detail_img_name;
	}
}
	
