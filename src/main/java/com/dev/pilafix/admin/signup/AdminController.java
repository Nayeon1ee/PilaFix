package com.dev.pilafix.admin.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.AdminVO;


@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	
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
	 * 비밀번호 변경
	 * @param adId
	 * @return
	 */
	
	@PostMapping("/adPasswordCheck.do")
	@ResponseBody
	public int adPasswordCheck(@RequestParam("adPassword") String adPassword) {
		return service.adPasswordCheck(adPassword);
	}
	
	/**
	 * 비밀번호 변경 및 확인
	 * @return
	 */
	@GetMapping("/adminpasswordChange.do")
	public String passwordChange() {
	    return "admin/password_change"; 
	}

	/**
	 * 현재 비밀번호가 일치하고
	 * 새 비밀번호 = 비밀번호확인 일 경우에 비밀번호 변경
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
	        // 현재 비밀번호가 일치하면 비밀번호 변경 페이지로 이동
	        return "redirect:/adminupdatePassword.do";
	    } else {
	        model.addAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
	        return "admin/passwordcheck";
	    }
	}
	@PostMapping("/adminUpdatePassword.do")
	public String adminUpdatePassword(HttpServletRequest request, HttpSession session, Model model) {
	    String newPassword = request.getParameter("newPassword");
	    String confirmPassword = request.getParameter("confirmPassword");

	    if (!newPassword.equals(confirmPassword)) {
		    	model.addAttribute("message", "새 비밀번호가 일치하지 않습니다.");
		        return "admin/passwordchangeform";
	    }

	    AdminVO currentMember = (AdminVO) session.getAttribute("admin");
	    service.adminupdatePassword(currentMember.getAdCode(), newPassword);
	    session.removeAttribute("admin");
	    model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해 주세요.");
	    return "redirect:/memberLogin.do";
	}
	
}