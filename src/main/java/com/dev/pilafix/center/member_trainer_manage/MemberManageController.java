package com.dev.pilafix.center.member_trainer_manage;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.common.question.QuestionVO;


@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageService service;

	/* ======================== 회원 관리 ======================== */ 
	/**
	 * 회원 목록 조회 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManageList.do")
	public String getMemberManageList(HttpSession session, Model model) {
		// 세션에서 파라미터 받아와야 함
//        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

      
        // 회원이 로그인되어 있는지 확인
//        if (user != null) {
            //센터 연동 요청 리스트 
        	model.addAttribute("request", service.getConnectRequestForMe());
    		model.addAttribute("memberList", service.getMemberManageList());
//        } else {
            // 로그인되어 있지 않은 경우에 대한 처리
//            return "redirect:/login"; // 로그인 페이지로 리다이렉트
//        }

        return "center/center_member_list";
	}
	
	
	/**
	 * 회원 상세 조회 
	 * 회원 정보, 문의 내역, 예약 수업 내역, 결제 내역 조회 필요 
	 * 
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManage.do")
	public String getMemberManage(int csMemberCode, String csRoleCode,Model model) {
		//회원 정보 
		model.addAttribute("member", service.getMember(csMemberCode, csRoleCode));

		// 최근 문의 내역 저장 
		List<QuestionVO> qlist =  service.getQuestion();
		
		// 최근 예약 수업 내역 저장 
		
		
		// 최근 결제 내역 저장
		List<PaymentHistoryVO> payList = service.getPayment();
		
		
		return "center/center_member_detail";
	}
	
	
	
	/* ======================== 강사 관리 ======================== */ 
	/**
	 * 강사 목록 조회 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getTrainerManageList.do")
	public String getTrainerManageList(Model model) {
		model.addAttribute("request", service.getConnectRequestForTr());
		model.addAttribute("memberList",service.getTrainerManageList());
		return "center/center_trainer_list";
	}
	
	/**
	 * 강사 상세 조회 
	 * 수업 진행 현황, 그룹 수업 내역, 개인 수업 내역, 전체 수업 내역 
	 * 
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getTrainerManage.do")
	public String getTrainer(int csMemberCode, String csRoleCode,Model model) {
		//회원 정보 
		model.addAttribute("member", service.getMember(csMemberCode, csRoleCode));


		return "center/center_member_list";
	}
	
	
	/* ======================== 공통 ======================== */ 
	/**
	 * 회원/강사 연동 요청 수락 
	 * 
	 * 연동처리 STEP01 - TBL_CENTER_REQUEST 연동여부, 일자 업데이트
	 * 연동처리 STEP02 - TBL_CENTER_CONN에 이력 등록
	 * 연동처리 STEP03 - TBL_CST CONNECTED_CENTER_CODE 업데이트
	 * 
	 * @return 수락 후 목록 재조회 
	 */
	@GetMapping("/acceptRequest.do")
	public String acceptRequest(@RequestParam("crCode") String crCode, @RequestParam("memberCode") int memberCode, @RequestParam("centerCode") int centerCode) {
		service.acceptRequest(crCode, memberCode, centerCode);
		return "redirect:getMemberManageList.do";
	}
	
	/**
	 * 회원/강사 연동 요청 거절 
	 * 
	 * TBL_CENTER_REQUEST 거절 일자 업데이트
	 * 
	 * @return 거절 후 목록 재조회 
	 */
	@GetMapping("/rejectRequest.do")
	public String rejectRequest(@RequestParam("crCode") String crCode) {
		service.rejectRequest(crCode);
		return "redirect:getMemberManageList.do";
	}
	

}
