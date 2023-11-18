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
	        session.setAttribute("admin", admin);
	        // 원래는 index 상에 관리자화면으로 넘어가는 link가 필요함. 일단 등록화면부터 구현하기위해 넣어둠
	        
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
//	 * 현재 비밀번호가 일치하고
//	 * 새 비밀번호 = 비밀번호확인 일 경우에 비밀번호 변경
//	 */
//	@PostMapping("/adminupdatePassword.do")
//	public String adminupdatePassword(@RequestParam("currentPassword") String currentPassword,
//	                             @RequestParam("newPassword") String newPassword,
//	                             HttpSession session,Model model) {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//
//		AdminVO admin = (AdminVO) session.getAttribute("admin");
//		
//		// 콘솔에 새 비밀번호 확인용 나중에지울것
//		System.out.println("사용자에게 입력받은 현재 비밀번호 : "+currentPassword);
//		System.out.println("실제 DB에 있는 현재 비밀번호 : "+admin.getAdPassword());
//		System.out.println("입력받은 비밀번호 암호화     : "+encoder.encode(currentPassword));
//
//		System.out.println("동일 여부 :  "+(admin.getAdPassword().equals(encoder.encode(currentPassword))));
//		
//		
//		System.out.println("변경된 비밀번호 : "+newPassword);
//	    
//		System.out.println("변경된 비밀번호 암호화 : "+encoder.encode(newPassword));
//	    
//	    if (encoder.matches(currentPassword, admin.getAdPassword())) {
//	        // 새 비밀번호 암호화
//	        String encodedNewPassword = encoder.encode(newPassword);        
//	        // DB에 새 비밀번호 업데이트
//	        service.adminupdatePassword(admin.getAdCode(), encodedNewPassword);
//	        // 세션에서 사용자 정보 제거
//	        session.removeAttribute("admin");
//	        // 비밀번호 변경 성공 메시지 로그인 페이지로 리다이렉트
//	        model.addAttribute("message","비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
////	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");	        
//	        return "redirect:/adminLogin.do";
//	    } else {
//	        // 현재 비밀번호가 일치하지 않으면 에러 메시지
//	        model.addAttribute("message","현재 비밀번호가 일치하지 않습니다.");
//
////	        redirectAttrs.addFlashAttribute("passwordChangeError", "현재 비밀번호가 일치하지 않습니다.");
//	        
//	        // 비밀번호 변경 페이지로 다시 리다이렉트
//	        return "redirect:/passwordChange.do";
//	    }
//	}
	
}
