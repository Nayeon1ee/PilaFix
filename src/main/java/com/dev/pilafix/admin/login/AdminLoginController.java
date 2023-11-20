package com.dev.pilafix.admin.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.common.member.AdminVO;
import com.dev.pilafix.common.member.CenterVO;
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
	        // ������ index �� ������ȭ������ �Ѿ�� link�� �ʿ���. �ϴ� ���ȭ����� �����ϱ����� �־��
	        Map<String, Object> loginAdmin = new HashMap<>();
	        loginAdmin.put("adCode", admin.getAdCode());
	        loginAdmin.put("adName", admin.getAdName());
	        
	        // ���ǿ� Map ���� 
	        session.setAttribute("loginAdmin", loginAdmin);
	        
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
	/**
	 * ��й�ȣ ����
	 * @param adId
	 * @return
	 */
	
	@PostMapping("/adPasswordCheck.do")
	@ResponseBody
	public int adPasswordCheck(@RequestParam("adPassword") String adPassword) {
		return service.adPasswordCheck(adPassword);
	}
	
	/**
	 * ��й�ȣ ���� �� Ȯ��
	 * @return
	 */
	@GetMapping("/adminpasswordChange.do")
	public String passwordChange() {
	    return "admin/password_change"; 
	}

	/**
	 * ���� ��й�ȣ�� ��ġ�ϰ�
	 * �� ��й�ȣ = ��й�ȣȮ�� �� ��쿡 ��й�ȣ ����
	 */
	@GetMapping("/adminCheckCurrentPassword.do")
	public String getadminCheckCurrentPassword() {
		return "admin/passwordcheck";
	}
	@GetMapping("/adminUpdatePassword.do")
	public String getadminUpdatePassword() {
		return "admin/passwordchangeform";
	}
	
	@PostMapping("/adminCheckCurrentPassword.do")
	public String adminCheckCurrentPassword(@RequestParam("currentPassword") String currentPassword, HttpSession session, Model model) {
	    AdminVO currentMember = (AdminVO) session.getAttribute("admin");

	    if (service.admincheckPassword(currentMember.getAdCode(), currentPassword)) {
	        // ���� ��й�ȣ�� ��ġ�ϸ� ��й�ȣ ���� �������� �̵�
	        return "redirect:/adminupdatePassword.do";
	    } else {
	        model.addAttribute("message", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "admin/passwordcheck";
	    }
	}
	@PostMapping("/adminUpdatePassword.do")
	public String adminUpdatePassword(HttpServletRequest request, HttpSession session, Model model) {
	    String newPassword = request.getParameter("newPassword");
	    String confirmPassword = request.getParameter("confirmPassword");

	    if (!newPassword.equals(confirmPassword)) {
		    	model.addAttribute("message", "�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		        return "admin/passwordchangeform";
	    }

	    AdminVO currentMember = (AdminVO) session.getAttribute("admin");
	    service.adminupdatePassword(currentMember.getAdCode(), newPassword);
	    session.removeAttribute("admin");
	    model.addAttribute("message", "��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α����� �ּ���.");
	    return "redirect:/memberLogin.do";
	}
	
	
	
}
