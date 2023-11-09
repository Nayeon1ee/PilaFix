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
	 * ȸ�� ���� �� ȸ�� or ���缱��
	 * @param csRoleCode
	 * @return
	 */
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
	
	/** 
	 * ���̵� �ߺ� üũ
	 * @param csEmailId
	 * @return
	 */
//	@ResponseBody //json���·� ��ȯ����
//	@RequestMapping(value="/idCheck.do")
//	public String idCheck(String csEmailId) {
//		String str = null;
//		int value = service.idCheck(csEmailId);
//		System.out.println(value); //�׽�Ʈ�� : ��񿡼� �����ؿ°� �� ��µǳ� Ȯ��
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
		//���̵� ������ Y ������ N ����jsp view �� ����
		return result;
		
	}
	
/**
 * ȸ�� ����
 * ȸ�� ���Թ�ư ������ ���� /ȸ������ �Ϸ��ϸ� �α��� ȭ������ �ϴ� ����
 * @param vo
 * @return
*/
@PostMapping("/insertMember.do")
public String insertMember(MemberVO vo) {
	// ���Խ� �Է��� ��й�ȣ�� �о�ͼ�
	String csPassword = vo.getCsPassword();
	
	// ��ȣȭ �� �Ŀ�
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPwd = encoder.encode(csPassword);
	// vo�� �ٽ� �־��ش�.
	vo.setCsPassword(encodedPwd);
	// ��ȣȭ�� ��й�ȣ�� ��� �ִ� vo�� dao�� �����ؼ� ���ο� ȸ�� ������ �߰��Ѵ�.
	service.insertMember(vo);
	return "member_signup/loginEx.jsp";
}

//�̸��� ����
@GetMapping("/mailCheck.do")
@ResponseBody
public void mailCheck(String csEmailId,HttpSession session) {
  //  service.sendEmailAndInsertSendEmailHistory(csEmailId);
	System.out.println("�̸��� ������û ����");
	System.out.println("��û ���� �̸��� :" + csEmailId);
	service.mailCheckAndInsertSendEmailHistory(csEmailId, session);
}




}
