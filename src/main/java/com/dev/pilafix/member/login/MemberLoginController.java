package com.dev.pilafix.member.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService service;

	@GetMapping("/getMainLoginBefore.do")
    public String getMainLoginBefore() {
		return "member_login/getMainLoginBefore.jsp";
	}
	
	@GetMapping("/findpassword.do")
	public String findpassword() {
		return "member/findpassword";
	}
	
	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		return "member/login";
	}
	
	@GetMapping("/register.do")
	public String register() {
		return "member/register";
	}
	
	
	/**
	 * �α��� �׽�Ʈ�� ���� ������
	 */
	@GetMapping("/logintest.do")
	public String logintest() {
		return "member/login_test";
	}
	
	
	
	
	
	/**
	 * �α����Ҷ� ��ȣȭ�� ��й�ȣ�� ���Ͽ� �α���
	 * member.getCsRoleCode �� "ME"�̸� ȸ���� ����������, �ƴϸ� ������ ������������ �̵�
	 * �α��� ���н� ���� �޽���
	 */
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
	                          @RequestParam("csPassword") String csPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
	    
	    if (member != null) {
	        session.setAttribute("member", member);
	        return "member/ctConnect";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:memberLogin.do"; 
	    }
	}
	



//	@PostMapping("/memberLogin.do")
//	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//	                          @RequestParam("csPassword") String csPassword,
//	                          HttpSession session, RedirectAttributes redirectAttrs) {
//	    
//	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
//	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	    
//	    
//	    
//	    if (member != null && encoder.matches(csPassword, member.getCsPassword())) {
//	        // ���ǿ� ����� ���� ����
//	        session.setAttribute("member", member);
//	        return "redirect:/logintest.do";  
//	    }
//	        /* �α����� ȸ��,���翡 ���� ������ �̵�, �׽�Ʈ������ �켱 �ּ�ó�� 
//	        // ���ҿ� ���� �ٸ� ���� �������� �����̷�Ʈ
//	        String redirectView = "ME".equals(member.getCsRoleCode()) ?
//	                              "getLoginAfterMember.do" :
//	                              "getLoginAfterTrainer.do";
//	        return "redirect:/" + redirectView;
//	    } */ //�׽�Ʈ������ �ּ�ó�� ��
//	        else {
//	        // �α��� ���� �޽����� �Բ� �α��� �������� �����̷�Ʈ
//	        	redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//	        return "redirect:/memberLogin.do"; 
//	    }
//
//	}
//	
	
	
	
	
	
	
	@GetMapping("/passwordChange.do")
	public String passwordChange() {
	    return "member/password_change"; 
	}

	
	/**
	 * ��й�ȣ �����Ҷ� ��ȣȭ�� ��й�ȣ�� ���ϰ� �� ��й�ȣ ��ȣȭ�Ͽ� ����
	 */
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
					            @RequestParam("newPassword") String newPassword,
					            @RequestParam("confirmNewPassword") String confirmNewPassword,
					            HttpSession session,
					            RedirectAttributes redirectAttrs) {
	    
	    // ���ǿ��� ���� �α����� ������� ������ �����ɴϴ�.
	    MemberLoginVO member = (MemberLoginVO) session.getAttribute("member");
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    
	    // ��й�ȣ�� DB�� ����� ��й�ȣ�� ��ġ�ϴ��� Ȯ��
	    if (encoder.matches(currentPassword, member.getCsPassword())) {
	        // ����й�ȣ ��ȣȭ
	        String encodedNewPassword = encoder.encode(newPassword);	        
	        // DB�� ����й�ȣ ������Ʈ
	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
	        
	        // ��й�ȣ ���漺��
	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "��й�ȣ�� ���������� ����Ǿ����ϴ�.");
	        
	        //�α��� �������� �����̷�Ʈ
	        return "redirect:/login.do";
	    } else {
	        // ���� ��й�ȣ�� ��ġ���� ������
	        redirectAttrs.addFlashAttribute("passwordChangeError", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        
	        // ��й�ȣ ���� �������� �����̷�Ʈ
	        return "redirect:/passwordChange.do";
	    }
	}
	
	
	
	@GetMapping("/memberJoin.do")
	public String memberJoin() {
	    return "member/register"; 
	}
	
	
	@GetMapping("/getLoginAfterMember.do")
	public String showAfterLoginMemberPage() {
	    return "member/getLoginAfterMember.jsp"; 
	}

	@GetMapping("/getLoginAfterTrainer.do")
	public String showAfterLoginTrainerPage() {
	    return "member_login/getLoginAfterTrainer.jsp";
	}
		
	
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
	    session.removeAttribute("member");
	    return "redirect:/memberLogin.do";
	}

}
