package com.spring.gotgongbang.admin.model;

public class AdminVO {

	public AdminVO(){}  //기본생성자
	
	private String admin_id_pk;
	private String admin_pwd;
	private String name = "관리자";
	private String user_id_pk = "admin";
	 
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getUser_id_pk() {
		return user_id_pk;
	}
	
	public void setUser_id_pk(String user_id_pk) {
		this.user_id_pk = user_id_pk;
	}
	
	
	
}
