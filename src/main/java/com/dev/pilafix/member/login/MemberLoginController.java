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
	 * 로그인이후 우선 이동할 마이페이지(로그아웃,비밀번호변경 테스트)
	 */
	@GetMapping("/memberMyinfo.do")
	public String memberMyinfo(HttpSession session, Model model) {
		MemberVO sessionMember = (MemberVO) session.getAttribute("member");
	    if (sessionMember != null) {
	        String csEmailId = sessionMember.getCsEmailId();
	        MemberVO memberInfo = service.getMemberByEmail(csEmailId); // 이메일 ID를 사용하여 상세 정보 조회
	        model.addAttribute("memberInfo", memberInfo);
	    }
	    return "member/myinfo_management";
	}
	
	
	
	
	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인
	 * member.getCsRoleCode 가 "ME"이면 회원의 메인페이지, 아니면 강사의 메인페이지로 이동
	 * 연동된 센터가 있으면 연동페이지 return "member/ctConnect"; , 아니면 메인페이지
	 * 로그인 실패시 실패 메시지
	 */
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam("csEmailId") String csEmailId,
	                          @RequestParam("csPassword") String csPassword,
	                          HttpSession session, Model model) {
	    
		MemberVO member = service.memberLogin(csEmailId, csPassword);
	    
	    if (member != null) {
	        // 로그인 성공, 세션에 사용자 정보 저장
	        session.setAttribute("member", member);
	        
	        // 연동된 센터가 있는지 확인하고, 역할에 따라 적절한 페이지로 리다이렉트
	        boolean hasConnectedCenters = member.getConnectedCenterCode1() != 0 || 
	                                      member.getConnectedCenterCode2() != 0 ||
	                                      member.getConnectedCenterCode3() != 0;

	        // 역할과 연동된 센터에 따라 리다이렉트
	        if ("ME".equals(member.getCsRoleCode())) {
	            // 회원인 경우
	            if (hasConnectedCenters) {
	            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
	            } else {
//	                return "member/ctConnect"; // 센터연동페이지
	            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
	            }
	        } else {
	            // 강사인 경우
	            if (hasConnectedCenters) {
	            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
	            } else {
	                return "member/ctConnect"; // 센터연동페이지
//	            	System.out.println("로그인성공");
//	            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
	            }
	        }
	    } else {
	        // 로그인 실패 메시지와 함께 로그인 페이지로 리다이렉트
	        model.addAttribute("message" ,"존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
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
//	        redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
//			return "member/login";
//	    }
//	}
	
	
	

	
	/**
	 * 비밀번호 변경할때 현재 비밀번호와 DB 비밀번호 비교
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
	 * 현재 비밀번호가 일치하고
	 * 새 비밀번호 = 비밀번호확인 일 경우에 비밀번호 변경
	 */
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
	                             @RequestParam("newPassword") String newPassword,
	                             HttpSession session,Model model) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 콘솔에 새 비밀번호 확인용 나중에지울것
		System.out.println("사용자에게 입력받은 현재 비밀번호 : "+currentPassword);
		System.out.println("실제 DB에 있는 현재 비밀번호 : "+member.getCsPassword());
		System.out.println("입력받은 비밀번호 암호화     : "+encoder.encode(currentPassword));

		System.out.println("동일 여부 :  "+(member.getCsPassword().equals(encoder.encode(currentPassword))));
		
		
		System.out.println("변경된 비밀번호 : "+newPassword);
	    
		System.out.println("변경된 비밀번호 암호화 : "+encoder.encode(newPassword));
	    
//	    if (encoder.matches(currentPassword, member.getCsPassword())) {
	    if (BCrypt.checkpw(currentPassword, member.getCsPassword())) {	
	        // 새 비밀번호 암호화
	        String encodedNewPassword = encoder.encode(newPassword);        
	        // DB에 새 비밀번호 업데이트
	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
	        // 세션에서 사용자 정보 제거
	        session.removeAttribute("member");
	        // 비밀번호 변경 성공 메시지 로그인 페이지로 리다이렉트
	        model.addAttribute("message","비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
//	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");	        
	        return "redirect:/memberLogin.do";
	    } else {
	        // 현재 비밀번호가 일치하지 않으면 에러 메시지
	        model.addAttribute("message","현재 비밀번호가 일치하지 않습니다.");

//	        redirectAttrs.addFlashAttribute("passwordChangeError", "현재 비밀번호가 일치하지 않습니다.");
	        
	        // 비밀번호 변경 페이지로 다시 리다이렉트
	        return "redirect:/passwordChange.do";
	    }
	}
	

	
	/**
	 * 비밀번호 찾기 
	 * 이름,이메일 입력받아서
	 * 이메일로 인증번호 전송 후, 
	 * 올바른 인증번호 입력시 회원의 비밀번호 변경 페이지로 이동
	 */
	
	@GetMapping("/findpassword.do")
	public String findpassword() {
		return "member/findpassword";
	}
	

	// 인증번호 발송 요청 처리
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

	// 인증번호 검증 요청 처리 및 사용자 로그인 처리
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
