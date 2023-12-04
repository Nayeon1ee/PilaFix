package com.dev.pilafix.admin.login;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.AdminVO;

@Controller
public class AdminLoginController {
	@Autowired
	private AdminLoginService service;

	/**
	 * 로그인 테스트
	 * 
	 * @return
	 */
	@GetMapping("/adminLogin.do")
	public String admin_login() {
		return "admin/admin_login";
	}

	@PostMapping("adminLogin.do")
	public String adminLogin(@ModelAttribute AdminVO adminVO, HttpSession session, Model model) {
		AdminVO admin = service.loginAndGetAdmin(adminVO.getAdId(), adminVO.getAdPassword());
		if (admin != null) {
			// 로그인 성공, 세션에 사용자 정보 저장
			System.out.println("로그인성공: " + adminVO.getAdId());

			// 세션에 담을 Map 생성
			Map<String, Object> loginAdmin = new HashMap<>();
			loginAdmin.put("adCode", admin.getAdCode());
			loginAdmin.put("adName", admin.getAdName());
			// 세션에 Map 저장
			session.setAttribute("loginAdmin", loginAdmin);
//			return "redirect:/adminInfo.do"; // 테스트화면
//	        return "admin/admin_info"; //나와야할 화면 예상
			
			// 통계
			service.getTotalMemberCount();
			return "admin/admin_index";

		} else {
			// 로그인실패
			return "admin/admin_login";
		}
	}

	/**
	 * 로그인이후 우선 이동할 페이지(비밀번호변경테스트)
	 */
	@GetMapping("/adminInfo.do")
	public String adminInfo(HttpSession session, Model model) {
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin != null) {

			String adId = (String) loginAdmin.get("adId");
			AdminVO adminInfo = service.getAdminLoginInfo(adId);
			model.addAttribute("adminInfo", adminInfo);
		}
		return "admin/admin_login_info_test";
	}

	/* 모달 사용을 위한 주석 처리 */
//	/**
//	 * 비밀번호 변경할때 현재 비밀번호와 DB 비밀번호 비교
//	 */
//	@GetMapping("/checkCurrentPasswordAD.do")
//	public String getcheckCurrentPassword() {
//		return "admin/admin_password_check";
//	}
//	
//	@PostMapping("/checkCurrentPasswordAD.do")
//	public String checkCurrentPassword(@RequestParam("currentPassword") String currentPassword, HttpSession session,
//			Model model) {
//		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");
//		if (loginAdmin != null) {
//			String adCode = (String) loginAdmin.get("adCode");
//			if (service.checkPassword(adCode, currentPassword)) {
//				// 현재 비밀번호가 일치하면 비밀번호 변경 페이지로 이동
//				return "redirect:/updatePasswordAD.do";
//			} else {
//				model.addAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
//				return "admin/admin_password_check";
//			}
//		} else {
//			// 로그인한 정보가 없으면 로그인페이지로 이동
//			return "admin/admin_login";
//		}
//	}
//	
//	
//	/**
//	 * 현재 비밀번호가 일치하고 새 비밀번호 = 비밀번호확인 일 경우에 비밀번호 변경
//	 */
//	@GetMapping("/updatePasswordAD.do")
//	public String passwordChange() {
//		return "admin/admin_password_change";
//	}
//	
//	@PostMapping("/updatePasswordAD.do")
//	public String updatePassword(HttpServletRequest request, HttpSession session, Model model) {
//		String newPassword = request.getParameter("newPassword");
//		String confirmPassword = request.getParameter("confirmPassword");
//
//		if (!newPassword.equals(confirmPassword)) {
//			model.addAttribute("message", "새 비밀번호가 일치하지 않습니다.");
//			return "admin/admin_password_change";
//		}
//
//		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");
//		if (loginAdmin != null) {
//			String adCode = (String) loginAdmin.get("adCode");
//			service.updatePassword(adCode, newPassword);
//
//			session.removeAttribute("loginAdmin");
//			model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해 주세요.");
//			return "redirect:/adminLogin.do";
//		} else {
//
//			return "admin/admin_login";
//		}
//	}

	/**
	 * 비밀번호 변경 모달에서 현재 비밀번호 확인
	 * 
	 * @param payload
	 * @param session
	 * @return
	 */
	@PostMapping("/checkPasswordAD.do")
	@ResponseBody
	public ResponseEntity<?> checkCurrentPassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String currentPassword = payload.get("currentPassword");
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if (loginAdmin != null) {
			String adCode = (String) loginAdmin.get("adCode");
			boolean isPasswordCorrect = service.checkPassword(adCode, currentPassword);

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
	@PostMapping("/updatePasswordAD.do")
	@ResponseBody
	public ResponseEntity<?> updatePassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String newPassword = payload.get("newPassword");
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if (loginAdmin != null) {
			String adCode = (String) loginAdmin.get("adCode");
			service.updatePassword(adCode, newPassword);
			return ResponseEntity.ok().body(Map.of("message", "Password updated successfully"));
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("error", "User not logged in"));
		}
	}

	
	
	
	/**
	 * 로그아웃
	 */
	@PostMapping("/adminLogout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginAdmin");
		return "redirect:/adminLogin.do";
	}

}