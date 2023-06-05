package com.spring.gotgongbang.member.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gotgongbang.member.model.InterMemberDAO;
import com.spring.gotgongbang.member.model.MemberVO;



@Service
public class MemberService implements InterMemberService {

	@Autowired
	private InterMemberDAO dao;

	// 암호화
	private String encryptSHA256(String data) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedHash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	// 비밀번호 암호화
	@Override
	public void encryptPassword(MemberVO memberVO) {
        String password = memberVO.getPwd();
        // 비밀번호 암호화
        String encryptedPassword = encryptSHA256(password);
        memberVO.setPwd(encryptedPassword);
    }
	
	// 회원가입 Service
	@Override
	public void insertMember(MemberVO membervo) {
		dao.insertMember(membervo);
	}

	// 이메일 중복 확인 AJAX 요청 처리
	@Override
	public boolean isEmailDuplicate(String email) {
		int n = dao.isEmailDuplicate(email);
		return n > 0;
	}

	// 아이디 중복 확인 AJAX 요청 처리
	@Override
	public boolean isIdDuplicate(String id) {
		int n = dao.isIdDuplicate(id);
		return n > 0;
	}

	// =========== 박준엽 시작 =========================================== //
	
	@Override
	public List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> proposalList = dao.getProposalListByUserId(paraMap);
		return proposalList;
	}

	
	
	
}
