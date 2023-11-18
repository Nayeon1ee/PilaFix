package com.dev.pilafix.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.common.member.AdminVO;
import com.dev.pilafix.common.member.MemberVO;


@Controller
public class AdminLoginController {
	@Autowired
	private AdminLoginService service;
	
	/**
	 * �α��� �׽�Ʈ
	 * @return
	 */
	@GetMapping("/adminLogin.do")
	public String admin_login() {
		return "admin/admin_login";
	}
	/**
	 * �α����Ҷ� ��ȣȭ�� ��й�ȣ�� ���Ͽ� �α���
	 * member.getCsRoleCode �� "admin"�̸� ȸ���� ����������, �ƴϸ� ������ ������������ �̵�
	 * �α��� ���н� ���� �޽���
	 */
	@PostMapping("/adminLogin.do")
	public String adminLogin(@RequestParam("adId") String adId,
	                          @RequestParam("adPassword") String adPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
		AdminVO admin = service.adminLogin(adId, adPassword);
		
	    if (admin != null) {
	        session.setAttribute("admin", admin);
	        // ������ index �� ������ȭ������ �Ѿ�� link�� �ʿ���. �ϴ� ���ȭ����� �����ϱ����� �־��
	        
	        return "admin/admin_login_register";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        
	        return "redirect:adminLogin.do"; 
	    }
	}
	
	@GetMapping("/insertAdminLoginInfo.do")
	public String insertAdminLoginInfo(AdminVO vo) {
		return "admin/admin_login_register";
	}
	
	@PostMapping("/insertAdminRegister.do")
	public String insertAdminRegister(AdminVO vo) {
		service.insertAdminRegister(vo);
		return "redirect:adminLogin.do"; 
	}
	
	@PostMapping("/adIdCheck.do")
	@ResponseBody
	public int adIdCheck(@RequestParam("adId") String adId) {
		return service.adIdCheck(adId);
	}
	
	
//	@GetMapping("/passwordChange.do")
//	public String passwordChange() {
//	    return "member/password_change"; 
//	}


//	@PostMapping("/verifyCurrentLoginPassword.do")
//	@ResponseBody
//	public String verifyCurrentLoginPassword(@RequestParam("currentPassword") String currentPassword,
//	                                    HttpSession session) {
//		AdminVO admin = (AdminVO) session.getAttribute("admin");
//	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	    
//	    boolean passwordMatch = encoder.matches(currentPassword, admin.getAdPassword());
//	    return "{\"passwordMatch\": " + passwordMatch + "}";
//	}

//	/**
//	 * ���� ��й�ȣ�� ��ġ�ϰ�
//	 * �� ��й�ȣ = ��й�ȣȮ�� �� ��쿡 ��й�ȣ ����
//	 */
//	@PostMapping("/adminupdatePassword.do")
//	public String adminupdatePassword(@RequestParam("currentPassword") String currentPassword,
//	                             @RequestParam("newPassword") String newPassword,
//	                             HttpSession session,Model model) {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//
//		AdminVO admin = (AdminVO) session.getAttribute("admin");
//		
//		// �ֿܼ� �� ��й�ȣ Ȯ�ο� ���߿������
//		System.out.println("����ڿ��� �Է¹��� ���� ��й�ȣ : "+currentPassword);
//		System.out.println("���� DB�� �ִ� ���� ��й�ȣ : "+admin.getAdPassword());
//		System.out.println("�Է¹��� ��й�ȣ ��ȣȭ     : "+encoder.encode(currentPassword));
//
//		System.out.println("���� ���� :  "+(admin.getAdPassword().equals(encoder.encode(currentPassword))));
//		
//		
//		System.out.println("����� ��й�ȣ : "+newPassword);
//	    
//		System.out.println("����� ��й�ȣ ��ȣȭ : "+encoder.encode(newPassword));
//	    
//	    if (encoder.matches(currentPassword, admin.getAdPassword())) {
//	        // �� ��й�ȣ ��ȣȭ
//	        String encodedNewPassword = encoder.encode(newPassword);        
//	        // DB�� �� ��й�ȣ ������Ʈ
//	        service.adminupdatePassword(admin.getAdCode(), encodedNewPassword);
//	        // ���ǿ��� ����� ���� ����
//	        session.removeAttribute("admin");
//	        // ��й�ȣ ���� ���� �޽��� �α��� �������� �����̷�Ʈ
//	        model.addAttribute("message","��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");
////	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");	        
//	        return "redirect:/adminLogin.do";
//	    } else {
//	        // ���� ��й�ȣ�� ��ġ���� ������ ���� �޽���
//	        model.addAttribute("message","���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//
////	        redirectAttrs.addFlashAttribute("passwordChangeError", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//	        
//	        // ��й�ȣ ���� �������� �ٽ� �����̷�Ʈ
//	        return "redirect:/passwordChange.do";
//	    }
//	}
	
}
