package com.dev.pilafix.center.login;

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

import com.dev.pilafix.common.member.CenterVO;


@Controller
public class CenterLoginController {
	
	@Autowired
	private CenterLoginService service;
	
	/**
	 * 사이드 네비바 뱃지에 숫자출력
	 * (연동요청 온 회원,강사 수 / 답변안달린 문의사항 수)
	 * @param session
	 * @return
	 */
	@PostMapping("/getCount.do")
	@ResponseBody
	public CenterVO countForBadge(HttpSession session) {
		Map<String,Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		int ctCode = (int) center.get("ctCode");
		System.out.println("컨트롤러에서 센터코드 잘 가져오는지 테스트"+ctCode);
		return service.countForBadge(ctCode);
		
	}
	
	@GetMapping("/centerMain.do")
	public String centerMainPage(HttpSession session, Model model) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
		if (loginCenter != null) {
			return "center/center_index";
		} else {
			// 로그인 실패
			return "center/center_login";
		}
	}
	
	
	/**
	 * 로그인 테스트
	 * @return
	 */
	@GetMapping("/centerLogin.do")
	public String center_login() {
		return "center/center_login";
	}
	
	@PostMapping("/centerLogin.do")
	public String centerLogin(@ModelAttribute CenterVO centerVO, HttpSession session, Model model) {
		CenterVO center = service.loginAndGetCenter(centerVO.getCtId(), centerVO.getCtPassword());
		if (center != null) {
			//로그인 성공, 세션에 사용자 정보 저장
			System.out.println("로그인성공: " + centerVO.getCtId());
			
			//세션에 담을 Map 생성
			Map<String, Object> loginCenter = new HashMap<>();
	        loginCenter.put("ctCode", center.getCtCode());
	        loginCenter.put("ctName", center.getCtName());
	        
	        // 세션에 Map 저장 
	        session.setAttribute("loginCenter", loginCenter);
//	        return "redirect:/centerInfo.do"; // 테스트화면
	        
	        Map<String, Object> loginCenter1 = (Map<String, Object>) session.getAttribute("loginCenter");
	        int ctCode = (int) loginCenter1.get("ctCode");
	        model.addAttribute("count",service.getTotalCenterCount(ctCode));
	        System.out.println( model.getAttribute("count"));
	       	        
	        return "center/center_index";
	        
		}else {
			//로그인 실패
			return "center/center_login";
		}
	}
	
	
	/**
	 * 로그인 이후 우선 이동할페이지 (비밀번호변경테스트)
	 */
	
	@GetMapping("/centerMypage.do")
	public String centerInfo(HttpSession session, Model model) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
		if (loginCenter != null) {
			String ctId = (String) loginCenter.get("ctId");
			int ctCode = (int) loginCenter.get("ctCode");
			CenterVO centerInfo = service.getCenterAllInfoByCode(ctCode);
			model.addAttribute("centerInfo",centerInfo);
			return "center/center_mypage"; 
		}else {
			return "center/center_login";
		}

	}
	
	/**
	 * 비밀번호 변경 모달에서 현재 비밀번호 확인
	 * 
	 * @param payload
	 * @param session
	 * @return
	 */
	@PostMapping("/checkPasswordCT.do")
	@ResponseBody
	public ResponseEntity<?> checkCurrentPassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String currentPassword = payload.get("currentPassword");
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

		if (loginCenter != null) {
			int ctCode = (int) loginCenter.get("ctCode");
			boolean isPasswordCorrect = service.checkPassword(ctCode, currentPassword);

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
	@PostMapping("/updatePasswordCT.do")
	@ResponseBody
	public ResponseEntity<?> updatePassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String newPassword = payload.get("newPassword");
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

		if (loginCenter != null) {
			int ctCode = (int) loginCenter.get("ctCode");
			service.updatePassword(ctCode, newPassword);
			return ResponseEntity.ok().body(Map.of("message", "Password updated successfully"));
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("error", "User not logged in"));
		}
	}	
	
	/**
     * 로그아웃
     * @param session
     * @return
     */
	@PostMapping("/centerLogout.do")
	public String logout(HttpSession session) {
	    session.removeAttribute("loginCenter");
	    return "redirect:/centerLogin.do";
	}
	
	
	@GetMapping("/centerLogout.do")
	public String getlogout(HttpSession session) {
	    session.removeAttribute("loginCenter");
	    return "redirect:/centerLogin.do";
	}
	
  /**
	 * 통계 : 월별 수강권 판매 금액
	 * @return
	 */
	@PostMapping("monthlyAmount.do")
	@ResponseBody
	public Map<String,Object> monthlyAmount(HttpSession session) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
		int ctCode = (int) loginCenter.get("ctCode");
		return service.monthlyAmount(ctCode);
	}
	
	/**
	 * 통계 : 월별 수강권 판매 금액
	 * @return
	 */
	@PostMapping("getPopularLesson.do")
	@ResponseBody
	public Map<String,Object> getPopularLesson(HttpSession session) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
		int ctCode = (int) loginCenter.get("ctCode");
		return service.getPopularLesson(ctCode);
	}
	
}