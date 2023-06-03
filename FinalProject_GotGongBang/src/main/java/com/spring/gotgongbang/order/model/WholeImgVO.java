package com.spring.gotgongbang.order.model;


public class WholeImgVO {
	private int whole_img_num_pk;
	private int order_num_fk;
	private String whole_img_name;
	public int getWhole_img_num_pk() {
		return whole_img_num_pk;
	}
	public void setWhole_img_num_pk(int whole_img_num_pk) {
		this.whole_img_num_pk = whole_img_num_pk;
	}
	public int getOrder_num_fk() {
		return order_num_fk;
	}
	public void setOrder_num_fk(int order_num_fk) {
		this.order_num_fk = order_num_fk;
	}
	public String getWhole_img_name() {
		return whole_img_name;
	}
	public void setWhole_img_name(String whole_img_name) {
		this.whole_img_name = whole_img_name;
	}
}