package com.dev.pilafix.member.mypage;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dev.pilafix.common.member.CenterVO;

@Controller
public class MemberMypageController {
	@Autowired
	private MemberMypageService service;
	
	
	@GetMapping("/myPage.do")
	public String ShowMypage(HttpSession session, Model model) {
		Map<String,Object> user = (Map<String, Object>) session.getAttribute("userLogin");
		
		if(user!=null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("groupTicket",service.getGroupTicketByMember(csMemberCode));
			model.addAttribute("personalTicket",service.getPersonalTicketByMember(csMemberCode));
			return "member/member_mypage";
		}
		else {
			return "member/login";
		}
	}
	
	//마이페이지 - 결제 내역 화면 보여줌
	@GetMapping("/getPaymentHistory.do")
	public String getPaymentHistory(HttpSession session,Model model) {
		
		Map<String,Object> user = (Map<String, Object>) session.getAttribute("userLogin");
		int csMemberCode = (int) user.get("csMemberCode");
		
		model.addAttribute("paymentInfo", service.getMyPaymentInfo(csMemberCode));
		
		return "member/paymentHistory";
	}
	
	@GetMapping("/getPaymentHistoryDetail.do")
	public String getPaymentHistoryDetail() {
		return "member/paymentHistory_detail";
	}
	
	/**
	 * 마이페이지- 연동센터
	 */
	@GetMapping("/getMyConnCenterList.do")
	public String myConnCenterList(HttpSession session,Model model) {
		Map<String,Object> user = (Map<String, Object>) session.getAttribute("userLogin");
		int csMemberCode = (int) user.get("csMemberCode");
		model.addAttribute("", service.getConnectedCenterList(csMemberCode));
		
		return "member/center_linkmanagement";
		
		
	}
	
	
	
	
}
