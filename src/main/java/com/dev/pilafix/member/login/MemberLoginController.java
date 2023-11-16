package com.dev.pilafix.member.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService service;

	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		return "member/login";
	}
	
	@GetMapping("/register.do")
	public String register() {
		return "member/register";
	}
	
	

	
	/**
	 * �α������� �켱 �̵��� ����������(�α׾ƿ�,��й�ȣ���� �׽�Ʈ)
	 */
	@GetMapping("/memberMyinfo.do")
	public String memberMyinfo(HttpSession session, Model model) {
	    MemberLoginVO sessionMember = (MemberLoginVO) session.getAttribute("member");
	    if (sessionMember != null) {
	        String csEmailId = sessionMember.getCsEmailId();
	        MemberLoginVO memberInfo = service.getMemberByEmail(csEmailId); // �̸��� ID�� ����Ͽ� �� ���� ��ȸ
	        model.addAttribute("memberInfo", memberInfo);
	    }
	    return "member/myinfo_management";
	}
	
	
	
	
	/**
	 * �α����Ҷ� ��ȣȭ�� ��й�ȣ�� ���Ͽ� �α���
	 * member.getCsRoleCode �� "ME"�̸� ȸ���� ����������, �ƴϸ� ������ ������������ �̵�
	 * ������ ���Ͱ� ������ ���������� return "member/ctConnect"; , �ƴϸ� ����������
	 * �α��� ���н� ���� �޽���
	 */
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
	                          @RequestParam("csPassword") String csPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
	    
	    if (member != null) {
	        // �α��� ����, ���ǿ� ����� ���� ����
	        session.setAttribute("member", member);
	        
	        // ������ ���Ͱ� �ִ��� Ȯ���ϰ�, ���ҿ� ���� ������ �������� �����̷�Ʈ
	        boolean hasConnectedCenters = member.getConnectedCenterCode1() != null || 
	                                      member.getConnectedCenterCode2() != null ||
	                                      member.getConnectedCenterCode3() != null;

	        // ���Ұ� ������ ���Ϳ� ���� �����̷�Ʈ
	        if ("ME".equals(member.getCsRoleCode())) {
	            // ȸ���� ���
	            if (hasConnectedCenters) {
	                return "redirect:/memberMainPage.do"; // ���� �������� �����̷�Ʈ
	            } else {
//	                return "member/ctConnect"; // ���Ϳ���������
	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            }
	        } else {
	            // ������ ���
	            if (hasConnectedCenters) {
	                return "redirect:/trainerMainPage.do"; // ���� ���� �������� �����̷�Ʈ
	            } else {
//	                return "member/ctConnect"; // ���Ϳ���������
	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            }
	        }
	    } else {
	        // �α��� ���� �޽����� �Բ� �α��� �������� �����̷�Ʈ
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:/memberLogin.do"; 
	    }
	}

	
//	@PostMapping("/memberLogin.do")
//	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//	                          @RequestParam("csPassword") String csPassword,
//	                          HttpSession session, RedirectAttributes redirectAttrs) {
//	    
//	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
//	    
//	    if (member != null) {  	
////	        session.setAttribute("member", member);
////	        return "member/ctConnect";  
//	    } else {
//	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//	        return "redirect:memberLogin.do"; 
//	    }
//	}
	
	
	

	
	/**
	 * ��й�ȣ �����Ҷ� ���� ��й�ȣ�� DB ��й�ȣ ��
	 */	
	
	
	@GetMapping("/passwordChange.do")
	public String passwordChange() {
	    return "member/password_change"; 
	}


	@PostMapping("/verifyCurrentPassword.do")
	@ResponseBody
	public String verifyCurrentPassword(@RequestParam("currentPassword") String currentPassword,
	                                    HttpSession session) {
	    MemberLoginVO member = (MemberLoginVO) session.getAttribute("member");
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    
	    boolean passwordMatch = encoder.matches(currentPassword, member.getCsPassword());
	    return "{\"passwordMatch\": " + passwordMatch + "}";
	}

	/**
	 * ���� ��й�ȣ�� ��ġ�ϰ�
	 * �� ��й�ȣ = ��й�ȣȮ�� �� ��쿡 ��й�ȣ ����
	 */
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
	                             @RequestParam("newPassword") String newPassword,
	                             HttpSession session,
	                             RedirectAttributes redirectAttrs) {
		
		// �ֿܼ� �� ��й�ȣ Ȯ�ο� ���߿������
	    System.out.println("New Password: " + newPassword);
	    
	    MemberLoginVO member = (MemberLoginVO) session.getAttribute("member");
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    
	    if (encoder.matches(currentPassword, member.getCsPassword())) {
	        // �� ��й�ȣ ��ȣȭ
	        String encodedNewPassword = encoder.encode(newPassword);        
	        // DB�� �� ��й�ȣ ������Ʈ
	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
	        // ���ǿ��� ����� ���� ����
	        session.removeAttribute("member");
	        // ��й�ȣ ���� ���� �޽��� �α��� �������� �����̷�Ʈ
	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");	        
	        return "redirect:/memberLogin.do";
	    } else {
	        // ���� ��й�ȣ�� ��ġ���� ������ ���� �޽���
	        redirectAttrs.addFlashAttribute("passwordChangeError", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        
	        // ��й�ȣ ���� �������� �ٽ� �����̷�Ʈ
	        return "redirect:/passwordChange.do";
	    }
	}
	

	
	/**
	 * ��й�ȣ ã�� 
	 * �̸�,�̸��� �Է¹޾Ƽ�
	 * �̸��Ϸ� ������ȣ ���� ��, 
	 * �ùٸ� ������ȣ �Է½� ȸ���� ��й�ȣ ���� �������� �̵�
	 */
	
	@GetMapping("/findpassword.do")
	public String findpassword() {
		return "member/findpassword";
	}
	

	// ������ȣ �߼� ��û ó��
	@PostMapping("/sendAuthNumber.do")
    @ResponseBody
    public ResponseEntity<?> sendAuthNumber(MemberLoginVO member, HttpSession session) {
        try {
            int authNumber = service.sendAuthEmail(member);
            session.setAttribute("authNumber", authNumber);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
        	e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
        }
    }

	// ������ȣ ���� ��û ó�� �� ����� �α��� ó��
	@PostMapping("/checkAuthNumber.do")
	@ResponseBody
	public Map<String, Object> checkAuthNumber(@RequestParam("authNumber") int userEnteredAuthNumber,
	                                           @RequestParam("csEmailId") String csEmailId,
	                                           HttpSession session) {
	    Integer sessionAuthNumber = (Integer) session.getAttribute("authNumber");
	    boolean isValid = sessionAuthNumber != null && sessionAuthNumber.equals(userEnteredAuthNumber);
	    Map<String, Object> response = new HashMap<>();

	    if (isValid) {
	        MemberLoginVO member = service.getMemberByEmail(csEmailId);
	        if (member != null) {
	            session.setAttribute("member", member);
	            response.put("valid", true);
	            response.put("loginSuccess", true);
	        } else {
	            response.put("valid", true);
	            response.put("loginSuccess", false);
	            response.put("message", "User not found");
	        }
	    } else {
	        response.put("valid", false);
	        response.put("message", "Invalid auth number");
	    }
	    return response;
	}

	
	

	

	
	
	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
	    session.removeAttribute("member");
	    return "redirect:/memberLogin.do";
	}

}
