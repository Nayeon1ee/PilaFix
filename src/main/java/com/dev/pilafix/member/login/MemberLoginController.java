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
	
	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		return "member_login/memberLogin.jsp";
	}
	@GetMapping("/getLoginAfterMember.do")
	public String showAfterLoginMemberPage() {
	    return "member_login/getLoginAfterMember.jsp"; 
	}

	@GetMapping("/getLoginAfterTrainer.do")
	public String showAfterLoginTrainerPage() {
	    return "member_login/getLoginAfterTrainer.jsp";
	}
		
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam("csEmailId") String email,
	                          @RequestParam("csPassword") String password,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    MemberLoginVO member = service.memberLogin(email, password);
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    if (member != null && encoder.matches(password, member.getCsPassword())) {
	        // ���ǿ� ����� ���� ����
	        session.setAttribute("member", member);

	        // ���ҿ� ���� �ٸ� ���� �������� �����̷�Ʈ
	        String redirectView = "ME".equals(member.getCsRoleCode()) ?
	                              "getLoginAfterMember.do" :
	                              "getLoginAfterTrainer.do";
	        return "redirect:/" + redirectView;
	    } else {
	        // �α��� ���� �޽����� �Բ� �α��� �������� �����̷�Ʈ
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:/memberLogin.do"; 
	    }
	}


	


	
}
