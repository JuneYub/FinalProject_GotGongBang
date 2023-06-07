package com.spring.gotgongbang.member.model;

import java.util.Date;

public class MemberVO {

	private String user_id_pk;			//아이디
	private String name; 				//이름
	private String pwd;					//비밀번호
	private String email;				//이메일
	private String mobile;				//휴대전화
	private String post_code;			//우편번호
	private String address;				//주소
	private String detail_address;		//상세주소
	private String extra_address;		//부가주소
	private String gender;				//성별
	private String birthday;			//생년월일
	private String mileage;				//마일리지
	private String registerday;			//가입일자
	private String last_pwd_change;		//마지막비밀번호변경날짜
	private String idle;				//휴먼회원여부
	private String pwd_change_required;	//비밀번호갱신필요여부
	private String status;				//탈퇴여부
	
	public MemberVO() {}

	public MemberVO(String user_id_pk, String name, String pwd, String email, String mobile, String post_code,
			String address, String detail_address, String extra_address, String gender, String birthday) {
		super();
		this.user_id_pk = user_id_pk;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.mobile = mobile;
		this.post_code = post_code;
		this.address = address;
		this.detail_address = detail_address;
		this.extra_address = extra_address;
		this.gender = gender;
		this.birthday = birthday;
	}

	public String getUser_id_pk() {
		return user_id_pk;
	}

	public void setUser_id_pk(String user_id_pk) {
		this.user_id_pk = user_id_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getExtra_address() {
		return extra_address;
	}

	public void setExtra_address(String extra_address) {
		this.extra_address = extra_address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getLast_pwd_change() {
		return last_pwd_change;
	}

	public void setLast_pwd_change(String last_pwd_change) {
		this.last_pwd_change = last_pwd_change;
	}

	public String getIdle() {
		return idle;
	}

	public void setIdle(String idle) {
		this.idle = idle;
	}

	public String getPwd_change_required() {
		return pwd_change_required;
	}

	public void setPwd_change_required(String pwd_change_required) {
		this.pwd_change_required = pwd_change_required;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
}


