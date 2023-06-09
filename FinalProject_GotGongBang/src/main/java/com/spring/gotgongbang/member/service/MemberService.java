package com.spring.gotgongbang.member.service;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.member.model.InterMemberDAO;
import com.spring.gotgongbang.member.model.MemberVO;



@Service
public class MemberService implements InterMemberService {

	// =========== 홍용훈 시작 =========================================== //
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

	@Override
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap) {
		MemberVO loginuser = dao.getLoginMember(paraMap);
		
		//  aes 의존객체를 사용하여 로그인 되어진 사용자(loginuser)의 이메일 값을 복호화 하도록 한다. === 
	    //          또한 암호변경 메시지와 휴면처리 유무 메시지를 띄우도록 업무처리를 하도록 한다.
		if(loginuser != null && loginuser.getPwdchangegap() >= 3) {
			// 마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지났으면
			loginuser.setRequirePwdChange(true); // 로그인시 암호를 변경하라는 alert 를 띄우도록 한다.
		}
		
		if(loginuser != null && loginuser.getIdle() == 0 && loginuser.getLastlogingap() >= 12) {
			// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정
			loginuser.setIdle(1);
			
			// === MEMBER 테이블의 idle 컬럼의 값을 1로 변경 === //
			int n = dao.updateIdle(paraMap.get("userid"));
		}
		if(loginuser != null) {
			String email = loginuser.getEmail();
			loginuser.setEmail(email);

		}
		
		if(loginuser == null) { // 로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
			// /WEB-INF/views/msg.jsp 파일을 생성한다.
		}
		else { // 아이디와 암호가 존재하는 경우
			
			if(loginuser.getIdle() == 1) { // 로그인 한지 1년이 경과한 경우
				
				String message = "로그인을 한지 1년이 지나서 휴면상태가 되었습니다. \\n관리자에게 문의바랍니다.";
				String loc = request.getContextPath()+"/index.got";
				// 원래는 위와 같이가 아니라 휴면이 계정을 풀어주는 페이지로 잡아주어야 한다.
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");
			}
			else { // 로그인 한지 1년이 이내인 경우
				
				HttpSession session = request.getSession();
				// 메모리에 생성되어져 있는 session 을 불러오는 것이다.
				
				session.setAttribute("loginuser", loginuser);
				// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
				
				// 로그인 성공 시 login_date를 기록
		        Date now = new Date();
		        Timestamp loginDate = new Timestamp(now.getTime());
		        dao.recordLoginDate(loginuser.getUser_id_pk(), loginDate);

				
				if(loginuser.isRequirePwdChange() == true) { // 암호를 마지막으로 변경한 것이 3개월이 경과한 경우
					
					String message = "비밀번호를 변경하신지 3개월이 지났습니다. \\n암호를 변경하는 것을 추천합니다.";
					String loc = request.getContextPath()+"/index.got";
					// 원래는 위와 같이가 아니라 사용자의 암호를 변경해주는 페이지로 잡아주어야 한다.
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
				}
				
				else { // 암호를 마지막으로 변경한 것이 3개월 이내인 경우
					
					// 로그인을 해야만 접근할 수 있는 페이지에 로그인을 하지 않은 상태에서 접근을 시도한 경우 
	                // "먼저 로그인을 하세요!!" 라는 메시지를 받고서 사용자가 로그인을 성공했다라면
	                // 화면에 보여주는 페이지는 시작페이지로 가는 것이 아니라
	                // 조금전 사용자가 시도하였던 로그인을 해야만 접근할 수 있는 페이지로 가기 위한 것이다.
					String goBackURL = (String) session.getAttribute("goBackURL");
					
					if(goBackURL != null) {
						mav.setViewName("redirect:"+goBackURL);
						session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
					}
					else {
						mav.setViewName("redirect:/index.got"); // 시작페이지로 이동
					}
					
				}
				
			}
		}
		return mav;
	}
	// =========== 홍용훈 끝 =========================================== //
	
	// =========== 박준엽 시작 =========================================== //
	
	@Override
	public List<HashMap<String, String>> getProposalListByUserId(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> proposalList = dao.getProposalListByUserId(paraMap);
		return proposalList;
	}

	@Override
	public MemberVO getUserInfoByUserId(String userid) {
		MemberVO mvo = dao.getUserInfoByUserId(userid);
		return mvo;
	}

	@Override
	public int updateMemberInfoByMVO(MemberVO mvo) {
		int n = dao.updateMemberInfoByMVO(mvo);
		return n;
	}

	@Override
	public int updateMemberPwd(MemberVO mvo) {
		int n = dao.updateMemberPwd(mvo);
		return n;
	}

	@Override
	public List<HashMap<String, String>> getOrderListByUserId(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> orderList = dao.getOrderListByUserId(paraMap);
		return orderList;
	}

	@Override
	public int getTotalCountForOrderListByUserId(String userId) {
		int n = dao.getTotalCountForOrderListByUserId(userId);
		return n;
	}
}
