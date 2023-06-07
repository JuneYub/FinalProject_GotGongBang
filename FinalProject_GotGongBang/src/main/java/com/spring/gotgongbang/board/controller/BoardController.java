package com.spring.gotgongbang.board.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.service.InterBoardService;
import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.member.model.MemberVO;


@Component
@Controller
public class BoardController {

	@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterBoardService service;
	
	@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;
	
	// 김진솔 시작
		// ===========================================================================
		// 김진솔 끝
		// ===========================================================================

	
	// 김나윤 시작
		// ===========================================================================
		// 김나윤 끝
		// ===========================================================================

	// 박준엽 시작
		// ===========================================================================

		// 박준엽 끝
		// ===========================================================================

	// 오준혁 시작
	// ===========================================================================
	
	// 고객센터_온라인문의 페이지 불러오기
	@RequestMapping(value="/board_inquiry.got")
	public ModelAndView getBoardInquiry(ModelAndView mav) {
		
		mav.setViewName("/board/board_inquiry.tiles1");
		
		return mav;		
	
	}
	
	// 공지사항 페이지 불러오기
	@RequestMapping(value="/board_notice.got")
    public ModelAndView getBoardNotice(ModelAndView mav) {
		
		mav.setViewName("/board/board_notice.tiles1");
		
		return mav;
	}
	
