package com.spring.gotgongbang.member.model;

public class FixedPhotoVO {
	private int fixed_photo_num_pk;
	private int review_id_fk;
	private String file_name;
	
	public FixedPhotoVO() {}

	public int getFixed_photo_num_pk() {
		return fixed_photo_num_pk;
	}

	public void setFixed_photo_num_pk(int fixed_photo_num_pk) {
		this.fixed_photo_num_pk = fixed_photo_num_pk;
	}

	public int getReview_id_fk() {
		return review_id_fk;
	}

	public void setReview_id_fk(int review_id_fk) {
		this.review_id_fk = review_id_fk;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
}
