package com.dev.pilafix.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class TestMemberController {
	
	
	// 센터 연동
	@GetMapping("/testCCenter.do")
	public String testCCenter() {
		
		return null;
	}
	
	// 마이페이지
	@GetMapping("/testMyPage.do")
	public String testMyPage() {
		
		return null;
	}
	
	// 커뮤니티 
	@GetMapping("/testCommunity.do")
	public String testCommunity() {
		
		return null;
	}
	
	// 수강권 구매 
	@GetMapping("/testPurchase.do")
	public String testPurchase() {
		
		return null;
	}
	
	
	// 예약하기- 그룹
	@GetMapping("/testReservG.do")
	public String testReservG() {
		
		return null;
	}
	
	
}
