package com.dev.pilafix.member.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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


	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인 member.getCsRoleCode 가 "ME"이면 회원의 메인페이지, 아니면 강사의
	 * 메인페이지로 이동 연동된 센터가 있으면 연동페이지 return "member/ctConnect"; , 아니면 메인페이지 로그인 실패시 실패
	 * 메시지
	 */
	@PostMapping("/memberLogin.do")
	public String memberLogin(@ModelAttribute MemberVO memberVO, HttpSession session, Model model) {
		MemberVO member = service.loginAndGetMember(memberVO.getCsEmailId(), memberVO.getCsPassword());
		if (member != null) {
			// 로그인 성공, 세션에 사용자 정보 저장
			System.out.println("로그인성공: " + memberVO.getCsEmailId());

			// 세션에 담을 Map 생성
			Map<String, Object> loginUser = new HashMap<>();
			loginUser.put("csMemberCode", member.getCsMemberCode());
			loginUser.put("csName", member.getCsName());
			loginUser.put("csRoleCode", member.getCsRoleCode());
			loginUser.put("csEmailId", member.getCsEmailId());
			String userPhone = member.getCsPhoneNumber1() + member.getCsPhoneNumber2() + member.getCsPhoneNumber3();
			loginUser.put("csPhoneNumber", userPhone);

			// 세션에 Map 저장
			session.setAttribute("loginUser", loginUser);

			// 연동된 센터가 있는지 확인
			boolean hasConnectedCenters = member.getConnectedCenterCode1() != 0 || member.getConnectedCenterCode2() != 0
					|| member.getConnectedCenterCode3() != 0;
			// 역할에 따라 적절한 페이지로 리다이렉트
			if ("ME".equals(member.getCsRoleCode())) {
				// 회원인 경우
				if (hasConnectedCenters) {
					return "redirect:/memberMyinfo.do"; // 비밀번호 변경, 로그아웃 테스트 페이지
				} else {
					return "redirect:/memberMyinfo.do"; // 센터 연동 페이지
				}
			} else {
				// 강사인 경우
				if (hasConnectedCenters) {
					return "redirect:/memberMyinfo.do"; // 비밀번호 변경, 로그아웃 테스트 페이지
				} else {
					return "member/ctConnect"; // 센터 연동 페이지
				}
			}
		} else {
			// 로그인 실패 메시지와 함께 로그인 페이지로 이동
			model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "member/login";
		}
	}


	/**
	 * 로그인이후 우선 이동할 마이페이지(로그아웃,비밀번호변경 테스트)
	 */
	@GetMapping("/memberMyinfo.do")
	public String memberMyinfo(HttpSession session, Model model) {
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
	    if (loginUser != null) {
	        String csEmailId = (String) loginUser.get("csEmailId");
	        MemberVO memberInfo = service.getMemberByEmail(csEmailId);
	        model.addAttribute("memberInfo", memberInfo);
	    }
	    return "member/myinfo_management";
	}


	/**
	 * 현재 비밀번호가 일치하고 새 비밀번호 = 비밀번호확인 일 경우에 비밀번호 변경
	 */
	@GetMapping("/checkCurrentPassword.do")
	public String getcheckCurrentPassword() {
		return "member/passwordcheck";
	}

	@GetMapping("/updatePassword.do")
	public String getupdatePassword() {
		return "member/passwordchangeform";
	}

	/**
	 * 비밀번호 변경 모달에서 현재 비밀번호 확인
	 * 
	 * @param payload
	 * @param session
	 * @return
	 */
	@PostMapping("/checkPassword.do")
	@ResponseBody
	public ResponseEntity<?> checkCurrentPassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String currentPassword = payload.get("currentPassword");
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");

		if (loginUser != null) {
			int csMemberCode = (int) loginUser.get("csMemberCode");
			boolean isPasswordCorrect = service.checkPassword(csMemberCode, currentPassword);

			if (isPasswordCorrect) {
				return ResponseEntity.ok().body(Map.of("message", "Password is correct"));
			} else {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Incorrect password"));
			}
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("error", "User not logged in"));
		}
	}

	/**
	 * 비밀번호 변경 모달에서 새 비밀번호,새비밀번호 확인 후 변경
	 * @param payload
	 * @param session
	 * @return
	 */
	@PostMapping("/updatePassword.do")
	@ResponseBody
	public ResponseEntity<?> updatePassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String newPassword = payload.get("newPassword");
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");

		if (loginUser != null) {
			int csMemberCode = (int) loginUser.get("csMemberCode");
			service.updatePassword(csMemberCode, newPassword);
			return ResponseEntity.ok().body(Map.of("message", "Password updated successfully"));
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("error", "User not logged in"));
		}
	}	

	/**
	 * 비밀번호 찾기
	 * 이름,이메일 입력받아서 이메일로 인증번호 전송 후, 
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
		public Map<String, Object> checkAuthNumber(HttpServletRequest request, HttpSession session) {
			int authNumber = Integer.parseInt(request.getParameter("authNumber"));
			String csEmailId = request.getParameter("csEmailId");

			Integer sessionAuthNumber = (Integer) session.getAttribute("authNumber");
			boolean isValid = sessionAuthNumber != null && sessionAuthNumber.equals(authNumber);
			Map<String, Object> response = new HashMap<>();

		    if (isValid) {
		        MemberVO member = service.getMemberByEmail(csEmailId);
		        if (member != null) {
		            // Map에 사용자 정보 저장
					Map<String, Object> loginUser = new HashMap<>();
					loginUser.put("csMemberCode", member.getCsMemberCode());
					loginUser.put("csName", member.getCsName());
					loginUser.put("csRoleCode", member.getCsRoleCode());
					loginUser.put("csEmailId", member.getCsEmailId());
					String userPhone = member.getCsPhoneNumber1() + member.getCsPhoneNumber2() + member.getCsPhoneNumber3();
					loginUser.put("csPhoneNumber", userPhone);		
					
					session.setAttribute("loginUser", loginUser);
					
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
		
	
	// 11.23로그인 시키는 세션처리 동일하게 진행하기 위해서 주석처리
//	// 인증번호 검증 요청 처리 및 사용자 로그인 처리
//	@PostMapping("/checkAuthNumber.do")
//	@ResponseBody
//	public Map<String, Object> checkAuthNumber(HttpServletRequest request, HttpSession session) {
//		int authNumber = Integer.parseInt(request.getParameter("authNumber"));
//		String csEmailId = request.getParameter("csEmailId");
//
//		Integer sessionAuthNumber = (Integer) session.getAttribute("authNumber");
//		boolean isValid = sessionAuthNumber != null && sessionAuthNumber.equals(authNumber);
//		Map<String, Object> response = new HashMap<>();
//
//		if (isValid) {
//			MemberVO member = service.getMemberByEmail(csEmailId);
//			if (member != null) {
//				session.setAttribute("member", member);
//				response.put("valid", true);
//				response.put("loginSuccess", true);
//			} else {
//				response.put("valid", true);
//				response.put("loginSuccess", false);
//				response.put("message", "User not found");
//			}
//		} else {
//			response.put("valid", false);
//			response.put("message", "Invalid auth number");
//		}
//		return response;
//	}
//	



	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
	    session.removeAttribute("loginUser");
	    return "redirect:/memberLogin.do";
	}
	
	
	
	// 11.21 모달 사용 위한 주석처리
//	@PostMapping("/checkCurrentPassword.do")
//	public String checkCurrentPassword(@RequestParam("currentPassword") String currentPassword, HttpSession session,
//			Model model) {
//		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
////	    MemberVO currentMember = (MemberVO) session.getAttribute("member");
//
//		if (loginUser != null) {
//			int csMemberCode = (int) loginUser.get("csMemberCode");
//			if (service.checkPassword(csMemberCode, currentPassword)) {
//				// 현재 비밀번호가 일치하면 비밀번호 변경 페이지로 이동
//				return "redirect:/updatePassword.do";
//			} else {
//				model.addAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
//				return "member/passwordcheck";
//			}
//		} else {
//			// 로그인한 정보가 없으면 로그인페이지로 이동
//			return "memer/login";
//		}
//	}
//
//	@PostMapping("/updatePassword.do")
//	public String updatePassword(HttpServletRequest request, HttpSession session, Model model) {
//		String newPassword = request.getParameter("newPassword");
//		String confirmPassword = request.getParameter("confirmPassword");
//
//		if (!newPassword.equals(confirmPassword)) {
//			model.addAttribute("message", "새 비밀번호가 일치하지 않습니다.");
//			return "member/passwordchangeform";
//		}
//
//		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
//		if (loginUser != null) {
//			int csMemberCode = (int) loginUser.get("csMemberCode");
//			service.updatePassword(csMemberCode, newPassword);
//
//			session.removeAttribute("loginUser");
//			model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해 주세요.");
//			return "redirect:/memberLogin.do";
//		} else {
//
//			return "memer/login";
//		}
//	}

	
	
	
	
// 11.16 기존코드 주석처리	
//	@PostMapping("/updatePassword.do")
//	public String updatePassword(@RequestParam("currentPassword") String currentPassword,
//	                             @RequestParam("newPassword") String newPassword,
//	                             HttpSession session,Model model) {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		
//		// 콘솔에 새 비밀번호 확인용 나중에지울것
//		System.out.println("사용자에게 입력받은 현재 비밀번호 : "+currentPassword);
//		System.out.println("실제 DB에 있는 현재 비밀번호 : "+member.getCsPassword());
//		System.out.println("입력받은 비밀번호 암호화     : "+encoder.encode(currentPassword));
//
//		System.out.println("동일 여부 :  "+(member.getCsPassword().equals(encoder.encode(currentPassword))));
//		
//		
//		System.out.println("변경된 비밀번호 : "+newPassword);
//	    
//		System.out.println("변경된 비밀번호 암호화 : "+encoder.encode(newPassword));
//	    
////	    if (encoder.matches(currentPassword, member.getCsPassword())) {
//	    if (BCrypt.checkpw(currentPassword, member.getCsPassword())) {	
//	        // 새 비밀번호 암호화
//	        String encodedNewPassword = encoder.encode(newPassword);        
//	        // DB에 새 비밀번호 업데이트
//	        service.updatePassword(member.getCsMemberCode(), encodedNewPassword);
//	        // 세션에서 사용자 정보 제거
//	        session.removeAttribute("member");
//	        // 비밀번호 변경 성공 메시지 로그인 페이지로 리다이렉트
//	        model.addAttribute("message","비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
////	        redirectAttrs.addFlashAttribute("passwordChangeSuccess", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");	        
//	        return "redirect:/memberLogin.do";
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
	// 11.16 새로운 로그인test위한 주석처리	
//		@PostMapping("/memberLogin.do")
//		public String memberLogin(@RequestParam("csEmailId") String csEmailId,
//		                          @RequestParam("csPassword") String csPassword,
//		                          HttpSession session, Model model) {
//		    
//			MemberVO member = service.memberLogin(csEmailId, csPassword);
//		    
//		    if (member != null) {
//		        // 로그인 성공, 세션에 사용자 정보 저장
//		        session.setAttribute("member", member);
//		        
//		        // 연동된 센터가 있는지 확인하고, 역할에 따라 적절한 페이지로 리다이렉트
//		        boolean hasConnectedCenters = member.getConnectedCenterCode1() != 0 || 
//		                                      member.getConnectedCenterCode2() != 0 ||
//		                                      member.getConnectedCenterCode3() != 0;
	//
//		        // 역할과 연동된 센터에 따라 리다이렉트
//		        if ("ME".equals(member.getCsRoleCode())) {
//		            // 회원인 경우
//		            if (hasConnectedCenters) {
//		            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
//		            } else {
////		                return "member/ctConnect"; // 센터연동페이지
//		            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
//		            }
//		        } else {
//		            // 강사인 경우
//		            if (hasConnectedCenters) {
//		            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
//		            } else {
//		                return "member/ctConnect"; // 센터연동페이지
////		            	System.out.println("로그인성공");
////		            	return "redirect:/memberMyinfo.do"; //비밀번호변경, 로그아웃테스트페이지
//		            }
//		        }
//		    } else {
//		        // 로그인 실패 메시지와 함께 로그인 페이지로 리다이렉트
//		        model.addAttribute("message" ,"존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
//		        return "redirect:memberLogin.do"; 
//		    }
//		}
		
		
	
	/**
	 * 비밀번호 변경할때 현재 비밀번호와 DB 비밀번호 비교
	 */
	@GetMapping("/passwordChange.do")
	public String passwordChange() {
		return "member/password_change";
	}


}