	// 질문게시판 페이지 불러오기
	@RequestMapping(value="/board_question.got")
    public ModelAndView getBoardQuestion(ModelAndView mav, HttpServletRequest request) {
		
		List<InquiryVO> iqList = null;
		
		// 조회수 증가
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"inquiry_title".equals(searchType) && !"user_id_fk".equals(searchType) )) {
			searchType = "";
		}
		
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;         // 총 게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수
		
		int startRno = 0; // 시작 행번호
		int endRno = 0;   // 끝 행번호
		
		// 총 게시물 건수
		totalCount = service.getTotalCount(paraMap);
		
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage);
		// (double)127/10  ==>  12.7  ==> Math.ceil(12.7) ==> 13.0  ==> (int)13.0 ==> 13 
		// (double)120/10  ==>  12.0  ==> Math.ceil(12.0) ==> 12.0  ==> (int)12.0 ==> 12  
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
		}
		else {
			try {
			   currentShowPageNo = Integer.parseInt(str_currentShowPageNo); 
			   if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
				   currentShowPageNo = 1;
			   }
			} catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		iqList = service.iqListSearchWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
		
		// 아래는 검색대상 컬럼과 검색어를 유지시키기 위한 것임.
		if( !"".equals(searchType) && !"".equals(searchWord) ) {
			mav.addObject("paraMap", paraMap);	
		}
		
		// === 페이지바 === //
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
			              1  2  3  4  5  6  7  8  9 10 [다음][마지막]  -- 1개블럭
			[맨처음][이전]  11 12 13 14 15 16 17 18 19 20 [다음][마지막]  -- 1개블럭
			[맨처음][이전]  21 22 23
		*/
		
		int loop = 1;
		/*
	    	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
	    */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //
		
		String pageBar = "<ul style='list-style: none;'>";
		String url = "board_question.got";
		
		// === [맨처음][이전] 만들기 === //
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";  
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; 
			}
			
			loop++;
			pageNo++;
			
		}// end of while-----------------------
		
		// === [다음][마지막] 만들기 === //
		if( pageNo <= totalPage ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>"; 
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		// 질문게시판 데이터 넘기기
		/* iqList = service.BoardQuestionList(); */
		
		mav.addObject("iqList", iqList);
		mav.setViewName("/board/board_BoardQuestion.tiles1");
		
		return mav;
	}
	
	// FAQ 페이지 불러오기
	@RequestMapping(value="/board-faq.got")
    public ModelAndView getBoardFaq(ModelAndView mav) {
		
		mav.setViewName("/board/board_BoardFaq.tiles1");
		
		return mav;
	}
	
	// 온라인 문의 완료
	@RequestMapping(value="/board_inquiryEnd.got", method={RequestMethod.POST})
	public ModelAndView pointPlus_iqEnd(Map<String, String> paraMap, ModelAndView mav, InquiryVO iqvo, MultipartHttpServletRequest request) {
		
		MultipartFile attach = iqvo.getAttach();
		
		if( !attach.isEmpty() ) {
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			
		//	System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root);
			// ~~~~ 확인용 webapp 의 절대경로 => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FinalProject_GotGongBang\
			
			String path = root+"resources"+File.separator+"files";
			
			 String newFileName = "";
			   // WAS(톰캣)의 디스크에 저장될 파일명 
			   
			   byte[] bytes = null;
			   // 첨부파일의 내용물을 담는 것
			   
			   long fileSize = 0;
			   // 첨부파일의 크기
			   
			   try {
					bytes = attach.getBytes();
					// 첨부파일의 내용물을 읽어오기
					
					String originalFilename = attach.getOriginalFilename();
					
			//      System.out.println("~~~~ 확인용 originalFilename => " + originalFilename); 
				    // ~~~~ 확인용 originalFilename => LG_싸이킹청소기_사용설명서.pdf
					
					newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
					// 첨부되어진 파일을 업로드 하는 것이다.
					
			// 		System.out.println(" === 확인용  newFileName => " + newFileName); 
				    // === 확인용  newFileName => 202306011525152650695539266000.pdf
				
					iqvo.setInquiry_fileName(newFileName);
					// WAS(톰캣)에 저장된 파일명(20230522103642842968758293800.pdf)
					
					iqvo.setInquiry_orgFilename(originalFilename);
					// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
					// 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
					
					fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
					iqvo.setInquiry_fileSize(String.valueOf(fileSize));
				
			   } catch (Exception e) {
				e.printStackTrace();
			   }
		}
		
		// 파일 첨부가 있는 온라인문의
		
		int n = 0;
		
		if( attach.isEmpty() ) {
			// 파일첨부가 없는 경우
			n = service.add(iqvo);
		}
		else {
			// 파일첨부가 있는 경우
			n = service.add_withFile(iqvo);
		}
		
		if(n==1) {
			mav.setViewName("/board/board_BoardQuestion.tiles1");
			
		}
		else {
			mav.setViewName("/board/board_BoardInquiery.tiles1");
		}
		
		// 파일 첨부 기능 없이 온라인 문의 데이터값 넘겨보기
		/*
		   int n = service.add(iqvo);
		  
		   mav.setViewName("/board/board_BoardQuestion.tiles1");
		*/
		
		return mav;
	}
	// 게시물 불러오기.
	@RequestMapping(value="/board_view.got")
	public ModelAndView view(ModelAndView mav, HttpServletRequest request) {
		
		String inquiry_num_pk = request.getParameter("inquiry_num_pk");
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchType == null) {
			searchType = "";
		}
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		String gobackURL = request.getParameter("gobackURL");
		System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		
		if( gobackURL != null && gobackURL.contains(" ") ) {
			gobackURL = gobackURL.replaceAll(" ", "&");
		}
		
		mav.addObject("gobackURL", gobackURL);
		
		try {
			Integer.parseInt(inquiry_num_pk);
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("seq", inquiry_num_pk);
			
			paraMap.put("searchType", searchType); // view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임.
			paraMap.put("searchWord", searchWord); // view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임. 
			
			mav.addObject("paraMap", paraMap); // view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임. 
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			String login_userid = null;
			if(loginuser != null) {
				login_userid = loginuser.getUser_id_pk();
				// login_userid 는 로그인 되어진 사용자의 userid 이다.
			}
			
			paraMap.put("login_userid", login_userid);
			
			InquiryVO iqvo = null;
			if( "yes".equals(session.getAttribute("readCountPermission")) ) { 
				
				
				iqvo = service.getView(paraMap);
				// 글조회수 증가와 함께 글1개를 조회를 해주는 것
				
				session.removeAttribute("readCountPermission");
				// 중요!!  session 에 저장된 readCountPermission 을 삭제한다.
			}
			else {
				// 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
				
				iqvo = service.getViewWithNoAddCount(paraMap);
				// 글조회수 증가는 없고 단순히 글1개를 조회를 해주는 것
			}
			
			mav.addObject("iqvo", iqvo);
		} catch (NumberFormatException e) {
			
		}
		
		mav.setViewName("/board/board_view.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value="//board_view.got_2.action")
	public ModelAndView view_2(ModelAndView mav, HttpServletRequest request) {
		
		String inquiry_num_pk = request.getParameter("inquiry_num_pk");
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String gobackURL = request.getParameter("gobackURL");
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		
		try {
			searchWord = URLEncoder.encode(searchWord, "UTF-8"); // 한글이 웹브라우저 주소창에서 사용되어질때 한글이 ? 처럼 안깨지게 하려고 하는 것임.
			gobackURL = URLEncoder.encode(gobackURL, "UTF-8");   // 한글이 웹브라우저 주소창에서 사용되어질때 한글이 ? 처럼 안깨지게 하려고 하는 것임.
			
		/*	
			System.out.println("~~~~ view_2의 URLEncoder.encode(searchWord, \"UTF-8\") : " + searchWord);
			System.out.println("~~~~ view_2의 URLEncoder.encode(gobackURL, \"UTF-8\") : " + gobackURL);
			
			System.out.println(URLDecoder.decode(searchWord, "UTF-8")); // URL인코딩 되어진 한글을 원래 한글모양으로 되돌려 주는 것임. 
			System.out.println(URLDecoder.decode(gobackURL, "UTF-8")); // URL인코딩 되어진 한글을 원래 한글모양으로 되돌려 주는 것임.
		*/	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		mav.setViewName("redirect:/board_view.got?seq="+inquiry_num_pk+"&searchType="+searchType+"&searchWord="+searchWord+"&gobackURL="+gobackURL);
		
		return mav;
		
	}
	
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
