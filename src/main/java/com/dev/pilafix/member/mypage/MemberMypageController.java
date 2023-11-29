package com.dev.pilafix.member.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberMypageController {
	@GetMapping("/getPaymentHistory.do")
	public String getMypage() {
		return "member/paymentHistory";
	}

}
