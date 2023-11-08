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

	// selectMeOrTr.jsp���� �Ѿ�� ��(csRoleCode)�޾Ƽ� ȸ�� ���� ���� �Ķ���ͷ� �Ѱ���
	@GetMapping("/getUserRole.do")
	public String getUserRole(@RequestParam("csRoleCode") String csRoleCode ) {
		//�׽�Ʈ�� System.out.println(csRoleCode);
		String code = "";
		if (csRoleCode.equals("ME")) {
			code = "ME";
		} else if (csRoleCode.equals("TR")) {
			code = "TR";
		}
		
		return "member_signup/insertMember.jsp?csRoleCode=" + code;

	}
	// ���̵� �ߺ� üũ
	@GetMapping("/csEmailIdCheck.do")
	public String csEmailIdCheck() {
		return "";
	}
	
	

	// ȸ�� ���Թ�ư ������ ���� /ȸ������ �Ϸ��ϸ� �α��� ȭ������ �ϴ� ����
	@PostMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "member_signup/loginEx.jsp";
	}

}
