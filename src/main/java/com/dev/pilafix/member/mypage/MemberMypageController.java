package com.dev.pilafix.member.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 * FAQ 
	 * 로그인 안해도 보이게? ?
	 */
	@GetMapping("/myFAQpage.do")
	public String showMyFAQ(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    List<FaqVO> faqList = service.getFAQListByMember();
	    model.addAttribute("FAQlist", faqList);
	    return "member/FAQ";
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

}
