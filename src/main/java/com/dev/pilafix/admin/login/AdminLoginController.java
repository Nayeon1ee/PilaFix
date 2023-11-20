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
	 * 로그인 테스트
	 * @return
	 */
	@GetMapping("/adminLogin.do")
	public String admin_login() {
		return "admin/admin_login";
	}
	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인
	 * member.getCsRoleCode 가 "admin"이면 회원의 메인페이지, 아니면 강사의 메인페이지로 이동
	 * 로그인 실패시 실패 메시지
	 */
	@PostMapping("/adminLogin.do")
	public String adminLogin(@RequestParam("adId") String adId,
	                          @RequestParam("adPassword") String adPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
		AdminVO admin = service.adminLogin(adId, adPassword);
		
	    if (admin != null) {
	        // 원래는 index 상에 관리자화면으로 넘어가는 link가 필요함. 일단 등록화면부터 구현하기위해 넣어둠
	        Map<String, Object> loginAdmin = new HashMap<>();
	        loginAdmin.put("adCode", admin.getAdCode());
	        loginAdmin.put("adName", admin.getAdName());
	        
	        // 세션에 Map 저장 
	        session.setAttribute("loginAdmin", loginAdmin);
	        
	        return "admin/admin_login_register";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
	        
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
