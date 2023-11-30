package com.dev.pilafix.member.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberMypageController {
	//화면보여주기 위한 것
	@GetMapping("/getPaymentHistory.do")
	public String getPaymentHistory() {
		return "member/paymentHistory";
	}
	@GetMapping("/getPaymentHistoryDetail.do")
	public String getPaymentHistoryDetail() {
		return "member/paymentHistory_detail";
	}

}
