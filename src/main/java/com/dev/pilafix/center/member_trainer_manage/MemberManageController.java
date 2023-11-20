package com.dev.pilafix.center.member_trainer_manage;



import java.sql.Date;
import java.util.List;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.question.QuestionVO;

import com.dev.pilafix.common.member.MemberVO;



@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageService service;


	/* ======================== 회원관리 ======================== */ 
	/**
	 * 회원목록 조회
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManageList.do")
	public String getMemberManageList(HttpSession session, Model model) {

		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");

        if (center != null) {
            //세션에서 받아온 값 넣어야 함
        	model.addAttribute("request", service.getConnectRequestForMe());
    		model.addAttribute("memberList", service.getMemberManageList());
    		return "center/center_member_list";
        } else {
            // 값이 없으면 로그인 페이지로 이동 
            return "redirect:centerLogin.do"; 
        }

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

	public String getMemberManage(HttpSession session, int csMemberCode, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		MemberVO member = service.getMember(csMemberCode);
		String tkCodeG = member.getTicketCodeGroup1();
		String tkCodeP= member.getTicketCodePersonal1();
		
		
		if(!center.isEmpty()) {
			//회원정보
			model.addAttribute("member", member);

			// 최근 문의 내역 저장
			model.addAttribute("QList", service.getQuestionForManage(csMemberCode));
			
			// 최근 예약 수업 내역 저장  
//			model.addAttribute("RList", service.getReserveForManage(csMemberCode));

			
			// 최근 결제 내역 저장 
			model.addAttribute("PList", service.getPaymentForManage(csMemberCode));
			
			// 수강권 정보 가져오기 
			// NullpointException 처리 값이 null이면 0으로 채워줌 
			if(tkCodeP == null) tkCodeP = "0";
			if(tkCodeG == null)	tkCodeG = "0";
			
			model.addAttribute("ticketInfo", service.getTicketInfo(tkCodeP, tkCodeG));
			
			return "center/center_member_detail";
		}
		return "redirect:centerLogin.do"; 

		
	}
	
	
	

	/* ======================== 강사관리 ======================== */ 
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
	public String getTrainerManage(int csMemberCode, String csRoleCode,Model model) {
		//회원 정보 

		model.addAttribute("member", service.getMember(csMemberCode));

		//그룹 수업내용
		
		
		model.addAttribute("groupLesson", service.getGroupLesson(csMemberCode));
		//개인 수업내용
		model.addAttribute("personalLesson", service.getPersonalLesson(csMemberCode));
		//전체 수업내용
		
		

		return "center/center_trainer_detail";
	}
	
	

	/* ======================== 공통 ======================== */ 

	/**
	 * 회원/강사 연동 요청 수락
	 * 
     * 연동처리 STEP01 - TBL_CENTER_REQUEST 연동여부, 일자 업데이트
     * 연동처리 STEP02 - TBL_CENTER_CONN에 이력 등록
     * 연동처리 STEP03 - TBL_CST CONNECTED_CENTER_CODE 업데이트
     * 
	 * @param crCode
	 * @param memberCode
	 * @param centerCode
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
	 * TBL_CENTER_REQUEST 거절 일시 업데이트 
	 * 
	 * @param crCode
	 * @return
	 */
	@GetMapping("/rejectRequest.do")
	public String rejectRequest(@RequestParam("crCode") String crCode) {
		service.rejectRequest(crCode);
		return "redirect:getMemberManageList.do";
	}
	

}
