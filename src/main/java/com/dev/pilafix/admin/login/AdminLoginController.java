package com.dev.pilafix.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
	 * member.getCsRoleCode �� "ME"�̸� ȸ���� ����������, �ƴϸ� ������ ������������ �̵�
	 * �α��� ���н� ���� �޽���
	 */
	
	@PostMapping("/adminLogin.do")
	public String adminLogin(@RequestParam("adId") String adId,
	                          @RequestParam("adPassword") String adPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    AdminLoginVO adminInfo = service.adminLogin(adId, adPassword);
	    
	    if (adminInfo != null) {
	        session.setAttribute("adminInfo", adminInfo);
	        return "admin/admin_mypage";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:adminLogin.do"; 
	    }
	}
}
