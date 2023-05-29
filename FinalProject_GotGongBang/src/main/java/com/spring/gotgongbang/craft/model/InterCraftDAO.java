package com.spring.gotgongbang.craft.model;

public interface InterCraftDAO {

	// 공방이름 중복체크를 위한 공방이름 조회해오기
	int craft_check_name(String craft_name);

}
