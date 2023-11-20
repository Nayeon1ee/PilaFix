package com.dev.pilafix.center.member_trainer_manage;


import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.question.QuestionVO;


@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageService service;

	/* ======================== �쉶�썝 愿�由� ======================== */ 
	/**
	 * �쉶�썝 紐⑸줉 議고쉶 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManageList.do")
	public String getMemberManageList(HttpSession session, Model model) {
		// �꽭�뀡�뿉�꽌 �뙆�씪誘명꽣 諛쏆븘���빞 �븿
//        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

      
        // �쉶�썝�씠 濡쒓렇�씤�릺�뼱 �엳�뒗吏� �솗�씤
//        if (user != null) {
            //�꽱�꽣 �뿰�룞 �슂泥� 由ъ뒪�듃 
        	model.addAttribute("request", service.getConnectRequestForMe());
    		model.addAttribute("memberList", service.getMemberManageList());
//        } else {
            // 濡쒓렇�씤�릺�뼱 �엳吏� �븡�� 寃쎌슦�뿉 ���븳 泥섎━
//            return "redirect:/login"; // 濡쒓렇�씤 �럹�씠吏�濡� 由щ떎�씠�젆�듃
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
		model.addAttribute("member", service.getMember(csMemberCode));

		// 理쒓렐 臾몄쓽 �궡�뿭 ���옣 
		List<QuestionVO> qlist =  service.getQuestion();
		
		// 理쒓렐 �삁�빟 �닔�뾽 �궡�뿭 ���옣 
		
		
		// 理쒓렐 寃곗젣 �궡�뿭 ���옣
		List<PaymentHistoryVO> payList = service.getPayment();
		
		
		return "center/center_member_detail";
	}
	
	
	
	/* ======================== 媛뺤궗 愿�由� ======================== */ 
	/**
	 * 媛뺤궗 紐⑸줉 議고쉶 
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
	
	
	/* ======================== 怨듯넻 ======================== */ 
	/**
	 * �쉶�썝/媛뺤궗 �뿰�룞 �슂泥� �닔�씫 
	 * 
	 * �뿰�룞泥섎━ STEP01 - TBL_CENTER_REQUEST �뿰�룞�뿬遺�, �씪�옄 �뾽�뜲�씠�듃
	 * �뿰�룞泥섎━ STEP02 - TBL_CENTER_CONN�뿉 �씠�젰 �벑濡�
	 * �뿰�룞泥섎━ STEP03 - TBL_CST CONNECTED_CENTER_CODE �뾽�뜲�씠�듃
	 * 
	 * @return �닔�씫 �썑 紐⑸줉 �옱議고쉶 
	 */
	@GetMapping("/acceptRequest.do")
	public String acceptRequest(@RequestParam("crCode") String crCode, @RequestParam("memberCode") int memberCode, @RequestParam("centerCode") int centerCode) {
		service.acceptRequest(crCode, memberCode, centerCode);
		return "redirect:getMemberManageList.do";
	}
	
	/**
	 * �쉶�썝/媛뺤궗 �뿰�룞 �슂泥� 嫄곗젅 
	 * 
	 * TBL_CENTER_REQUEST 嫄곗젅 �씪�옄 �뾽�뜲�씠�듃
	 * 
	 * @return 嫄곗젅 �썑 紐⑸줉 �옱議고쉶 
	 */
	@GetMapping("/rejectRequest.do")
	public String rejectRequest(@RequestParam("crCode") String crCode) {
		service.rejectRequest(crCode);
		return "redirect:getMemberManageList.do";
	}
	

}
