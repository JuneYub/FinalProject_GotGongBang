package com.spring.gotgongbang.craft.model;

import org.springframework.web.multipart.MultipartFile;

public class CraftVO {

	
	/////////////////// ====== 김진솔 시작 ===== ///////////////////////
	private String craft_num_pk;				//공방번호
	private String partner_id_fk;				//유저 아이디
	private String craft_name;					//공방이름
	private String craft_mobile;				//공방연락처
	private String craft_representative;		//공방 대표이름
	private MultipartFile craft_representative_image;	//공방 대표 사진
	private MultipartFile craft_image;					//공방 사진
	private String craft_Introduce;				//공방 한줄소개
	private String craft_career;				//경력기간
	private MultipartFile craft_certificate;			//자격증
	private String craft_specialty;				//전문품목
	private String craft_post_code;				//우편번호
	private String craft_address;				//주소
	private String craft_detail_address;		//상세주소
	private String craft_extra_address;			//부가주소
	private String craft_latitude;				//위도
	private String craft_longitude;				//경도
	private String craft_status;				//(임시/정식) 상태
	private String craft_salary;				//희망급여
	private String craft_rating;				//별점
	
	// * select용 *
	private ImageVO imgvo;
	private String img_name;  //수선사 찾기 페이지에서 

	////////////////////////////////////////////////////////
		   
	// 먼저, 댓글쓰기에 파일첨부까지 한 것을 위해서 오라클에서 tbl_comment 테이블에 fileName, orgFilename, fileSize 컬럼을 추가해주어야 한다. 
	/* form 태그에서 type="file" 인 파일을 받아서 저장되는 필드이다. 
	진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
	조심할것은 MultipartFile attach 는 오라클 데이터베이스 tbl_comment 테이블의 컬럼이 아니다.   
	/Board/src/main/webapp/WEB-INF/views/tiles1/board/view.jsp 파일에서 input type="file" 인 name 의 이름(attach)과  
	동일해야만 파일첨부가 가능해진다.!!!!
	*/
	private String fileName;    // WAS(톰캣)에 저장될 파일명(2022042911123035243254235235234.png) 
	private String orgFilename; // 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String fileSize;    // 파일크기 
	
	////////////////////////////////////////////////////////

	public CraftVO(){}
	

	public String getCraft_num_pk() {
		return craft_num_pk;
	}

	public void setCraft_num_pk(String craft_num_pk) {
		this.craft_num_pk = craft_num_pk;
	}

	public String getPartner_id_fk() {
		return partner_id_fk;
	}


	public void setPartner_id_fk(String partner_id_fk) {
		this.partner_id_fk = partner_id_fk;
	}


	public String getCraft_name() {
		return craft_name;
	}

	public void setCraft_name(String craft_name) {
		this.craft_name = craft_name;
	}

	public String getCraft_mobile() {
		return craft_mobile;
	}

	public void setCraft_mobile(String craft_mobile) {
		this.craft_mobile = craft_mobile;
	}

	public String getCraft_representative() {
		return craft_representative;
	}

	public void setCraft_representative(String craft_representative) {
		this.craft_representative = craft_representative;
	}

	public MultipartFile getCraft_representative_image() {
		return craft_representative_image;
	}

	public void setCraft_representative_image(MultipartFile craft_representative_image) {
		this.craft_representative_image = craft_representative_image;
	}

	public MultipartFile getCraft_image() {
		return craft_image;
	}

	public void setCraft_image(MultipartFile craft_image) {
		this.craft_image = craft_image;
	}

	public String getCraft_Introduce() {
		return craft_Introduce;
	}

	public void setCraft_Introduce(String craft_Introduce) {
		this.craft_Introduce = craft_Introduce;
	}

	public String getCraft_career() {
		return craft_career;
	}

	public void setCraft_career(String craft_career) {
		this.craft_career = craft_career;
	}

	public MultipartFile getCraft_certificate() {
		return craft_certificate;
	}

	public void setCraft_certificate(MultipartFile craft_certificate) {
		this.craft_certificate = craft_certificate;
	}

	public String getCraft_specialty() {
		return craft_specialty;
	}

	public void setCraft_specialty(String craft_specialty) {
		this.craft_specialty = craft_specialty;
	}

	public String getCraft_post_code() {
		return craft_post_code;
	}

	public void setCraft_post_code(String craft_post_code) {
		this.craft_post_code = craft_post_code;
	}

	public String getCraft_address() {
		return craft_address;
	}

	public void setCraft_address(String craft_address) {
		this.craft_address = craft_address;
	}

	public String getCraft_detail_address() {
		return craft_detail_address;
	}

	public void setCraft_detail_address(String craft_detail_address) {
		this.craft_detail_address = craft_detail_address;
	}

	public String getCraft_extra_address() {
		return craft_extra_address;
	}

	public void setCraft_extra_address(String craft_extra_address) {
		this.craft_extra_address = craft_extra_address;
	}

	public String getCraft_latitude() {
		return craft_latitude;
	}

	public void setCraft_latitude(String craft_latitude) {
		this.craft_latitude = craft_latitude;
	}

	public String getCraft_longitude() {
		return craft_longitude;
	}

	public void setCraft_longitude(String craft_longitude) {
		this.craft_longitude = craft_longitude;
	}

	public String getCraft_status() {
		return craft_status;
	}

	public void setCraft_status(String craft_status) {
		this.craft_status = craft_status;
	}

	public String getCraft_rating() {
		return craft_rating;
	}

	public void setCraft_rating(String craft_rating) {
		this.craft_rating = craft_rating;
	}

	public String getCraft_salary() {
		return craft_salary;
	}


	public void setCraft_salary(String craft_salary) {
		this.craft_salary = craft_salary;
	}

	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getOrgFilename() {
		return orgFilename;
	}


	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}


	public String getFileSize() {
		return fileSize;
	}


	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}



	public ImageVO getImgvo() {
		return imgvo;
	}


	public void setImgvo(ImageVO imgvo) {
		this.imgvo = imgvo;
	}	
	
	
	public String getImg_name() {
		return img_name;
	}


	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	

	public ImageVO getImgvo() {
		return imgvo;
	}


	public void setImgvo(ImageVO imgvo) {
		this.imgvo = imgvo;
	}	
	
	
	public String getImg_name() {
		return img_name;
	}


	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	
	
	
	/////////////////// ====== 김진솔 끝 ===== ///////////////////////
	
}
