package com.dev.pilafix.member.signup;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.admin.center_manage.CenterVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@GetMapping("/selectMeOrTr.do")
	public String selectForm() {
		return "member_signup/selectMeOrTr.jsp";
	}
	
	/**
	 * 회원 가입 전 회원 or 강사선택
	 * @param csRoleCode
	 * @return
	 */
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
	
	/** 
	 * 아이디 중복 체크
	 * @param csEmailId
	 * @return
	 */
//	@ResponseBody //json형태로 변환해줌
//	@RequestMapping(value="/idCheck.do")
//	public String idCheck(String csEmailId) {
//		String str = null;
//		int value = service.idCheck(csEmailId);
//		System.out.println(value); //테스트용 : 디비에서 셀렉해온거 잘 출력되나 확인
//		str = "{\"value\":\""+value+"\"}";
//	return str;
//
//}
	@RequestMapping(value="/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("csEmailId") String csEmailId){
		String result ="N";
		
		int flag = service.idCheck(csEmailId);
		
		if(flag == 1) result="Y";
		//아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
		return result;
		
	}
	
/**
 * 회원 가입
 * 회원 가입버튼 누르면 실행 /회원가입 완료하면 로그인 화면으로 일단 보냄
 * @param vo
 * @return
*/
@PostMapping("/insertMember.do")
public String insertMember(MemberVO vo) {
	// 가입시 입력한 비밀번호를 읽어와서
	String csPassword = vo.getCsPassword();
	
	// 암호화 한 후에
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPwd = encoder.encode(csPassword);
	// vo에 다시 넣어준다.
	vo.setCsPassword(encodedPwd);
	// 암호화된 비밀번호가 들어 있는 vo를 dao에 전달해서 새로운 회원 정보를 추가한다.
	service.insertMember(vo);
	return "member_signup/loginEx.jsp";
}

//이메일 전송
@GetMapping("/mailCheck.do")
@ResponseBody
public void mailCheck(String csEmailId,HttpSession session) {
  //  service.sendEmailAndInsertSendEmailHistory(csEmailId);
	System.out.println("이메일 인증요청 들어옴");
	System.out.println("요청 보낼 이메일 :" + csEmailId);
	service.mailCheckAndInsertSendEmailHistory(csEmailId, session);
}




}
