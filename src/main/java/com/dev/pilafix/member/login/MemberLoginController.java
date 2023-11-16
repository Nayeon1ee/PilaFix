package com.dev.pilafix.member.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.MemberVO;

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
	
//	@PostMapping("/memberLogin.do")
//	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//							@RequestParam("csPassword") String csPassword,
//								HttpSession session, Model model) {
//		service.login(csEmailId, csPassword);
//		
//		
//		
//		return null;
//		
//	}

	
	/**
	 * �α������� �켱 �̵��� ����������(�α׾ƿ�,��й�ȣ���� �׽�Ʈ)
	 */
	@GetMapping("/memberMyinfo.do")
	public String memberMyinfo(HttpSession session, Model model) {
		MemberVO sessionMember = (MemberVO) session.getAttribute("member");
	    if (sessionMember != null) {
	        String csEmailId = sessionMember.getCsEmailId();
	        MemberVO memberInfo = service.getMemberByEmail(csEmailId); // �̸��� ID�� ����Ͽ� �� ���� ��ȸ
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
	                          HttpSession session, Model model) {
	    
		MemberVO member = service.memberLogin(csEmailId, csPassword);
	    
	    if (member != null) {
	        // �α��� ����, ���ǿ� ����� ���� ����
	        session.setAttribute("member", member);
	        
	        // ������ ���Ͱ� �ִ��� Ȯ���ϰ�, ���ҿ� ���� ������ �������� �����̷�Ʈ
	        boolean hasConnectedCenters = member.getConnectedCenterCode1() != 0 || 
	                                      member.getConnectedCenterCode2() != 0 ||
	                                      member.getConnectedCenterCode3() != 0;

	        // ���Ұ� ������ ���Ϳ� ���� �����̷�Ʈ
	        if ("ME".equals(member.getCsRoleCode())) {
	            // ȸ���� ���
	            if (hasConnectedCenters) {
	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            } else {
//	                return "member/ctConnect"; // ���Ϳ���������
	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            }
	        } else {
	            // ������ ���
	            if (hasConnectedCenters) {
	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            } else {
	                return "member/ctConnect"; // ���Ϳ���������
//	            	System.out.println("�α��μ���");
//	            	return "redirect:/memberMyinfo.do"; //��й�ȣ����, �α׾ƿ��׽�Ʈ������
	            }
	        }
	    } else {
	        // �α��� ���� �޽����� �Բ� �α��� �������� �����̷�Ʈ
	        model.addAttribute("message" ,"�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:memberLogin.do"; 
	    }
	}

	
//	@PostMapping("/memberLogin.do")
//	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//	                          @RequestParam("csPassword") String csPassword,
//	                          HttpSession session, RedirectAttributes redirectAttrs) {
//	    
//	    MemberVO member = service.memberLogin(csEmailId, csPassword);
//	    
//	    if (member != null) {  	
////	        session.setAttribute("member", member);
////	        return "member/ctConnect";  
//	    } else {
//	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//			return "member/login";
//	    }
//	}
	
	
	

	
	/**
	 * ��й�ȣ �����Ҷ� ���� ��й�ȣ�� DB ��й�ȣ ��
	 */	
	
	
	@GetMapping("/passwordChange.do")
	public String passwordChange() {
	    return "member/password_change"; 
	}


//	@PostMapping("/verifyCurrentPassword.do")
//	@ResponseBody
//	public String verifyCurrentPassword(@RequestParam("currentPassword") String currentPassword,
//	                                    HttpSession session) {
//		MemberVO member = (MemberVO) session.getAttribute("member");
//	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	    
////	    boolean passwordMatch = encoder.matches(currentPassword, member.getCsPassword());
//	    boolean passwordMatch = BCrypt.checkpw(currentPassword, member.getCsPassword());
//	    return "{\"passwordMatch\": " + passwordMatch + "}";
//	}

	/**
	 * ���� ��й�ȣ�� ��ġ�ϰ�
	 * �� ��й�ȣ = ��й�ȣȮ�� �� ��쿡 ��й�ȣ ����
	 */
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
	                             @RequestParam("newPassword") String newPassword,
	                             HttpSession session,Model model) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// �ֿܼ� �� ��й�ȣ Ȯ�ο� ���߿������
		System.out.println("����ڿ��� �Է¹��� ���� ��й�ȣ : "+currentPassword);
		System.out.println("���� DB�� �ִ� ���� ��й�ȣ : "+member.getCsPassword());
		System.out.println("�Է¹��� ��й�ȣ ��ȣȭ     : "+encoder.encode(currentPassword));

		System.out.println("���� ���� :  "+(member.getCsPassword().equals(encoder.encode(currentPassword))));
		
		
		System.out.println("����� ��й�ȣ : "+newPassword);
	    
		System.out.println("����� ��й�ȣ ��ȣȭ : "+encoder.encode(newPassword));
	    
//	    if (encoder.matches(currentPassword, member.getCsPassword())) {
	    if (BCrypt.checkpw(currentPassword, member.getCsPassword())) {	
	        // �� ��й�ȣ ��ȣȭ
	        String encodedNewPassword = encoder.encode(newPassword);        
	        // DB�� �� ��й�ȣ ������Ʈ
	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
	        // ���ǿ��� ����� ���� ����
	        session.removeAttribute("member");
	        // ��й�ȣ ���� ���� �޽��� �α��� �������� �����̷�Ʈ
	        model.addAttribute("message","��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");
//	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");	        
	        return "redirect:/memberLogin.do";
	    } else {
	        // ���� ��й�ȣ�� ��ġ���� ������ ���� �޽���
	        model.addAttribute("message","���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");

//	        redirectAttrs.addFlashAttribute("passwordChangeError", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        
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
    public ResponseEntity<?> sendAuthNumber(MemberVO member, HttpSession session) {
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
	    	MemberVO member = service.getMemberByEmail(csEmailId);
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
