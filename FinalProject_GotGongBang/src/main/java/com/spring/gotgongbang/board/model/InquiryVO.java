package com.spring.gotgongbang.board.model;

import org.springframework.web.multipart.MultipartFile;

public class InquiryVO {
	
	private String inquiry_num_pk; 		// 문의번호
	private String user_id_fk ; 		// 아이디
	private String inquiry_title;   	// 문의제목
	private String inquiry_content; 	// 문의내용
	private String inquiry_date; 		// 작성날짜
	private String inquiry_viewcount; 	// 조회수
	private String inquiry_group; 		// 그룹번호
	private String inquiry_original; 	// 원글문의번호
	private String inquiry_depth ; 		// 깊이번호
	
	private MultipartFile attach;
	
	private String status;       		// 글삭제여부   1:사용가능한 글,  0:삭제된글 
	private String inquiry_fileName;    // WAS(톰캣)에 저장될 파일명(2023051909271535243254235235234.png) 
	private String inquiry_orgFilename; // 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String inquiry_fileSize;    // 파일크기 
	private String inquiry_pw;			// 게시글 암호
	
	public InquiryVO() {}

	public InquiryVO(String inquiry_num_pk, String user_id_fk, String inquiry_title, String inquiry_content,
			String inquiry_date, String inquiry_viewcount, String inquiry_group, String inquiry_original,
			String inquiry_depth, MultipartFile attach, String status, String inquiry_fileName,
			String inquiry_orgFilename, String inquiry_fileSize) {
		super();
		this.inquiry_num_pk = inquiry_num_pk;
		this.user_id_fk = user_id_fk;
		this.inquiry_title = inquiry_title;
		this.inquiry_content = inquiry_content;
		this.inquiry_date = inquiry_date;
		this.inquiry_viewcount = inquiry_viewcount;
		this.inquiry_group = inquiry_group;
		this.inquiry_original = inquiry_original;
		this.inquiry_depth = inquiry_depth;
		this.attach = attach;
		this.status = status;
		this.inquiry_fileName = inquiry_fileName;
		this.inquiry_orgFilename = inquiry_orgFilename;
		this.inquiry_fileSize = inquiry_fileSize;
	}

	public String getInquiry_num_pk() {
		return inquiry_num_pk;
	}

	public void setInquiry_num_pk(String inquiry_num_pk) {
		this.inquiry_num_pk = inquiry_num_pk;
	}

	public String getUser_id_fk() {
		return user_id_fk;
	}

	public void setUser_id_fk(String user_id_fk) {
		this.user_id_fk = user_id_fk;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(String inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getInquiry_viewcount() {
		return inquiry_viewcount;
	}

	public void setInquiry_viewcount(String inquiry_viewcount) {
		this.inquiry_viewcount = inquiry_viewcount;
	}

	public String getInquiry_group() {
		return inquiry_group;
	}

	public void setInquiry_group(String inquiry_group) {
		this.inquiry_group = inquiry_group;
	}

	public String getInquiry_original() {
		return inquiry_original;
	}

	public void setInquiry_original(String inquiry_original) {
		this.inquiry_original = inquiry_original;
	}

	public String getInquiry_depth() {
		return inquiry_depth;
	}

	public void setInquiry_depth(String inquiry_depth) {
		this.inquiry_depth = inquiry_depth;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInquiry_fileName() {
		return inquiry_fileName;
	}

	public void setInquiry_fileName(String inquiry_fileName) {
		this.inquiry_fileName = inquiry_fileName;
	}

	public String getInquiry_orgFilename() {
		return inquiry_orgFilename;
	}

	public void setInquiry_orgFilename(String inquiry_orgFilename) {
		this.inquiry_orgFilename = inquiry_orgFilename;
	}

	public String getInquiry_fileSize() {
		return inquiry_fileSize;
	}

	public void setInquiry_fileSize(String inquiry_fileSize) {
		this.inquiry_fileSize = inquiry_fileSize;
	}

	
	
	
	
}
