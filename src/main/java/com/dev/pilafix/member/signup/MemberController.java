package com.dev.pilafix.member.signup;

import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@GetMapping("/selectMeOrTr.do")
	public String selectForm() {
		return "member_signup/selectMeOrTr.jsp";
	}

	// selectMeOrTr.jsp에서 넘어온 값(csRoleCode)받아서 회원 가입 폼에 파라미터로 넘겨줌
	@GetMapping("/getUserRole.do")
	public String getUserRole(@RequestParam("csRoleCode") String csRoleCode ) {
		//테스트용 System.out.println(csRoleCode);
		String code = "";
		if (csRoleCode.equals("ME")) {
			code = "ME";
		} else if (csRoleCode.equals("TR")) {
			code = "TR";
		}
		
		return "member_signup/insertMember.jsp?csRoleCode=" + code;

	}
	// 아이디 중복 체크
	@GetMapping("/csEmailIdCheck.do")
	public String csEmailIdCheck() {
		return "";
	}
	
	

	// 회원 가입버튼 누르면 실행 /회원가입 완료하면 로그인 화면으로 일단 보냄
	@PostMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "member_signup/loginEx.jsp";
	}

}
