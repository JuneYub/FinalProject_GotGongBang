package com.spring.gotgongbang.member.service;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.member.model.InterMemberDAO;
import com.spring.gotgongbang.member.model.MemberVO;
import com.spring.gotgongbang.order.model.DetailImgVO;
import com.spring.gotgongbang.order.model.WholeImgVO;



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
	
	// 일반회원가입 Service
	@Override
	public void insertMember(MemberVO membervo) {
		dao.insertMember(membervo);
	}
	
	// 공방회원가입 Service
	@Override
	public void insertPartner(PartnerVO partnervo) {
		dao.insertPartner(partnervo);
		
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
		int n = dao.isIdDuplicateMember(id);
		int n1 = dao.isIdDuplicatePartner(id);
		return (n+n1) > 0;
	}

	@Override
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap) {
		MemberVO loginuser = dao.getLoginMember(paraMap);
		PartnerVO loginpartner = null;

		if(loginuser != null && loginuser.getPwdchangegap() >= 3) {
			// 마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지났으면
			loginuser.setRequirePwdChange(true);
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
		////////////////////////////////////////////////////////
		if(loginuser == null) { // 로그인 실패시
			loginpartner = dao.getLoginPartner(paraMap);				
		}
		
		if(loginpartner != null && loginpartner.getPwdchangegap() >= 3) {
			// 마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지났으면
			loginpartner.setRequirePwdChange(true);
		}
		
		if(loginpartner != null && loginpartner.getPartner_idle() == 0 && loginpartner.getLastlogingap() >= 12) {
			// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정
			loginpartner.setPartner_idle(1);
				
			// === PARTNER 테이블의 idle 컬럼의 값을 1로 변경 === //
			int n = dao.updateIdlePartner(paraMap.get("userid"));						
		}
		
		if(loginuser == null && loginpartner == null) {
			
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);					
			
			mav.setViewName("msg");
		}
		else { // 아이디와 암호가 존재하는 경우
			// 일반회원의 경우
			if(loginuser != null) {
				if(loginuser.getStatus() != 1) {
					
					String message = "탈퇴한 회원입니다.";
					String loc = "javascript:history.back()";
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
					return mav;
				}
				if(loginuser.getIdle() == 1) { // 로그인 한지 1년이 경과한 경우
					
					String message = "로그인을 한지 1년이 지나서 휴면상태가 되었습니다. \\n관리자에게 문의바랍니다.";
					String loc = request.getContextPath()+"/index.got";
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
				}
				else { // 로그인 한지 1년이 이내인 경우
					
					HttpSession session = request.getSession();
					
					session.setAttribute("loginuser", loginuser);
					
					// 로그인 성공 시 login_date를 기록			        
			        dao.recordLoginDate(loginuser.getUser_id_pk(), loginuser.getGradelevel());
				
					if(loginuser.isRequirePwdChange() == true) { // 암호를 마지막으로 변경한 것이 3개월이 경과한 경우
						
						String message = "비밀번호를 변경하신지 3개월이 지났습니다. \\n암호를 변경하는 것을 추천합니다.";
						String loc = request.getContextPath()+"/edit_user_info.got";
						// 원래는 위와 같이가 아니라 사용자의 암호를 변경해주는 페이지로 잡아주어야 한다.
						
						mav.addObject("message", message);
						mav.addObject("loc", loc);
						
						mav.setViewName("msg");
					}
					
					else { // 암호를 마지막으로 변경한 것이 3개월 이내인 경우

						String goBackURL = (String) session.getAttribute("goBackURL");
						
						if(goBackURL != null) {
							mav.setViewName("redirect:"+goBackURL);
							session.removeAttribute("goBackURL"); // 세션에서 제거
						}
						else {
							mav.setViewName("redirect:/index.got");
						}
						
					}
					
				}
			}
			else if(loginpartner != null) {
				if(loginpartner.getPartner_status() != 1) {
					
					String message = "탈퇴한 회원입니다.";
					String loc = "javascript:history.back();";
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
					return mav;
				}				
				if(loginpartner.getPartner_idle() == 1) { // 로그인 한지 1년이 경과한 경우
					
					String message = "로그인을 한지 1년이 지나서 휴면상태가 되었습니다. \\n관리자에게 문의바랍니다.";
					String loc = request.getContextPath()+"/index.got";
					
					mav.addObject("message", message);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
				}
				else { // 로그인 한지 1년이 이내인 경우
					
					HttpSession session = request.getSession();
					
					session.setAttribute("loginpartner", loginpartner);
					
					// 로그인 성공 시 login_date를 기록			    
			        dao.recordLoginDate(loginpartner.getPartner_id_pk(), loginpartner.getPartner_gradelevel());

					
					if(loginpartner.isRequirePwdChange() == true) { // 암호를 마지막으로 변경한 것이 3개월이 경과한 경우
						
						String message = "비밀번호를 변경하신지 3개월이 지났습니다. \\n암호를 변경하는 것을 추천합니다.";
						String loc = request.getContextPath()+"/edit_craft_user_info.got";
						
						mav.addObject("message", message);
						mav.addObject("loc", loc);
						
						mav.setViewName("msg");
					}
					
					else { // 암호를 마지막으로 변경한 것이 3개월 이내인 경우
						
						String goBackURL = (String) session.getAttribute("goBackURL");
						
						if(goBackURL != null) {
							mav.setViewName("redirect:"+goBackURL);
							session.removeAttribute("goBackURL"); // 세션에서 제거
						}
						else {
							mav.setViewName("redirect:/index.got");
						}					
					}				
				}
			}	
		}
		return mav;
	}
	
	// 이름과 이메일 값으로 아이디 유무 체크
	@Override
	public List<MemberVO> compareNameEmail(String name, String email) {
		List<MemberVO> membervo = dao.compareNameEmail(name, email);
		return membervo;
	}
	
	
	@Override
	public String compareNameEmailMember(Map<String, String> paraMap) {
		String memberId = dao.compareNameEmailMember(paraMap);
		return memberId;
	}
	
	
	@Override
	public String compareNameEmailpartner(Map<String, String> paraMap) {
		String partnerId = dao.compareNameEmailpartner(paraMap);
		return partnerId;
	}
	
	// 공방회원가입 Service
	@Override
	public void insertPartner(MemberVO membervo) {
		dao.insertPartner(membervo);
	}
	
	// 이메일 중복 확인 AJAX 요청 처리 ( 공방회원 )
	@Override
	public boolean isEmailDuplicate_partner(String email) {
		int n = dao.isEmailDuplicate_partner(email);
		return n > 0;
	}
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	@Override
	public String confirmThroughMemberIdEmail(Map<String, String> paraMap) {
		String memberId = dao.confirmThroughMemberIdEmail(paraMap);
		return memberId;
	}
	
	@Override
	public String confirmThroughPartnerIdEmail(Map<String, String> paraMap) {
		String partnerId = dao.confirmThroughPartnerIdEmail(paraMap);
		return partnerId;
	}
	
	// 아이디, 이메일 값을 통해서 회원 유무 확인 //////////////////////////////////////////////
	
	
	// 비밀번호 변경
	@Override
	public int change_pwd(HashMap<String, String> paraMap) {
		int n = dao.changeMemberPwd(paraMap);
		int n1 = dao.changePartnerPwd(paraMap);
		return (n+n1);
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
  
	@Override
	public int getTotalCountProposalListByUserId(String userId) {
		int n = dao.getTotalCountProposalListByUserId(userId);
		return n;
	}
	
	@Override
	public int getReviewCntByOrderNum(String orderNum) {
		int n = dao.getReviewCntByOrderNum(orderNum);
		return n;
	}
	
	@Override
	public List<WholeImgVO> getWholeImgListByOrderDetailNum(String orderDetailNum) {
		List<WholeImgVO> wholeImgList = dao.getWholeImgListByOrderDetailNum(orderDetailNum);
		return wholeImgList;
	}

	@Override
	public List<DetailImgVO> getDetailImgListByOrderDetailNum(String orderDetailNum) {
		List<DetailImgVO> detailImgList = dao.getDetailImgListByOrderDetailNum(orderDetailNum);
		return detailImgList;
	}

	@Override
	public int getFixedPhotoNum() {
		int pkNum = dao.getFixedPhotoNum();
		return pkNum;
	}

	@Override
	public void insertReview(HashMap<String, Object> paraMap) {
		dao.insertReview(paraMap);
	}

	@Override
	public void insertFixedPhoto(HashMap<String, Object> imgParaMap) {
		dao.insertFixedPhoto(imgParaMap);
	}

	@Override
	public int getCurrReviewIdByOrderDetailNum(String orderDetailNum) {
		int reviewId = dao.getCurrReviewIdByOrderDetailNum(orderDetailNum);
		return reviewId;
	}

	@Override
	public HashMap<String, String> getOrderNumAndCraftNumByOrderDetailNum(String orderDetailNum) {
		HashMap<String, String> paraMap = dao.getOrderNumAndCraftNumByOrderDetailNum(orderDetailNum);
		return paraMap;
	}


	@Override
	public int deleteReviewByOrderNum(String orderNum) {
		int n = dao.deleteReviewByOrderNum(orderNum);
		return n;
	}

	
	// =========== 박준엽 끝 =========================================== //
  
  
	// =========== 이지현 시작 =========================================== //

	@Override
	public boolean delete_user_end(Map<String, String> paraMap) {
		
		int img_name = dao.delete_user_end(paraMap);
		return img_name > 0;
	}




	@Override
	public int delete_user_info(String user_id_pk) {
		int user_int = dao.delete_user_info(user_id_pk);
		return user_int;
	}


	
	// =========== 이지현 끝 =========================================== //











}
