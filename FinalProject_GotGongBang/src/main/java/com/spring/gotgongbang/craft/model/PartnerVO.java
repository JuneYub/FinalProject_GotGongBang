package com.spring.gotgongbang.craft.model;

public class PartnerVO {
	private String partner_id_pk;
	private String partner_name;
	private String partner_pwd;
	private String partner_email;
	private String partner_mobile;
	private String partner_post_code;
	private String partner_address;
	private String partner_detail_address;
	private String partner_extra_address;
	private String partner_gender;
	private String partner_birthday;
	private String partner_registerday;
	private String partner_lastPwdChange;
	private int partner_idle;
	private int partner_pwd_change_required;
	private int partner_status;
	
	public PartnerVO() {}
	
	public PartnerVO(String partner_id_pk, String partner_name, String partner_pwd, String partner_email,
			String partner_mobile, String partner_post_code, String partner_address, String partner_detail_address,
			String partner_extra_address, String partner_gender, String partner_birthday) {
		super();
		this.partner_id_pk = partner_id_pk;
		this.partner_name = partner_name;
		this.partner_pwd = partner_pwd;
		this.partner_email = partner_email;
		this.partner_mobile = partner_mobile;
		this.partner_post_code = partner_post_code;
		this.partner_address = partner_address;
		this.partner_detail_address = partner_detail_address;
		this.partner_extra_address = partner_extra_address;
		this.partner_gender = partner_gender;
		this.partner_birthday = partner_birthday;
	}
	
	
	private int pwdchangegap;          // select 용. 지금으로 부터 마지막으로 암호를 변경한지가 몇개월인지 알려주는 개월수(3개월 동안 암호를 변경 안 했을시 암호를 변경하라는 메시지를 보여주기 위함)  
	private int lastlogingap;          // select 용. 지금으로 부터 마지막으로 로그인한지가 몇개월인지 알려주는 개월수(12개월 동안 로그인을 안 했을 경우 해당 로그인 계정을 비활성화 시키려고 함) 
	
	
	private boolean requirePwdChange = false;
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
	
	// 일반회원과 공방회원을 나누기 위함.
	private int gradelevel;
	
	
	public String getPartner_id_pk() {
		return partner_id_pk;
	}
	public void setPartner_id_pk(String partner_id_pk) {
		this.partner_id_pk = partner_id_pk;
	}
	public String getPartner_name() {
		return partner_name;
	}
	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}
	public String getPartner_pwd() {
		return partner_pwd;
	}
	public void setPartner_pwd(String partner_pwd) {
		this.partner_pwd = partner_pwd;
	}
	public String getPartner_email() {
		return partner_email;
	}
	public void setPartner_email(String partner_email) {
		this.partner_email = partner_email;
	}
	public String getPartner_mobile() {
		return partner_mobile;
	}
	public void setPartner_mobile(String partner_mobile) {
		this.partner_mobile = partner_mobile;
	}
	public String getPartner_post_code() {
		return partner_post_code;
	}
	public void setPartner_post_code(String partner_post_code) {
		this.partner_post_code = partner_post_code;
	}
	public String getPartner_address() {
		return partner_address;
	}
	public void setPartner_address(String partner_address) {
		this.partner_address = partner_address;
	}
	public String getPartner_detail_address() {
		return partner_detail_address;
	}
	public void setPartner_detail_address(String partner_detail_address) {
		this.partner_detail_address = partner_detail_address;
	}
	public String getPartner_extra_address() {
		return partner_extra_address;
	}
	public void setPartner_extra_address(String partner_extra_address) {
		this.partner_extra_address = partner_extra_address;
	}
	public String getPartner_gender() {
		return partner_gender;
	}
	public void setPartner_gender(String partner_gender) {
		this.partner_gender = partner_gender;
	}
	public String getPartner_birthday() {
		return partner_birthday;
	}
	public void setPartner_birthday(String partner_birthday) {
		this.partner_birthday = partner_birthday;
	}
	public String getPartner_registerday() {
		return partner_registerday;
	}
	public void setPartner_registerday(String partner_registerday) {
		this.partner_registerday = partner_registerday;
	}
	public String getPartner_lastPwdChange() {
		return partner_lastPwdChange;
	}
	public void setPartner_lastPwdChange(String partner_lastPwdChange) {
		this.partner_lastPwdChange = partner_lastPwdChange;
	}
	public int getPartner_idle() {
		return partner_idle;
	}
	public void setPartner_idle(int partner_idle) {
		this.partner_idle = partner_idle;
	}
	public int getPartner_pwd_change_required() {
		return partner_pwd_change_required;
	}
	public void setPartner_pwd_change_required(int partner_pwd_change_required) {
		this.partner_pwd_change_required = partner_pwd_change_required;
	}
	public int getPartner_status() {
		return partner_status;
	}
	public void setPartner_status(int partner_status) {
		this.partner_status = partner_status;
	}
	public int getPwdchangegap() {
		return pwdchangegap;
	}

	public void setPwdchangegap(int pwdchangegap) {
		this.pwdchangegap = pwdchangegap;
	}

	public int getLastlogingap() {
		return lastlogingap;
	}

	public void setLastlogingap(int lastlogingap) {
		this.lastlogingap = lastlogingap;
	}

	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}
	public int getGradelevel() {
		return gradelevel;
    }

    public void setGradelevel(int gradelevel) {
		this.gradelevel = gradelevel;
    }
	
	
	
}
