package com.spring.gotgongbang.craft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gotgongbang.common.FileManager;
import com.spring.gotgongbang.craft.model.CraftVO;
import com.spring.gotgongbang.craft.model.PartnerVO;
import com.spring.gotgongbang.craft.service.InterCraftService;
import com.spring.gotgongbang.order.model.OrderVO;

@Controller
public class CraftController {

	@Autowired // spring이 알아서 type에 따라서 bean을 주입해준다.
	private InterCraftService service;

	@Autowired
	private FileManager fileManager;

	// 김나윤 시작
	// ===========================================================================
	@RequestMapping(value = "/crafts_detail.got")
	public ModelAndView craftDetail(ModelAndView mav) {
		mav.setViewName("/craft/craft_detail.tiles1");
		return mav;
	}

//	@RequestMapping(value="/crafts_list.got")
//	public ModelAndView craftList(ModelAndView mav) {
//		mav.setViewName("/craft/craft_list.tiles1");
//		return mav;
//	}

	@RequestMapping(value = "/crafts_list_10bag.got")
	public ModelAndView craftList_10bag(ModelAndView mav) {
		mav.setViewName("/craft/craft_list_10bag.tiles1");
		return mav;
	}

	@RequestMapping(value = "/crafts_list_20shoes.got")
	public ModelAndView craftList_20shoes(ModelAndView mav) {
		mav.setViewName("/craft/craft_list_20shoes.tiles1");
		return mav;
	}

	@RequestMapping(value = "/crafts_list_30wallet.got")
	public ModelAndView craftList_30wallet(ModelAndView mav) {
		mav.setViewName("/craft/craft_list_30wallet.tiles1");
		return mav;
	}

	@RequestMapping(value = "/crafts_list_40cloth.got")
	public ModelAndView craftList_40cloth(ModelAndView mav) {
		mav.setViewName("/craft/craft_list_40cloth.tiles1");
		return mav;
	}

	@RequestMapping(value = "/crafts_list.got")
	public ModelAndView crafts_list_select(ModelAndView mav) {

		List<CraftVO> craftsList = null;

		craftsList = service.crafts_list_select();

		/*
		 * for(int i = 0; i< craftsList.size(); i++) {
		 * System.out.println(craftsList.get(i).getCraft_name());
		 * System.out.println(craftsList.get(i).getCraft_Introduce());
		 * 
		 * }
		 */

		mav.addObject("craftsList", craftsList);
		mav.setViewName("/craft/craft_list.tiles1");

		return mav;

	}

	/*
	 * @RequestMapping(value="/crafts_detail.got") public ModelAndView
	 * crafts_detail_select(ModelAndView mav) {
	 * 
	 * List<CraftVO> craftsList_2 = null;
	 * 
	 * craftsList_2 = service.crafts_detail_select();
	 * 
	 * 
	 * for(int i = 0; i< craftsList.size(); i++) {
	 * System.out.println(craftsList.get(i).getCraft_name());
	 * System.out.println(craftsList.get(i).getCraft_Introduce());
	 * 
	 * }
	 * 
	 * 
	 * mav.addObject("craftsList_2", craftsList_2);
	 * mav.setViewName("/craft/crafts_detail.tiles1");
	 * 
	 * 
	 * 
	 * return mav;
	 * 
	 * }
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/crafts_list.got") public ModelAndView
	 * crafts_list_select(HttpServletRequest request, HttpServletResponse response,
	 * ModelAndView mav) {
	 * 
	 * String craft_specialty = request.getParameter("craft_specialty");
	 * 
	 * List<CraftVO> cvo = service.crafts_list_select(craft_specialty);
	 * 
	 * JSONArray jsonArr = new JSONArray();
	 * 
	 * for(CraftVO craftvo : cvo ) { JSONObject jsonObj = new JSONObject();
	 * jsonObj.put("craft_name", craftvo.getCraft_name());
	 * jsonObj.put("craft_introduce", craftvo.getCraft_Introduce());
	 * jsonObj.put("craft_representative", craftvo.getCraft_representative());
	 * jsonObj.put("craft_image", craftvo.getCraft_image());
	 * 
	 * jsonArr.put(jsonObj);
	 * 
	 * }
	 * 
	 * System.out.println(jsonArr); // console.log(jsonArr);
	 * mav.setViewName("/craft/craft_list.tiles1"); return mav; }
	 */

	// 김나윤 끝
	// ===========================================================================

	// 김진솔 시작
	// ===========================================================================

	@RequestMapping(value = "/craft_agree.got") // 공방 약관동의
	public ModelAndView craftAgree(ModelAndView mav) {
		mav.setViewName("craft/craftAgree.tiles1");
		return mav;
	}

	@RequestMapping(value = "/craft_application.got") // 공방 신청
	public ModelAndView craftApplication(ModelAndView mav) {
		mav.setViewName("craft/craftApplication.tiles1");
		return mav;
	}

	@RequestMapping(value = "/craft_complete.got") // 신청 완료 페이지
	public ModelAndView craftComplete(ModelAndView mav) {
		mav.setViewName("craft/craftComplete.tiles1");
		return mav;
	}

