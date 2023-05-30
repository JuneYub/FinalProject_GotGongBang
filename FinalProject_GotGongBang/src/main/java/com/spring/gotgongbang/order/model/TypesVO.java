package com.spring.gotgongbang.order.model;

public class TypesVO {

	
	/////////////////// ====== 이지현 시작 ===== ///////////////////////

	// 타입들
	private int type_code_pk;		// 품목코드
	private String type_name;		//품목명

	
	// 요청사항들
	private int detail_type_pk;		// 수선유형번호
	private String detail_type_name;//수선종류명
	
	
	public int getType_code_pk() {
		return type_code_pk;
	}
	public void setType_code_pk(int type_code_pk) {
		this.type_code_pk = type_code_pk;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public int getDetail_type_pk() {
		return detail_type_pk;
	}
	public void setDetail_type_pk(int detail_type_pk) {
		this.detail_type_pk = detail_type_pk;
	}
	public String getDetail_type_name() {
		return detail_type_name;
	}
	public void setDetail_type_name(String detail_type_name) {
		this.detail_type_name = detail_type_name;
	}
	
	
	
	

	

	/////////////////// ====== 이지현 끝 ===== ///////////////////////

	
	
	
}




