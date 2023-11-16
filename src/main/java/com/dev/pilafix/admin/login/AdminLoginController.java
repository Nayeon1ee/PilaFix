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
	 * 로그인 테스트
	 * @return
	 */
	@GetMapping("/adminLogin.do")
	public String admin_login() {
		return "admin/admin_login";
	}
	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인
	 * member.getCsRoleCode 가 "ME"이면 회원의 메인페이지, 아니면 강사의 메인페이지로 이동
	 * 로그인 실패시 실패 메시지
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
	        redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
	        return "redirect:adminLogin.do"; 
	    }
	}
}
