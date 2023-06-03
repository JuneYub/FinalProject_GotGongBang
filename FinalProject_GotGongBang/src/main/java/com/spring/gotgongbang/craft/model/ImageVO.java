package com.spring.gotgongbang.craft.model;

import org.springframework.web.multipart.MultipartFile;

public class ImageVO {

	private String craft_add_img_pk;
	private MultipartFile craft_add_file_name;
	
	
	public String getCraft_add_img_pk() {
		return craft_add_img_pk;
	}
	public void setCraft_add_img_pk(String craft_add_img_pk) {
		this.craft_add_img_pk = craft_add_img_pk;
	}
	public MultipartFile getCraft_add_file_name() {
		return craft_add_file_name;
	}
	public void setCraft_add_file_name(MultipartFile craft_add_file_name) {
		this.craft_add_file_name = craft_add_file_name;
	}
	
}
