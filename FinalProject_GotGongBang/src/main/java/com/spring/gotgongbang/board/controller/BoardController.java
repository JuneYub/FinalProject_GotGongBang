package com.spring.gotgongbang.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.admin.model.AdminVO;
import com.spring.gotgongbang.board.model.InquiryVO;
import com.spring.gotgongbang.board.model.NoticeVO;
import com.spring.gotgongbang.board.service.InterBoardService;
import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.common.MyUtil;
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
	
	
	// FAQ 페이지 불러오기
	@RequestMapping(value="/board-faq.got")
    public ModelAndView getBoardFaq(ModelAndView mav, HttpServletRequest request) {
		
		List<InquiryVO> iqvo = service.getFaq();
		
		mav.addObject("iqvo", iqvo);
		
		mav.setViewName("/board/board_Faq.tiles1");
		
		return mav;
	}
	
	
	
	
	// 고객센터_온라인문의 페이지 불러오기
	@RequestMapping(value="/board_inquiry.got")
	public ModelAndView getBoardInquiry(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, InquiryVO iqvo) {
	   
		HttpSession session = request.getSession();

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if (loginuser == null) { mav.setViewName("redirect:/login.got");
		  session.setAttribute("goBackURL", "/board_inquiry.got"); } else {
		    
		    String fk_seq = request.getParameter("fk_seq");
			String groupno = request.getParameter("groupno");
			String depthno = request.getParameter("depthno");
			String inquiry_title = "[답변] " + request.getParameter("inquiry_title");

		    if (fk_seq == null) {
		    	fk_seq = "";
		    }

		    mav.addObject("fk_seq", fk_seq);
		    mav.addObject("groupno", groupno);
		    mav.addObject("depthno", depthno);
		    mav.addObject("inquiry_title", inquiry_title);
		    
	//	    System.out.println("inquiry_title" + inquiry_title);
	//	    System.out.println("fk_seq" + fk_seq);
	//	    System.out.println("groupno" + groupno);
	//	    System.out.println("depthno" + depthno);
		    
		    mav.setViewName("/board/board_inquiry.tiles1");
		  }

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
				mav.setViewName("redirect:/board_question.got");
				
			}
			else {
				mav.setViewName("/board/board_inquiry.tiles1");
			}
			
			// 파일 첨부 기능 없이 온라인 문의 데이터값 넘겨보기
			/*
			   int n = service.add(iqvo);
			  
			   mav.setViewName("/board/board_question.tiles1");
			*/
			
			return mav;
		}
	
	// 질문게시판 페이지 불러오기
	@RequestMapping(value="/board_question.got")
    public ModelAndView getBoardQuestion(ModelAndView mav, HttpServletRequest request) {
		
		List<InquiryVO> iqvo = null;
		
		// 조회수 증가
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		/* session 에 readCountPermission 에 저장된 값  yes를 불러오려면
		       반드시 /board_question.got을 입력해야 얻을 수 있다.
		*/
	//	System.out.println("확인용 readCountPermission " + session.getAttribute("readCountPermission"));
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null || (!"inquiry_title".equals(searchType) && !"user_id_fk".equals(searchType) )) {
			searchType = "";
		}
		
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		Map<String, String> paraMap = new HashMap<String, String>();
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
		
		iqvo = service.iqListSearchWithPaging(paraMap);
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
		
		String gobackURL = MyUtil.getCurrentURL(request);
	//	System.out.println("~~~~ 확인용 gobackURL : " + gobackURL);
		// ~~~~ 확인용 gobackURL : /board_question.got
		// ~~~~ 확인용 gobackURL : /board_question.got?searchType=inquiry_title&searchWord=%E3%85%81%E3%84%B4%E3%85%87
		
		// 질문게시판 데이터 넘기기
		/* iqList = service.BoardQuestionList(); */
		
		mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
		
		mav.addObject("iqvo", iqvo);
		mav.setViewName("/board/board_BoardQuestion.tiles1");
		
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
		// System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
		// /board_question.got
		
		if( gobackURL != null && gobackURL.contains(" ") ) {
			gobackURL = gobackURL.replaceAll(" ", "&");
		}
		
		mav.addObject("gobackURL", gobackURL);
		
		try {
			Integer.parseInt(inquiry_num_pk);
			
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("inquiry_num_pk", inquiry_num_pk);
			
			paraMap.put("searchType", searchType); // board_view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임.
			paraMap.put("searchWord", searchWord); // board_view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임. 
			
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
				// "yes" 와 "readCountPermission" 값을 비교
				
			//	System.out.println("확인용 readCountPermission " + session.getAttribute("readCountPermission"));
				
				iqvo = service.getView(paraMap);
				// 조회수 증가와 함께 게시글 1개를 조회
				
				session.removeAttribute("readCountPermission");
				// 중요!!  session 에 저장된 readCountPermission 을 삭제한다.
			}
			else {
				// 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
				
				iqvo = service.getViewWithNoAddCount(paraMap);
				// 글조회수 증가는 없고 단순히 글1개를 조회를 해주는 것
			}
			
			
			mav.addObject("iqvo", iqvo);
			
		//	System.out.println("확인용 iqvo 최종"+iqvo);
			
		} catch (NumberFormatException e) {
			
		}
		
		
		mav.setViewName("board/board_view.tiles1");
		
		/*
		  System.out.println("확인용 inquiry_num_pk2 : " + inquiry_num_pk);
		  System.out.println("확인용 inquiry_content2 : " + inquiry_content);
		  System.out.println("확인용 inquiry_title2 : " + inquiry_title);
		*/
		
		return mav;
	}
	
	@RequestMapping(value="//board_view_2.got")
	public ModelAndView board_view_2(ModelAndView mav, HttpServletRequest request) {
		
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
			System.out.println("~~~~ board_view_2의 URLEncoder.encode(searchWord, \"UTF-8\") : " + searchWord);
			System.out.println("~~~~ board_view_2의 URLEncoder.encode(gobackURL, \"UTF-8\") : " + gobackURL);
			
			System.out.println(URLDecoder.decode(searchWord, "UTF-8")); // URL인코딩 되어진 한글을 원래 한글모양으로 되돌려 주는 것임. 
			System.out.println(URLDecoder.decode(gobackURL, "UTF-8")); // URL인코딩 되어진 한글을 원래 한글모양으로 되돌려 주는 것임.
		*/	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		mav.setViewName("redirect:/board_view.got?seq="+inquiry_num_pk+"&searchType="+searchType+"&searchWord="+searchWord+"&gobackURL="+gobackURL);
		
		return mav;
		
	}
	
	// 게시글 수정 페이지 요청.
		@RequestMapping(value="/board_edit.got")
		public ModelAndView requiredLogin_board_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
			
			String inquiry_num_pk = request.getParameter("inquiry_num_pk");
			
			// 수정해야할 게시글 1개 가져오기
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("inquiry_num_pk", inquiry_num_pk);
			
			//////////////////////////////
			paraMap.put("searchType", "");
			paraMap.put("searchWord", "");
			//////////////////////////////
			
			InquiryVO iqvo = service.getViewWithNoAddCount(paraMap);
			// 조회수 증가 없이 단순히 글1개만 조회
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if( !loginuser.getUser_id_pk().equals(iqvo.getUser_id_fk()) ) {
				
				String message = "다른 사용자의 글은 삭제가 불가합니다.";
				String loc = "javascript:history.back()";
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);
				mav.setViewName("msg");
			}
			else {
				// 자신의 글을 수정할 경우
				// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
				mav.addObject("iqvo", iqvo);
				mav.setViewName("/board/board_edit.tiles1");
			}
			
			return mav;
		}
		
		// 게시글  수정 페이지 완료하기 
		@RequestMapping(value="/editEnd.got", method= {RequestMethod.POST})
		public ModelAndView requiredLogin_editEnd(ModelAndView mav, InquiryVO iqvo, HttpServletRequest request) {
			
			int n = service.edit(iqvo);
			// n 이 1 이라면 정상적으로 변경됨.
			// n 이 0 이라면 글수정에 필요한 글암호가 틀린경우임.
			
			if(n==0) {
				mav.addObject("message", "로그인을 해주세요~");
				mav.addObject("loc", "javascript:history.back()");
			}
			else {
				mav.addObject("message", "글 수정 성공!!");
				mav.addObject("loc", request.getContextPath()+"/board_view.got?inquiry_num_pk="+iqvo.getInquiry_num_pk());
			}
			
			mav.setViewName("msg");
			
			return mav;
		}
	
	// 공지사항 페이지 불러오기
		@RequestMapping(value="/board_notice.got")
	    public ModelAndView requiredLogin_getBoardNotice(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
			
			List<NoticeVO> novo = null;
			
			// 조회수 증가
			HttpSession session = request.getSession();
			session.setAttribute("readCountPermission", "yes");
			/* session 에 readCountPermission 에 저장된 값  yes를 불러오려면
			       반드시 /board_question.got을 입력해야 얻을 수 있다.
			*/
			//	System.out.println("확인용 readCountPermission " + session.getAttribute("readCountPermission"));
			
			String searchType = request.getParameter("searchType");
			String searchWord = request.getParameter("searchWord");
			String str_currentShowPageNo = request.getParameter("currentShowPageNo");
			
			if(searchType == null || (!"notice_title".equals(searchType) && !"admin_id_fk".equals(searchType) )) {
				searchType = "";
			}
			
			if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty() ) {
				searchWord = "";
			}
			
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("searchType", searchType);
			paraMap.put("searchWord", searchWord);
			
			int totalCount = 0;         // 총 게시물 건수
			int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 건수 
			int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
			int totalPage = 0;          // 총 페이지수
			
			int startRno = 0; // 시작 행번호
			int endRno = 0;   // 끝 행번호
			
			// 총 게시물 건수
			totalCount = service.getnoTotalCount(paraMap);
			
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
			
			novo = service.noiqListSearchWithPaging(paraMap);
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
			String url = "board_notice.got";
			
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
			
			String gobackURL = MyUtil.getCurrentURL(request);
		//	System.out.println("~~~~ 확인용 gobackURL : " + gobackURL);
			// ~~~~ 확인용 gobackURL : /board_question.got
			// ~~~~ 확인용 gobackURL : /board_question.got?searchType=inquiry_title&searchWord=%E3%85%81%E3%84%B4%E3%85%87
			
			// 질문게시판 데이터 넘기기
			/* iqList = service.BoardQuestionList(); */
			
			mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
			
			mav.addObject("novo", novo);
			mav.setViewName("/board/board_notice.tiles1");
			
			return mav;
		}
		
		// 공지사항_글쓰기 페이지 불러오기
		@RequestMapping(value="/board_noticeiq.got")
		public ModelAndView requiredLogin_getNoticeiq(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, NoticeVO novo) {
		   
			    
				String notice_title = "[공지] " + request.getParameter("notice_title");

				
			    mav.addObject("notice_title", notice_title);
			
		//	    System.out.println("notice_title" + notice_title);
			    
			    mav.setViewName("/board/board_noticeiq.tiles1");
			  

			    return mav;
		}
	
	// 공지사항 글쓰기 완료
	@RequestMapping(value="/board_noticeiqEnd.got", method={RequestMethod.POST})
	public ModelAndView pointPlus_noticeEnd( ModelAndView mav, NoticeVO novo, AdminVO advo) {
	
		
		int n = 0;
		
		n = service.add_notice(novo);
		
		if(n==1) {
			mav.setViewName("redirect:/board_notice.got");
			
		}
		else {
			mav.setViewName("/board/board_noticeiq.tiles1");
		}
		
		return mav;
	}
	
	// 공지사항 게시물 불러오기.
		@RequestMapping(value="/board_notiview.got")
		public ModelAndView notiview(ModelAndView mav, HttpServletRequest request) {
			
			String notice_num_pk = request.getParameter("notice_num_pk");
		
			String gobackURL = request.getParameter("gobackURL");
			// System.out.println("~~~ 확인용 gobackURL : " + gobackURL);
			// /board_question.got
			
			if( gobackURL != null && gobackURL.contains(" ") ) {
				gobackURL = gobackURL.replaceAll(" ", "&");
			}
			
			mav.addObject("gobackURL", gobackURL);
			
			try {
				Integer.parseInt(notice_num_pk);
				
				Map<String, String> paraMap = new HashMap<String, String>();
				paraMap.put("notice_num_pk", notice_num_pk);
				
				mav.addObject("paraMap", paraMap); // view.jsp 에서 이전글제목 및 다음글제목 클릭시 사용하기 위해서 임. 
				
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
				
				String login_userid = null;
				
				if(loginuser != null) {
					login_userid = loginuser.getUser_id_pk();
					// login_userid 는 로그인 되어진 사용자의 userid 이다.
				}
				
				paraMap.put("login_userid", login_userid);
				
				NoticeVO novo = null;
				if( "yes".equals(session.getAttribute("readCountPermission")) ) { 
					// "yes" 와 "readCountPermission" 값을 비교
					
				//	System.out.println("확인용 readCountPermission " + session.getAttribute("readCountPermission"));
					
					novo = service.getnotiView(paraMap);
					// 조회수 증가와 함께 게시글 1개를 조회
					
					session.removeAttribute("readCountPermission");
					// 중요!!  session 에 저장된 readCountPermission 을 삭제한다.
				}
				else {
					// 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
					
					novo = service.getnotiViewWithNoAddCount(paraMap);
					// 글조회수 증가는 없고 단순히 글1개를 조회를 해주는 것
				}
				
				
				mav.addObject("novo", novo);
				
			//	System.out.println("확인용 iqvo 최종"+iqvo);
				
			} catch (NumberFormatException e) {
				
			}
			
			
			mav.setViewName("board/board_notiview.tiles1");
			
		
			
			return mav;
		}	
		
		@RequestMapping(value="//board_notiview_2.got")
		public ModelAndView board_notiview_2(ModelAndView mav, HttpServletRequest request) {
			
			String notice_num_pk = request.getParameter("notice_num_pk");
			String gobackURL = request.getParameter("gobackURL");
			
			HttpSession session = request.getSession();
			session.setAttribute("readCountPermission", "yes");
			
			try {
			
				gobackURL = URLEncoder.encode(gobackURL, "UTF-8");   // 한글이 웹브라우저 주소창에서 사용되어질때 한글이 ? 처럼 안깨지게 하려고 하는 것임.
		
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
			
			mav.setViewName("redirect:/board_notiview.got?notice_num_pk="+notice_num_pk+"&gobackURL="+gobackURL);
			
			return mav;
			
		}
		
		// 공지사항 수정 페이지 요청.
		@RequestMapping(value="/board_notiedit.got")
		public ModelAndView requiredLogin_board_notiedit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
			
			String notice_num_pk = request.getParameter("notice_num_pk");
			
			// 수정해야할 게시글 1개 가져오기
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("notice_num_pk", notice_num_pk);
			
			NoticeVO novo = service.getnotiViewWithNoAddCount(paraMap);
			// 조회수 증가 없이 단순히 글1개만 조회
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if( !loginuser.getUser_id_pk().equals(novo.getAdmin_id_fk()) ) {
				
				String message = "다른 사용자의 글은 삭제가 불가합니다.";
				String loc = "javascript:history.back()";
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);
				mav.setViewName("msg");
			}
			else {
				// 자신의 글을 수정할 경우
				// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
				mav.addObject("novo", novo);
				mav.setViewName("/board/board_notiedit.tiles1");
			}
			
			return mav;
		}
		
		// 공지사항  수정 페이지 완료하기 
		@RequestMapping(value="/notieditEnd.got", method= {RequestMethod.POST})
		public ModelAndView notieditEnd(ModelAndView mav, NoticeVO novo, HttpServletRequest request) {
			
			int n = service.notiedit(novo);
			// n 이 1 이라면 정상적으로 변경됨.
			// n 이 0 이라면 글수정에 필요한 글암호가 틀린경우임.
			
			if(n==0) {
				mav.addObject("message", "로그인을 해주세요~");
				mav.addObject("loc", "javascript:history.back()");
			}
			else {
				mav.addObject("message", "글 수정 성공!!");
				mav.addObject("loc", request.getContextPath()+"/board_notiview.got?notice_num_pk="+novo.getNotice_num_pk());
			}
			
			mav.setViewName("msg");
			
			return mav;
		}
		
		// 글삭제  페이지 요청  
		@RequestMapping(value="/board_notidel.got")
		public ModelAndView requiredLogin_notidel(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

			// 삭제해야 할 글번호 가져오기
			String notice_num_pk = request.getParameter("notice_num_pk");
			
			// 삭제해야할 글1개 내용 가져와서 로그인한 사람이 쓴 글이라면 글삭제가 가능하지만
			// 다른 사람이 쓴 글은 삭제가 불가하도록 해야 한다.
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("notice_num_pk", notice_num_pk);
			
			NoticeVO novo = service.getnotiViewWithNoAddCount(paraMap);
			// 글조회수(readCount) 증가 없이 단순히 글1개만 조회해주는 것이다.
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if( !loginuser.getUser_id_pk().equals(novo.getAdmin_id_fk()) ) {
				
				String message = "다른 사용자의 글은 삭제가 불가합니다.";
				String loc = "javascript:history.back()";
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);
				mav.setViewName("msg");
			}
			else {
				
				mav.addObject("notice_num_pk", notice_num_pk);
				mav.setViewName("board/board_del.tiles1");
			}
			
			return mav;	
			
		}
	
	// 글삭제  페이지 요청  
	@RequestMapping(value="/board_del.got")
	public ModelAndView requiredLogin_del(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		// 삭제해야 할 글번호 가져오기
		String inquiry_num_pk = request.getParameter("inquiry_num_pk");
		
		// 삭제해야할 글1개 내용 가져와서 로그인한 사람이 쓴 글이라면 글삭제가 가능하지만
		// 다른 사람이 쓴 글은 삭제가 불가하도록 해야 한다.
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("inquiry_num_pk", inquiry_num_pk);
		
		/////////////////////////////////
		paraMap.put("searchType", "");
		paraMap.put("searchWord", "");
		/////////////////////////////////
		
		InquiryVO iqvo = service.getViewWithNoAddCount(paraMap);
		// 글조회수(readCount) 증가 없이 단순히 글1개만 조회해주는 것이다.
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( !loginuser.getUser_id_pk().equals(iqvo.getUser_id_fk()) ) {
			
			String message = "다른 사용자의 글은 삭제가 불가합니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		else {
			
			mav.addObject("inquiry_num_pk", inquiry_num_pk);
			mav.setViewName("board/board_del.tiles1");
		}
		
		return mav;	
		
	}
	
	// 글삭제  페이지 완료하기 
		@RequestMapping(value="/delEnd.got", method= {RequestMethod.POST}) 
		public ModelAndView requiredLogin_delEnd(ModelAndView mav, HttpServletRequest request) {
			
			String inquiry_num_pk = request.getParameter("inquiry_num_pk");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("inquiry_num_pk", inquiry_num_pk);
			
			////////////////////////////////////////////////////////////////////
			// === #164. 파일첨부가 된 글이라면 글 삭제시 먼저 첨부파일을 삭제해주어야 한다. === //
			paraMap.put("searchType", "");
			paraMap.put("searchWord", "");
			
			InquiryVO iqvo = service.getViewWithNoAddCount(paraMap);
			String inquiry_fileName = iqvo.getInquiry_fileName();
			
			if( inquiry_fileName !=null && !"".equals(inquiry_fileName) ) {
				HttpSession session = request.getSession();
				String root = session.getServletContext().getRealPath("/");
				String path = root+"resources"+File.separator+"files";
				
				paraMap.put("path", path); 			// 삭제해야할 파일이 저장된 경로.
				paraMap.put("inquiry_fileName",inquiry_fileName);	// 삭제해야할 파일명.
			}
			
			int n = service.del(paraMap);
			
			if(n==1) {
				mav.addObject("message", "글 삭제 성공!!");
				mav.addObject("loc", request.getContextPath()+"/board_question.got");
			}
			else {
				mav.addObject("message", "글 삭제 실패!!");
				mav.addObject("loc", "javascript:history.back()");
			}
			
			mav.setViewName("msg");
			
			return mav;
		}	
		
		//  첨부파일 다운로드 받기  //
		@RequestMapping(value="/board_download.got")
		public void requiredLogin_download(HttpServletRequest request, HttpServletResponse response) {
			
			String inquiry_num_pk = request.getParameter("inquiry_num_pk");
			// 첨부파일이 있는 글번호 
			
			/*
			      첨부파일이 있는 글번호에서
			   20230522111434845240692872800.pdf 처럼
			     이러한 fileName 값을 DB에서 가져와야 한다.
			     또한 orgFilename 값도  DB에서 가져와야 한다.
			*/
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("searchType", "");
			paraMap.put("searchWord", "");
			paraMap.put("inquiry_num_pk", inquiry_num_pk);
			
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = null;
		    // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
			
			try {
			    Integer.parseInt(inquiry_num_pk);
			    InquiryVO iqvo = service.getViewWithNoAddCount(paraMap);
			
				if( iqvo == null || (iqvo != null && iqvo.getInquiry_fileName() == null ) ) {
					out = response.getWriter();
					// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
					
					out.println("<script type='text/javascript'>alert('존재하지 않는 글번호 이거나 첨부파일이 없으므로 파일다운로드가 불가합니다.'); history.back();</script>"); 
					return; // 종료
				}
				else {
					// 정상적으로 다운로드를 할 경우 
					
					String fileName = iqvo.getInquiry_fileName();
					// 20230522111434845240692872800.pdf  이것인 바로 WAS(톰캣) 디스크에 저장된 파일명이다. 
					
					String orgFilename = iqvo.getInquiry_orgFilename();
					// LG_싸이킹청소기_사용설명서.pdf   다운로드시 보여줄 파일명 
					
					
					// 첨부파일이 저장되어 있는 WAS(톰캣)의 디스크 경로명을 알아와야만 다운로드를 해줄수 있다. 
		            // 이 경로는 우리가 파일첨부를 위해서 /addEnd.action 에서 설정해두었던 경로와 똑같아야 한다.
		            // WAS 의 webapp 의 절대경로를 알아와야 한다.
					HttpSession session = request.getSession();
					String root = session.getServletContext().getRealPath("/");
					
	            //	System.out.println("~~~~ 확인용 webapp 의 절대경로 => " + root); 
				//	~~~~ 확인용 webapp 의 절대경로 => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\
						
					String path = root+"resources"+File.separator+"files";
					/* File.separator 는 운영체제에서 사용하는 폴더와 파일의 구분자이다.
				             운영체제가 Windows 이라면 File.separator 는  "\" 이고,
				             운영체제가 UNIX, Linux, 매킨토시(맥) 이라면  File.separator 는 "/" 이다. 
				    */
						
				   // path 가 첨부파일이 저장될 WAS(톰캣)의 폴더가 된다.
				// System.out.println("~~~~ 확인용 path => " + path);
				   // ~~~~ 확인용 path => C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files 
					
				   
					// **** file 다운로드 하기 **** //
					boolean flag = false; // file 다운로드 성공, 실패를 알려주는 용도 
					flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
					// file 다운로드 성공시 flag 는 true, 
					// file 다운로드 실패시 flag 는 false 를 가진다. 
					
					if(!flag) {
						// 다운로드가 실패할 경우 메시지를 띄워준다.
						out = response.getWriter();
						// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
						
						out.println("<script type='text/javascript'>alert('파일다운로드가 실패되었습니다.'); history.back();</script>");
					}
					
				}
				
			} catch(NumberFormatException | IOException e) {
				try {
					out = response.getWriter();
					// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
					
					out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>"); 
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
			}
			
			
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
