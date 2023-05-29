package com.spring.gotgongbang.craft.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.board.model.InterBoardDAO;
import com.spring.gotgongbang.craft.model.CraftDAO;
import com.spring.gotgongbang.craft.model.InterCraftDAO;
import com.spring.gotgongbang.craft.model.PartnerVO;

@Service
public class CratfService implements InterCraftService {

	@Autowired
	private InterCraftDAO cdao;
	
	@Override
	public PartnerVO getPartnerInfoByUserId(String userid) {
		
		PartnerVO pvo = new PartnerVO();
		
		pvo = cdao.getPartnerInfoByUserId(userid);
		
		return pvo;
	}

}
