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

import com.spring.gotgongbang.common.MyUtil;
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
	public ModelAndView craftList(ModelAndView mav, HttpServletRequest request) {
       List<CraftVO> craftList = null;

       String str_currentShowPageNo = request.getParameter("currentShowPageNo");
     
               int totalCount = 0;        // 총 게시물 건수
        int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 건수 
        int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
        
        int startRno = 0; // 시작 행번호
        int endRno = 0;   // 끝 행번호
       
        //총 게시물 건수(totalCount)
        totalCount = service.getTotalCraftCount();
        System.out.println("확인용~ totalCount: " + totalCount);
       
        //만약에 총 게시물 건수가 127개라면 총 페이지수는 13개가 되어야 한다(n/10+1)
        totalPage = (int)Math.ceil((double)totalCount/sizePerPage);      
       
        if(str_currentShowPageNo == null) {
           currentShowPageNo = 1;
        }else {
           try {
              currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
              if(currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
                 currentShowPageNo = 1;
              }
              
           } catch(NumberFormatException e){
              currentShowPageNo = 1;
           }
        }
       
        startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
        endRno = startRno + sizePerPage - 1;
        
        Map<String, String> paraMap = new HashMap<String, String>();
        
        paraMap.put("startRno", String.valueOf(startRno));
        paraMap.put("endRno", String.valueOf(endRno));
        
        craftList = service.getCraftListWithPaging(paraMap);
        // 페이징처리한 글목록 가져오기
        
        int blockSize = 10;
        
        
        int loop = 1;
        
        int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
     
        
        String pageBar = "<ul style='list-style: none;'>";
        String url = "craft_list.got";
        
        // === [맨처음][이전] 만들기 === //
        if(pageNo != 1) {
           pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
           pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
        }
        
        while( !(loop > blockSize || pageNo > totalPage) ) {
           
           if(pageNo == currentShowPageNo) {
              pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";  
           }
           else {
              pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; 
           }
           
           loop++;
           pageNo++;
           
        }// end of while-----------------------
        
        
        // === [다음][마지막] 만들기 === //
        if( pageNo <= totalPage ) {
           pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
           pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>"; 
        }
        
        pageBar += "</ul>";
        
        mav.addObject("pageBar", pageBar);
      
        
        // === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
        //           사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
        //           현재 페이지 주소를 뷰단으로 넘겨준다.
        String gobackURL = MyUtil.getCurrentURL(request);
        //System.out.println("~확인용: " + gobackURL);
        //~확인용: /list.action
        //~확인용: /list.action?searchType=&searchWord=&currentShowPageNo=2
        //~확인용: /list.action?searchType=subject&searchWord=jaVa
        //~확인용: /list.action?searchType=subject&searchWord=%EC%9D%B4%EC%88%9C%EC%8B%A0   (이순신)
        
        mav.addObject("gobackURL",gobackURL.replaceAll("&", " "));
        ///list.action
        ///list.action searchType= searchWord= currentShowPageNo=2
        ///list.action searchType=subject&searchWord=jaVa
        ///list.action searchType=subject searchWord=%EC%9D%B4%EC%88%9C%EC%8B%A0   (이순신)
        
        // === 페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 끝 ===
        
        
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
	    // 뷰단에 파일 originalFileName을 띄워주기 위한 것
	    Map<String, String> paraMap = new HashMap<String, String>();
	    paraMap.put("craft_image_orgFilename", imgList.get(0).get("craft_image_orgFilename").toString());
	    paraMap.put("craft_representative_image_orgFilename", imgList.get(0).get("craft_representative_image_orgFilename").toString());
	    paraMap.put("craft_certificate_orgFilename", imgList.get(0).get("craft_certificate_orgFilename").toString());
	    
	 
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
				    
				    System.out.println("list : " + imgList);
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
						
						String root = session.getServletContext().getRealPath("/").substring(0, 3);
				         //System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root); 

				 	    String path_whole = root + "Users"+File.separator+"user"+File.separator+"git"+File.separator+"FinalProject_GotGongBang"+File.separator+"FinalProject_GotGongBang"+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"resources"+File.separator+"img"+File.separator+"craft";
				 	     //System.out.println("~~~~ 확인용 path => " + path_whole);
				 	     
						// **** file 다운로드 하기 **** //
						boolean flag = false; // file 다운로드 성공, 실패를 알려주는 용도 
						flag = fileManager.doFileDownload(craft_image_fileName, craft_image_orgFilename, path_whole, response);
						flag = fileManager.doFileDownload(craft_representative_image_fileName, craft_representative_image_orgFilename, path_whole, response);
						flag = fileManager.doFileDownload(craft_certificate_fileName, craft_certificate_orgFilename, path_whole, response);

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

	   
	//공방 한 개보기 (대표자이름, 연락처, 한줄소개, 경력기간) 수정 
	@RequestMapping(value = "/craft_edit.got", method = {RequestMethod.POST})
	public ModelAndView craft_edit(ModelAndView mav, CraftVO cvo, HttpServletRequest request) {	 
		
		// 공방 정보 수정하기
	   int n = service.craft_edit(cvo);
		
	   if(n==0) {
		   mav.addObject("message","공방 정보 수정 실패");	
		   mav.addObject("loc","javascipt:history.back()");	
	   }else {
		   mav.addObject("message","공방 정보 수정 성공");	
		   mav.addObject("loc", request.getContextPath()+"/craft_view.got?craft_num_pk="+cvo.getCraft_num_pk());	
	   }
	   mav.setViewName("msg");
	
		return mav;
	}
		    
			  

	//공방 한 개보기 삭제 
	@RequestMapping(value = "/craft_del.got")
	public ModelAndView craft_del(ModelAndView mav, CraftVO cvo, HttpServletRequest request) {
		String craft_num_pk = request.getParameter("craft_num_pk");
		cvo = service.craft_edit_view(craft_num_pk);
		String fileName = cvo.getFileName();
		HttpSession session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root+"resources"+File.separator+"files";
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("craft_num_pk",craft_num_pk);
		paraMap.put("path", path);
		paraMap.put("fileName", fileName);
		
		
		int n = service.craft_del(paraMap);

	   if(n==0) {
		   mav.addObject("message","공방 정보 삭제 실패");	
		   mav.addObject("loc","javascipt:history.back()");	
	   }else {
		   mav.addObject("message","공방 삭제 성공");	
		   mav.addObject("loc", request.getContextPath()+"/craft_list.got");	
	   }
	   mav.setViewName("msg");

		return mav;
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
