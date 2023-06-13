package com.spring.gotgongbang.board.model;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	
	private String notice_num_pk; 		// 공지사항 번호
	private String admin_id_fk; 		// 관리자 아이디
	private String notice_title;   		// 제목
	private String notice_content; 		// 본문
	private String notice_date; 		// 작성날짜
	private String notice_viewcount; 	// 공지사항조회수
	private String notice_status;		// 공지사항 상태
	
	public NoticeVO() {}

	public NoticeVO(String notice_num_pk, String admin_id_fk, String notice_title, String notice_content,
			String notice_date, String notice_viewcount, String notice_status) {
		super();
		this.notice_num_pk = notice_num_pk;
		this.admin_id_fk = admin_id_fk;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_viewcount = notice_viewcount;
		this.notice_status = notice_status;
	}

	public String getNotice_num_pk() {
		return notice_num_pk;
	}

	public void setNotice_num_pk(String notice_num_pk) {
		this.notice_num_pk = notice_num_pk;
	}

	public String getAdmin_id_fk() {
		return admin_id_fk;
	}

	public void setAdmin_id_fk(String admin_id_fk) {
		this.admin_id_fk = admin_id_fk;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_viewcount() {
		return notice_viewcount;
	}

	public void setNotice_viewcount(String notice_viewcount) {
		this.notice_viewcount = notice_viewcount;
	}

	public String getNotice_status() {
		return notice_status;
	}

	public void setNotice_status(String notice_status) {
		this.notice_status = notice_status;
	}
	
	
	
		
	
}
