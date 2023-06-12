package com.spring.gotgongbang.craft.model;

import org.springframework.web.multipart.MultipartFile;

public class ImageVO {

	private String craft_add_img_pk;
	private String craft_num_fk;
	private MultipartFile craft_add_file_name;
	private String add_file_name;
	private String add_origin_file_name;
	
	
	public String getCraft_add_img_pk() {
		return craft_add_img_pk;
	}
	public void setCraft_add_img_pk(String craft_add_img_pk) {
		this.craft_add_img_pk = craft_add_img_pk;
	}
	
	public String getCraft_num_fk() {
		return craft_num_fk;
	}
	public void setCraft_num_fk(String craft_num_fk) {
		this.craft_num_fk = craft_num_fk;
	}
	public MultipartFile getCraft_add_file_name() {
		return craft_add_file_name;
	}
	public void setCraft_add_file_name(MultipartFile craft_add_file_name) {
		this.craft_add_file_name = craft_add_file_name;
	}
	public String getAdd_file_name() {
		return add_file_name;
	}
	public void setAdd_file_name(String add_file_name) {
		this.add_file_name = add_file_name;
	}
	public String getAdd_origin_file_name() {
		return add_origin_file_name;
	}
	public void setAdd_origin_file_name(String add_origin_file_name) {
		this.add_origin_file_name = add_origin_file_name;
	}
	

}
