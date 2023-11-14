package com.dev.pilafix.member.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService service;

	@GetMapping("/getMainLoginBefore.do")
    public String getMainLoginBefore() {
		return "member_login/getMainLoginBefore.jsp";
	}
	
	@GetMapping("/findpassword.do")
	public String findpassword() {
		return "member/findpassword";
	}
	
	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		return "member/login";
	}
	
	@GetMapping("/register.do")
	public String register() {
		return "member/register";
	}
	
	
	/**
	 * 로그인 테스트를 위한 페이지
	 */
	@GetMapping("/logintest.do")
	public String logintest() {
		return "member/login_test";
	}
	
	
	
	
	
	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인
	 * member.getCsRoleCode 가 "ME"이면 회원의 메인페이지, 아니면 강사의 메인페이지로 이동
	 * 로그인 실패시 실패 메시지
	 */
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
	                          @RequestParam("csPassword") String csPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
	    
	    if (member != null) {
	        session.setAttribute("member", member);
	        return "member/ctConnect";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
	        return "redirect:memberLogin.do"; 
	    }
	}
	



//	@PostMapping("/memberLogin.do")
//	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//	                          @RequestParam("csPassword") String csPassword,
//	                          HttpSession session, RedirectAttributes redirectAttrs) {
//	    
//	    MemberLoginVO member = service.memberLogin(csEmailId, csPassword);
//	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	    
//	    
//	    
//	    if (member != null && encoder.matches(csPassword, member.getCsPassword())) {
//	        // 세션에 사용자 정보 저장
//	        session.setAttribute("member", member);
//	        return "redirect:/logintest.do";  
//	    }
//	        /* 로그인후 회원,강사에 따른 페이지 이동, 테스트를위해 우선 주석처리 
//	        // 역할에 따라 다른 메인 페이지로 리다이렉트
//	        String redirectView = "ME".equals(member.getCsRoleCode()) ?
//	                              "getLoginAfterMember.do" :
//	                              "getLoginAfterTrainer.do";
//	        return "redirect:/" + redirectView;
//	    } */ //테스트를위한 주석처리 끝
//	        else {
//	        // 로그인 실패 메시지와 함께 로그인 페이지로 리다이렉트
//	        	redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
//	        return "redirect:/memberLogin.do"; 
//	    }
//
//	}
//	
	
	
	
	
	
	
	@GetMapping("/passwordChange.do")
	public String passwordChange() {
	    return "member/password_change"; 
	}

	
	/**
	 * 비밀번호 변경할때 암호화된 비밀번호와 비교하고 새 비밀번호 암호화하여 저장
	 */
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
					            @RequestParam("newPassword") String newPassword,
					            @RequestParam("confirmNewPassword") String confirmNewPassword,
					            HttpSession session,
					            RedirectAttributes redirectAttrs) {
	    
	    // 세션에서 현재 로그인한 사용자의 정보를 가져옵니다.
	    MemberLoginVO member = (MemberLoginVO) session.getAttribute("member");
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    
	    // 비밀번호가 DB에 저장된 비밀번호와 일치하는지 확인
	    if (encoder.matches(currentPassword, member.getCsPassword())) {
	        // 새비밀번호 암호화
	        String encodedNewPassword = encoder.encode(newPassword);	        
	        // DB에 새비밀번호 업데이트
	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
	        
	        // 비밀번호 변경성공
	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "비밀번호가 성공적으로 변경되었습니다.");
	        
	        //로그인 페이지로 리다이렉트
	        return "redirect:/login.do";
	    } else {
	        // 현재 비밀번호가 일치하지 않으면
	        redirectAttrs.addFlashAttribute("passwordChangeError", "현재 비밀번호가 일치하지 않습니다.");
	        
	        // 비밀번호 변경 페이지로 리다이렉트
	        return "redirect:/passwordChange.do";
	    }
	}
	
	
	
	@GetMapping("/memberJoin.do")
	public String memberJoin() {
	    return "member/register"; 
	}
	
	
	@GetMapping("/getLoginAfterMember.do")
	public String showAfterLoginMemberPage() {
	    return "member/getLoginAfterMember.jsp"; 
	}

	@GetMapping("/getLoginAfterTrainer.do")
	public String showAfterLoginTrainerPage() {
	    return "member_login/getLoginAfterTrainer.jsp";
	}
		
	
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
	    session.removeAttribute("member");
	    return "redirect:/memberLogin.do";
	}

}
