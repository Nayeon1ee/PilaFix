package com.dev.pilafix.admin.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String insertAdminLoginInfo() {
		return "admin/admin_login_register";
	}
	
	@PostMapping("/insertAdminRegister.do")
	public String insertAdminRegister(AdminVO vo) {
		System.out.println(vo.getAdId());
		service.insertAdminRegister(vo);
		return "redirect:adminLogin.do"; 
	}
		
	@PostMapping("/adIdCheck.do")
	@ResponseBody
	public int adIdCheck(@RequestParam("adId") String adId) {
		return service.adIdCheck(adId);
	}
	
}