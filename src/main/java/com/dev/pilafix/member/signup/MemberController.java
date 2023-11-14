package com.dev.pilafix.member.signup;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	/**
	 * ȸ�� ���� �� ȸ�� or ���缱��
	 * @param csRoleCode
	 * @return
	 */
	// selectMeOrTr.jsp���� �Ѿ�� ��(csRoleCode)�޾Ƽ� ȸ�� ���� ���� �Ķ���ͷ� �Ѱ���
	@GetMapping("/getUserRole.do")
	public String getUserRole(@RequestParam("csRoleCode") String csRoleCode,Model model ) {
		//�׽�Ʈ�� System.out.println(csRoleCode);
		String code = "";
		if (csRoleCode.equals("ME")) {
			code = "ME";
		} else if (csRoleCode.equals("TR")) {
			code = "TR";
		}
		
		List<TermsVO> terms = service.getTermsList();
	
		model.addAttribute("termsList",terms);
		
		
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
	@PostMapping(value="/idCheck.do")
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
	service.insertMember(vo);
	return "member_signup/loginEx.jsp";
}

//�̸��� ����
@GetMapping("/mailCheck.do")
@ResponseBody
public String mailCheck(String csEmailId,HttpSession session) {
	System.out.println("�̸��� ������û ����");
	System.out.println("��û ���� �̸��� :" + csEmailId);
//	int authNumber = service.mailCheckAndInsertSendEmailHistory(csEmailId );
	
	session.setAttribute("authNumber",service.mailCheckAndInsertSendEmailHistory(csEmailId) );
	session.setMaxInactiveInterval(60);
	String authNumber = String.valueOf(session.getAttribute("authNumber"));
    System.out.println("��Ʈ�ѷ����� ���ǿ� ����� �� ��� : " + authNumber);
    return authNumber;
}

//@GetMapping("/mailCheck.do")
//@ResponseBody
//public String mailCheck(String csEmailId,HttpSession session) {
//	System.out.println("�̸��� ������û ����");
//	System.out.println("��û ���� �̸��� :" + csEmailId);
//	session.setAttribute("authNumber",service.mailCheckAndInsertSendEmailHistory(csEmailId) );
//	session.setMaxInactiveInterval(60);
//	 // ���ǿ� ����� authNumber�� ���� �����ͷ� ��ȯ
//    String authNumber = String.valueOf(session.getAttribute("authNumber"));
//    System.out.println("���ǿ� ����� �� : " + authNumber);
//    return authNumber; // �������� �ʿ� ���� �̰� �ٲ���� 11/09
//}



}
