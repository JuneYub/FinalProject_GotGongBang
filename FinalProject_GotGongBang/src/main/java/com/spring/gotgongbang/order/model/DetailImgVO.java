package com.spring.gotgongbang.order.model;

import org.springframework.web.multipart.MultipartFile;

public class DetailImgVO {
	private int detail_img_num_pk;
	private int order_num_fk;
	private String detail_img_name;
	private String detail_img_new_name;
	private int detail_img_size;
	
   private MultipartFile detail_attach;
   /* form 태그에서 type="file" 인 파일을 받아서 저장되는 필드이다. 
           진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
           조심할것은 MultipartFile attach 는 오라클 데이터베이스 tbl_board 테이블의 컬럼이 아니다.   
      /Board/src/main/webapp/WEB-INF/views/tiles1/board/add.jsp 파일에서 input type="file" 인 name 의 이름(attach)과  
           동일해야만 파일첨부가 가능해진다.!!!!
 */
	
	
	public int getDetail_img_size() {
		return detail_img_size;
	}
	public String getDetail_img_new_name() {
		return detail_img_new_name;
	}
	public void setDetail_img_new_name(String detail_img_new_name) {
		this.detail_img_new_name = detail_img_new_name;
	}

	public MultipartFile getDetail_attach() {
		return detail_attach;
	}
	public void setDetail_attach(MultipartFile detail_attach) {
		this.detail_attach = detail_attach;
	}
	public void setDetail_img_size(int detail_img_size) {
		this.detail_img_size = detail_img_size;
	}
	
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
	
