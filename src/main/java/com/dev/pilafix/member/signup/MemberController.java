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
	
	// 아이디 체크
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
//		//@RequestParam는 요청의 특정 파라미터 값을 찾아낼 때 사용하는 어노테이션
//		service.idCheck(csEmailId,response);	//서비스에 있는 idOverlap 호출.
//	}
	@ResponseBody //json형태로 변환해줌
	@RequestMapping(value="/idCheck.do")
	public String idCheck(String csEmailId) {
		String str = null;
		int value = service.idCheck(csEmailId);
		System.out.println(value); //테스트용 : 디비에서 셀렉해온거 잘 출력되나 확인
		str = "{\"value\":\""+value+"\"}";
	return str;

}
	

	// 회원 가입버튼 누르면 실행 /회원가입 완료하면 로그인 화면으로 일단 보냄
	@PostMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "member_signup/loginEx.jsp";
	}

}
