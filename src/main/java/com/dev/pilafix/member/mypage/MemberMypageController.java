package com.dev.pilafix.member.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.admin.info.AdminInfoVO;
import com.dev.pilafix.admin.terms.TermsVO;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;

@Controller
public class MemberMypageController {
	@Autowired
	private MemberMypageService service;

	// 공지사항 myNoticePage.do
	// 연동센터관리 myConnectedCenter.do
	// FAQ myFAQpage.do
	// 문의사항 questionPage.do
	// 약관및정책 myTermsPage.do
	// 내정보관리 myInfoManage.do
	// ct.do
	@GetMapping("/myPage.do")
	public String ShowMypage(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");

			MemberVO personalTicket = service.getPersonalTicketByMember(csMemberCode);
			MemberVO groupTicket = service.getGroupTicketByMember(csMemberCode);

			model.addAttribute("personalTicket", personalTicket);
			model.addAttribute("groupTicket", groupTicket);

			return "member/member_mypage";
		} else {
			return "member/login";
		}
	}

	/**
	 * 결제내역페이지
	 */
	@GetMapping("/getPaymentHistory.do")
	public String getPaymentHistory(HttpSession session, Model model) {

		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int csMemberCode = (int) user.get("csMemberCode");

		model.addAttribute("paymentInfo", service.getMyPaymentInfo(csMemberCode));

		return "member/paymentHistory";
	}

	@GetMapping("/getPaymentHistoryDetail.do")
	public String getPaymentHistoryDetail() {
		return "member/paymentHistory_detail";
	}

	/**
	 * 연동센터관리페이지
	 */
	@GetMapping("/myConnectedCenter.do")
	public String myConnCenterList(HttpSession session, Model model) {

		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			List<CenterVO> centerList = service.getConnectedCenterList(csMemberCode);
			model.addAttribute("centerList", centerList);
			return "member/center_linkmanagement";
		} else {

			return "member/login";
		}

	}

	/**
	 * 연동센터 해제
	 * 
	 * @param session
	 * @param selectedCenterCode
	 * @param model
	 * @return
	 */
	@PostMapping("/disconnectCenter.do")
	public String disconnectCenter(HttpSession session,
	        @RequestParam(name = "selectedCenterCode") int selectedCenterCode, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");

			// 연동센터 해제 로직 호출
			int result = service.disconnectCenter(csMemberCode, selectedCenterCode);

			if (result > 0) {
				// 연동센터 해제가 성공
				return "redirect:/myConnectedCenter.do";
			} else {
				// 연동센터 해제 실패
				model.addAttribute("errorMessage", "연동센터 해제에 실패하였습니다.");
				return "redirect:/myConnectedCenter.do";
			}
		} else {
			// 로그인되어 있지 않은 경우 로그인 페이지로 이동
			return "member/login";
		}
	}

	/**
	 * 공지사항
	 * 센터/필라픽스
	 */
	@GetMapping("/myNoticePage.do")
	   public String showNoticePage(HttpSession session,Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
        // 센터 정보를 가져오는 메서드
        List<CenterInfoVO> centerInfoList = service.getCenterInfoListByMember(csMemberCode);
        // 필라픽스 정보를 가져오는 메서드
        List<AdminInfoVO> pilafixInfoList = service.getAdminInfoListByMember(csMemberCode);

        // 모델에 데이터를 저장하여 화면에 전달
        model.addAttribute("centerInfoList", centerInfoList);
        model.addAttribute("pilafixInfoList", pilafixInfoList);

        return "member/member_notice"; 
    }else {
    	return "member/login";
    }
	}
	

	/**
	 * 조회수증가
	 * @param icNumber
	 */
	@PostMapping("/increaseInfoViewCount.do")
	public ResponseEntity<?> increaseViewCount(
		    @RequestParam(name = "icNumber", required = false, defaultValue = "0") int icNumber,
		    @RequestParam(name = "iwNumber", required = false, defaultValue = "0") int iwNumber) {
		try {
	        // 서비스 메서드를 호출하여 조회수를 증가시킵니다.
	        if(icNumber > 0) {
	        	service.increaseCenterInfoViewCount(icNumber);
	        } else if(iwNumber > 0) {
	        	service.increaseAdminInfoViewCount(iwNumber);
	        }
	        
	        // 성공적으로 조회수가 증가되었을 때의 처리를 작성합니다.
	        return ResponseEntity.ok().build();
	    } catch (Exception e) {
	        // 오류 발생 시 처리를 작성합니다.
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}

	/**
	 * 공지사항 상세
	 * 센터 공지사항 / 필라픽스 공지사항에 따라 화면 분기
	 */
	@GetMapping("/noticeDetail.do")
    public String showNoticeDetail(@RequestParam(value = "icNumber", required = false) Integer icNumber,
                                   @RequestParam(value = "iwNumber", required = false) Integer iwNumber,
                                   Model model) {
        // 센터 공지사항
        if (icNumber != null) {
            CenterInfoVO centerNotice = service.getCenterInfoByMember(icNumber);
            model.addAttribute("centerNotice", centerNotice);
            model.addAttribute("type", "center");
            return "member/member_notice_detail";
        }
        // 웹(필라픽스)공지사항
        else if (iwNumber != null) {
            AdminInfoVO webNotice = service.getAdminInfoByMember(iwNumber);
            model.addAttribute("webNotice", webNotice);
            model.addAttribute("type", "pilafix");
            return "member/member_notice_detail";
        }
        else {
        	System.out.println("공지사항 번호가 없는 경우");
        	return "member/member_notice"; 
        }

    }	
	
//	@GetMapping("/myNoticeDetail.do")
//	public String showNotiveDetail(@RequestParam("icNumber") int icNumber,@RequestParam("iwNumber") int iwNumber, HttpSession session,Model model) {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//			CenterInfoVO centerInfo;
//			AdminInfoVO adminInfo;
//			model.addAttribute("centerInfo", service.getCenterInfoByMember(icNumber));
//			model.addAttribute("adminInfo", service.getAdminInfoByMember(iwNumber));
//			return "member/member_notice_detail";
//		}



	/**
	 * FAQ 
	 * 회원/강사에 따라 다르게보임
	 */
	@GetMapping("/myFAQpage.do")
	public String showMyFAQ(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if(user != null) {
		String csRoleCode = (String)user.get("csRoleCode");	
	    List<FaqVO> faqList = service.selectFAQbyRole(csRoleCode);
	    model.addAttribute("FAQlist", faqList);
	    return "member/FAQ";
		
		} else {
			return "member/login";
		}
	}

	/**
	 * 약관 및 정책
	 * 로그인 안해도 보이게? ?
	 */
	@GetMapping("/myTermsPage.do")
	public String showMyTerms(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		List<TermsVO> termsList = service.getMyTermsListByMember();
	    model.addAttribute("termsList", termsList);
	    return "member/member_terms";

	}

	/**
	 * 내정보관리
	 */
	@GetMapping("/myInfoManage.do")
	public String showMyinfoManage(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("myInfo", service.getMypageMemberInfo(csMemberCode));
			return "member/myinfo_management";
		} else {
			return "member/login";
		}

	}

	/**
	 * 회원탈퇴
	 */
	@GetMapping("/withdrawal.do")
	public String withdraw(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			service.withdrawMember(csMemberCode);
			return "member/withdrawal";
			
		} else {
			return "member/login";
		}
	}
	
	
	// 회원 탈퇴 요청 처리
	@PostMapping("/withdrawal.do")
	@ResponseBody
	public String withdraw(@RequestBody Map<String, String> payload, HttpSession session) {
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user != null) {
	        String password = payload.get("password");
	        int csMemberCode = (int) user.get("csMemberCode");

	        // 비밀번호 확인 로직
	        boolean isPasswordValid = service.checkPassword(csMemberCode, password);

	        if (isPasswordValid) {
	            service.withdrawMember(csMemberCode);
	            session.invalidate(); // 세션 무효화
	            return "{\"status\":\"success\"}";
	        } else {
	            // 비밀번호가 틀렸을 경우
	            return "{\"status\":\"error\", \"message\":\"Invalid password\"}";
	        }
	    } else {
	        // 로그인하지 않은 경우
	        return "{\"status\":\"error\", \"message\":\"Not logged in\"}";
	    }

	
	}	

}