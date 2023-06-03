package com.spring.gotgongbang.admin.model;

public class AdminVO {

	public AdminVO(){}  //기본생성자
	
	private String admin_id_pk;
	private String admin_pwd;
	
	//이 부분은 데이터 select 용도!
	private int pwdchangegap;          //select 용. 지금으로 부터 마지막으로 암호를 변경한지가 몇개월인지 알려주는 개월수(3개월 동안 암호를 변경 안 했을시 암호를 변경하라는 메시지를 보여주기 위함)  
	private int lastlogingap;          //select 용. 지금으로 부터 마지막으로 로그인한지가 몇개월인지 알려주는 개월수(12개월 동안 로그인을 안 했을 경우 해당 로그인 계정을 비활성화 시키려고 함) 
	
	//이 부분은 select 용도!
	private boolean requirePwdChange = false;
	//마지막으로 암호를 변경한 날짜가 로그인 되어진 현재시간으로부터 3개월이 넘었으면 true 로 변경하도록 한다.
	//마지막으로 암호를 변경한 날짜가 로그인 되어진 현재시간으로부터 3개월이 넘지 않았으면 false 를 그대로 유지한다.

	public AdminVO(String admin_id_pk, String admin_pwd) {
		this.admin_id_pk = admin_id_pk;
		this.admin_pwd = admin_pwd;
	}

	public String getAdmin_id_pk() {
		return admin_id_pk;
	}

	public void setAdmin_id_pk(String admin_id_pk) {
		this.admin_id_pk = admin_id_pk;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
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
	
	
	
}
