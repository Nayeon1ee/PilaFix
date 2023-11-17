package com.dev.pilafix.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class LoginTestController {
	
	@Autowired
	LoginTestServiceImpl service;
	
	//step01
	@GetMapping("/signupTest.do")
	public String signupTest() {
		return "member/login_test_signup";
	}
	
	//step02
	@PostMapping("/signupTest.do")
	public String signupTest(MemberVO vo) {
		
		boolean result = service.signupTest(vo);
		
		if(result) {
			return "member/login_test_form";
		}else {
			//실패 시 회원가입 페이지로 다시 이동 
			return "member/login_test_signup";
		}
	}
	
	//step03
	@GetMapping("/loginTest.do")
	public String loginTest() {
		return "member/login_test_form";
	}
	
	@PostMapping("/loginTest.do")
	public String loginTest(String id, String pw,HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);

		if(session!=null) {
			boolean result = service.loginTest(id, pw);
			
			//서비스에서 받아온 값이 true이면 메인으로 이동 
			//서비스에서 받아온 값이 false이면 로그인 실패로 다시 로그인 화면으로 이동 
			
			if(result) {
				System.out.println("로그인 성공 ");
				session.setAttribute("id", id); //비밀번호 변경 위함 
				return "member/login_test_success";
			}else {
				System.out.println("로그인 실패 ");
				return "redirect:loginTest.do";
//				return "member/login_test_fail";
			}
		}
		
		return "";
	}
	
	
	@GetMapping("/pwTest.do")
	public String pwTest(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if(session!=null) {
			model.addAttribute("id", session.getAttribute("id"));
		}

		return "member/login_test_edit_pw";
	}
	
	@PostMapping("/pwTest.do")
	public String pwTest(String id, String currentPw, String newPw) {
		service.pwUpdateTest(id, currentPw, newPw);
		
		
		return "redirect:loginTest.do";
	}
}
