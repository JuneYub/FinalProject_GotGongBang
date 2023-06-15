package com.spring.gotgongbang.member.model;

import java.util.List;

import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.WholeImgVO;

public class ReviewVO {
	private int review_id_pk;
	private String user_id_fk;
	private String order_detail_id_fk;
	private int review_rating;
	private String review_content;
	private String review_date;
	
	//craft.xml에서 수선사진을 불러오기 위한 collection 사용을 위해!
	private List<WholeImgVO> wholeImgList;		//전체이미지
	private List<DetailImgVO> detailImgList;	//상세이미지
	private List<FixedPhotoVO> fixedPhotoList;  //수선후 사진
	
	public ReviewVO() {}

	public int getReview_id_pk() {
		return review_id_pk;
	}

	public void setReview_id_pk(int review_id_pk) {
		this.review_id_pk = review_id_pk;
	}

	public String getUser_id_fk() {
		return user_id_fk;
	}

	public void setUser_id_fk(String user_id_fk) {
		this.user_id_fk = user_id_fk;
	}

	public String getOrder_detail_id_fk() {
		return order_detail_id_fk;
	}

	public void setOrder_detail_id_fk(String order_detail_id_fk) {
		this.order_detail_id_fk = order_detail_id_fk;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public List<WholeImgVO> getWholeImgList() {
		return wholeImgList;
	}

	public void setWholeImgList(List<WholeImgVO> wholeImgList) {
		this.wholeImgList = wholeImgList;
	}
}
