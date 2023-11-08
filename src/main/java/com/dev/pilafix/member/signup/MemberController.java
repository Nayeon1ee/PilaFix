package com.dev.pilafix.member.signup;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// ���̵� üũ
//	@RequestMapping("/idCheck.do")
//	@ResponseBody
//	public Map<Object, Object> idcheck(@RequestBody String csEmailId) {
//
//		int count = 0;
//		Map<Object, Object> map = new HashMap<Object, Object>();
//
//		count = service.idCheck(csEmailId);
//		map.put("count", count);
//
//		return map;
//	}

//	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
//	public void idCheck(HttpServletResponse response, @RequestParam("csEmailId") String csEmailId) throws IOException {
//		//@RequestParam�� ��û�� Ư�� �Ķ���� ���� ã�Ƴ� �� ����ϴ� ������̼�
//		service.idCheck(csEmailId,response);	//���񽺿� �ִ� idOverlap ȣ��.
//	}
	@ResponseBody //json���·� ��ȯ����
	@RequestMapping(value="/idCheck.do")
	public String idCheck(String csEmailId) {
		String str = null;
		int value = service.idCheck(csEmailId);
		System.out.println(value); //�׽�Ʈ�� : ��񿡼� �����ؿ°� �� ��µǳ� Ȯ��
		str = "{\"value\":\""+value+"\"}";
	return str;

}
	

	// ȸ�� ���Թ�ư ������ ���� /ȸ������ �Ϸ��ϸ� �α��� ȭ������ �ϴ� ����
	@PostMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "member_signup/loginEx.jsp";
	}

}