	// == 이미 존재하는 '공방이름'인지 알아오기 위한 것 == //
	@ResponseBody
	@RequestMapping(value = "/craft_check_name.got", method = { RequestMethod.POST })
	public String craft_check_name(HttpServletRequest request) {
		String craft_name = request.getParameter("nickname");
		int n = 0;
		try {
			n = service.craft_check_name(craft_name);
		} catch (Throwable e) {
			e.printStackTrace();
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);

		return jsonObj.toString();

	}

	@RequestMapping(value = "/craft_application_end.got", method = { RequestMethod.POST })
	public ModelAndView craft_application_end(ModelAndView mav, CraftVO craftvo, MultipartHttpServletRequest mrequest) {

		return mav;
	}

	// 김진솔 끝
	// ===========================================================================

	// 박준엽 시작
	// ===========================================================================

	@RequestMapping(value = "/estimate_inquiry_list.got")
	public ModelAndView getEstimateInquiryList(ModelAndView mav, HttpServletRequest request) {

		String userid = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		int totalCountForEstimate = 0;
		int sizePerPageForEstimate = 5;
		int currentShowPageNoForEstimate = 0;
		int totalPageForEstimate = 0;

		int startRno = 0;
		int endRno = 0;

		totalCountForEstimate = service.getTotalCountForEstimate();

		totalPageForEstimate = (int) Math.ceil((double) totalCountForEstimate / sizePerPageForEstimate);
		if (str_currentShowPageNo == null) {
			currentShowPageNoForEstimate = 1;
		} else {
			try {
				currentShowPageNoForEstimate = Integer.parseInt(str_currentShowPageNo);
				if (currentShowPageNoForEstimate < 1 || currentShowPageNoForEstimate > totalPageForEstimate) {
					currentShowPageNoForEstimate = 1;
				}
			} catch (NumberFormatException e) {
				currentShowPageNoForEstimate = 1;
			}
		}
		startRno = ((currentShowPageNoForEstimate - 1) * sizePerPageForEstimate) + 1;
		endRno = startRno + sizePerPageForEstimate - 1;

		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));

		OrderVO ovo = new OrderVO();
		List<OrderVO> ovoList = service.getAllOrders(paraMap);

		String pageBar = makePageBar(currentShowPageNoForEstimate, 10, totalCountForEstimate);

		mav.addObject("pageBar", pageBar);
		mav.addObject("ovoList", ovoList);
		mav.setViewName("/craft/estimateInquiryList.tiles1");
		return mav;
	}

	@RequestMapping(value = "/estimate_inquiry_list/bid.got")
	public ModelAndView bid(ModelAndView mav) {
		mav.setViewName("/none_tiles/craft/bid");
		return mav;
	}

	@RequestMapping(value = "/repair_history_list.got")
	public ModelAndView repairHistoryList(ModelAndView mav) {
		mav.setViewName("/craft/repairHistoryList.tiles1");
		return mav;
	}

	@RequestMapping(value = "/edit_craft_user_info.got")
	public ModelAndView editCraftInfo(ModelAndView mav) {

		String userid = "test1234"; // 현재는 테스트 계정으로 로그인 이후에 세션 값으로 수정할 것

		PartnerVO pvo = new PartnerVO();
		pvo = service.getPartnerInfoByUserId(userid);
		mav.addObject("pvo", pvo);
		mav.setViewName("/craft/editCraftUserInfo.tiles1");
		return mav;
	}

	@RequestMapping(value = "/edit_craft_user_info_end.got")
	public ModelAndView editCraftInfoEnd(ModelAndView mav, HttpServletRequest request, PartnerVO pvo) {

		int n = 0;
		n = service.updatePartnerInfo(pvo);

		if (pvo.getPartner_pwd() != null && pvo.getPartner_pwd() != "") {
			n = service.updatePartnerPwd(pvo);
		}
		String message = "";
		String loc = "";

		if (n == 1) {
			message = "정상적으로 변경되었습니다.";
			loc = request.getContextPath() + "/index.got";
		}

		else {
			message = "오류가 발생했습니다";
			loc = "javascript:history.back();";
		}

		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		mav.setViewName("msg");
		return mav;
	}

	public String makePageBar(int currentShowPageNo, int blockSize, int totalPage) {
		int loop = 1;
		int startPageNo = (currentShowPageNo - 1) / blockSize * blockSize + 1;

		String pageBar = "<ul class='pageBar'>";
		String url = "estimate_inquiry_list.got";

		if (startPageNo != 1) {
			pageBar += "<li class='pageBar-edge'><a href='" + url + "?currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li class='pageBar-move'><a href='" + url + "?currentShowPageNo=" + (startPageNo - 1)
					+ "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || startPageNo > totalPage)) {
			if (startPageNo == currentShowPageNo) {
				pageBar += "<li class='pageBar-currentNo'>" + currentShowPageNo + "</li>";
			} else {
				pageBar += "<li class='pageBar-currentNo'><a href='" + url + "?currentShowPageNo=" + currentShowPageNo
						+ "'>" + currentShowPageNo + "</a></li>";
			}

			loop++;
			startPageNo++;
		}

		if (startPageNo <= totalPage) {
			pageBar += "<li class='pageBar-move><a href='" + url + "?currentShowPageNo=" + currentShowPageNo
					+ "'>[다음]</a></li>";
			pageBar += "<li class='pageBar-edge><a href='" + url + "?currentShowPageNo=" + totalPage
					+ "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		return pageBar;
	}

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
