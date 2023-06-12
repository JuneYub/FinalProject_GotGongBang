package com.spring.gotgongbang.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.admin.service.InterAdminService;
import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.common.Sha256;
import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.member.controller.MemberController;

@Component
@Controller
public class AdminController {

    @Autowired   
    private FileManager fileManager;
    
	// 김진솔 시작
	// ===========================================================================
	
	// 공방 목록 보기 페이지 요청
	@RequestMapping(value = "/craft_list.got")
	public ModelAndView craftList(ModelAndView mav) {
        List<CraftVO> craftList = null;

        craftList = service.selectCraftList();

        mav.addObject("craftList", craftList);
		mav.setViewName("admin/craftList.tiles1");
		
		return mav;
	}
	

	// 공방 한 개 보기 페이지 요청
	@RequestMapping(value = "/craft_view.got")
	public ModelAndView craftView(ModelAndView mav, HttpServletRequest request) {
		String craft_num_pk = request.getParameter("craft_num_pk");

		CraftVO craftvo = null;
		
		craftvo = service.craftOneView(craft_num_pk);

	    List<Map<String, String>> imgList = service.selectImgList(craft_num_pk);
	    System.out.println("~확인용 imgList: "+ imgList);
	    // 뷰단에 파일 originalFileName을 띄워주기 위한 것
	    Map<String, String> paraMap = new HashMap<String, String>();
	    paraMap.put("craft_image_orgFilename", imgList.get(0).get("craft_image_orgFilename").toString());
	    paraMap.put("craft_representative_image_orgFilename", imgList.get(0).get("craft_representative_image_orgFilename").toString());
	    paraMap.put("craft_certificate_orgFilename", imgList.get(0).get("craft_certificate_orgFilename").toString());
	    
	    System.out.println("paraMap : " + paraMap);
	    
		
		mav.addObject("paraMap",paraMap);
		mav.addObject("craftvo",craftvo);
		mav.setViewName("admin/craftView.tiles1");
		return mav;
	}

	
	//공방 한 개 보기 공방사진,대표자사진,자격증사진 파일 다운로드하기
	@RequestMapping(value = "/craft_download.got")
	public void craft_download(HttpServletRequest request, HttpServletResponse response, CraftVO craftvo) {
		String craft_num_pk = request.getParameter("craft_num_pk");

			// 첨부파일 클릭하면 파일 다운로드하기
				response.setContentType("text/html; charset=UTF-8");
			    PrintWriter out = null;
			    try {
				    Integer.parseInt(craft_num_pk);

				    List<Map<String, String>> imgList = service.selectImgList(craft_num_pk);
				   
					if( craftvo == null ) {
						out = response.getWriter();
						out.println("<script type='text/javascript'>alert('존재하지 않는 글번호 이거나 첨부파일이 없으므로 파일다운로드가 불가합니다.'); history.back();</script>"); 
					}
					else{
						
						String craft_image_fileName = imgList.get(0).get("craft_image_fileName").toString();
						String craft_image_orgFilename = imgList.get(0).get("craft_image_orgFilename").toString();

						String craft_representative_image_fileName = imgList.get(0).get("craft_representative_image_fileName").toString();					
						String craft_representative_image_orgFilename = imgList.get(0).get("craft_representative_image_orgFilename").toString();

						String craft_certificate_fileName = imgList.get(0).get("craft_certificate_fileName").toString();						
						String craft_certificate_orgFilename = imgList.get(0).get("craft_certificate_orgFilename").toString();

						HttpSession session = request.getSession();
						String root = session.getServletContext().getRealPath("/");
						
						String path = root+"resources"+File.separator+"files";
						
					   
						// **** file 다운로드 하기 **** //
						boolean flag = false; // file 다운로드 성공, 실패를 알려주는 용도 
						flag = fileManager.doFileDownload(craft_image_fileName, craft_image_orgFilename, path, response);
						flag = fileManager.doFileDownload(craft_representative_image_fileName, craft_representative_image_orgFilename, path, response);
						flag = fileManager.doFileDownload(craft_certificate_fileName, craft_certificate_orgFilename, path, response);

						if(!flag) {	//다운로드 실패시
							out = response.getWriter();					
							out.println("<script type='text/javascript'>alert('파일다운로드가 실패되었습니다.'); history.back();</script>");
						}
						
					}
				
			    } catch (IOException e) {
			    	try {
						out = response.getWriter();						
						out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>"); 
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			    

	}
	
	
	
	
	// 김진솔 끝
	// ===========================================================================

	

	// 김나윤 시작
	// ===========================================================================
	@Autowired   
	private InterAdminService service; 
	
	//LoggerFactory 사용시 
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);  //로깅을 위한 변수
	
	// === #1. 로그인 폼 페이지 요청 === //
	@RequestMapping(value="/admin_login.got", method={RequestMethod.GET})
	public ModelAndView login(ModelAndView mav) {
		
		mav.setViewName("admin/admin_login.tiles1");  //view단 페이지 나타내기. tiles를 사용하겠다!
	    //   /WEB-INF/views/tiles1/login/loginform.jsp 페이지를 만들어야 한다.
		return mav;
	}
	
	
	// === #2. 로그인 폼 페이지 요청 === //
	@RequestMapping(value="/admin_login.got", method= {RequestMethod.POST})
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request) {
		
		String userid = request.getParameter("userid");  //클라이언트가 입력한 아이디 값을 알아옴
		String pwd = request.getParameter("pwd");        //클라이언트가 입력한 비번 값을 알아옴
		
		Map<String, String> paraMap = new HashMap<String, String>();  //아이디, 비번을 Map에 담아 넘겨줌
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd));  //이때 비번 값은 암호화하여 전달함
//		System.out.println(Sha256.encrypt(pwd));
		//e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
		
		mav = service.loginEnd(mav, request, paraMap);  //서비스단의 loginEnd메소드 
		return mav;  
	}
	
	
	// === 2. 로그아웃 처리하기 === //
	@RequestMapping(value="/logout.action")
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {
		
		//로그아웃시 시작페이지로 돌아가는 것임.
		HttpSession session = request.getSession(); 
		session.invalidate();  //세션을 완전히 비워준다.
		
		String message = "로그아웃 되었습니다!";
		String loc = "javascript:history.back()";
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");  //무조건 시작페이지로
	    //  /WEB-INF/views/msg.jsp
		
		return mav;
	}
	
	
		
	// 김나윤 끝
	// ===========================================================================

	// 박준엽 시작
	// ===========================================================================

	// 박준엽 끝
	// ===========================================================================

	// 오준혁 시작
	// ===========================================================================
	// 오준혁 끝
	// ===========================================================================

	// 이지현 시작
	// ===========================================================================
	// 이지현 끝
	// ===========================================================================

	// 홍용훈 시작
	// ===========================================================================
	// 홍용훈 끝
	// ===========================================================================
}
