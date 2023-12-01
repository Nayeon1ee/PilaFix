package com.dev.pilafix.member.mypage;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberMypageController {
	@Autowired
	private MemberMypageService service;
	
	//마이페이지 - 결제 내역 화면 보여줌
	@GetMapping("/getPaymentHistory.do")
	public String getPaymentHistory(HttpSession session,Model model) {
		
		Map<String,Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int csMemberCode = (int) user.get("csMemberCode");
		
		model.addAttribute("paymentInfo", service.getMyPaymentInfo(csMemberCode));
		
		return "member/paymentHistory";
	}
	
	@GetMapping("/getPaymentHistoryDetail.do")
	public String getPaymentHistoryDetail() {
		return "member/paymentHistory_detail";
	}
	
}
