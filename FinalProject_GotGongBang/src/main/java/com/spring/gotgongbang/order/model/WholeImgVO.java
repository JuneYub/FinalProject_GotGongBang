package com.spring.gotgongbang.order.model;

import org.springframework.web.multipart.MultipartFile;

public class WholeImgVO {
	private int whole_img_num_pk;
	private int order_num_fk;
	private String whole_img_name;
	private String whole_img_new_name;
	private int whole_img_size;
	
   private MultipartFile whole_attach;
   /* form 태그에서 type="file" 인 파일을 받아서 저장되는 필드이다. 
           진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
           조심할것은 MultipartFile attach 는 오라클 데이터베이스 tbl_board 테이블의 컬럼이 아니다.   
      /Board/src/main/webapp/WEB-INF/views/tiles1/board/add.jsp 파일에서 input type="file" 인 name 의 이름(attach)과  
           동일해야만 파일첨부가 가능해진다.!!!!
 */
	
	public int getWhole_img_size() {
		return whole_img_size;
	}
	public String getWhole_img_new_name() {
		return whole_img_new_name;
	}
	public void setWhole_img_new_name(String whole_img_new_name) {
		this.whole_img_new_name = whole_img_new_name;
	}

	public MultipartFile getWhole_attach() {
		return whole_attach;
	}
	public void setWhole_attach(MultipartFile whole_attach) {
		this.whole_attach = whole_attach;
	}
	public void setWhole_img_size(int whole_img_size) {
		this.whole_img_size = whole_img_size;
	}
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