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

	/* ======================== ȸ�� ���� ======================== */ 
	/**
	 * ȸ�� ��� ��ȸ 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManageList.do")
	public String getMemberManageList(HttpSession session, Model model) {
		// ���ǿ��� �Ķ���� �޾ƿ;� ��
//        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

      
        // ȸ���� �α��εǾ� �ִ��� Ȯ��
//        if (user != null) {
            //���� ���� ��û ����Ʈ 
        	model.addAttribute("request", service.getConnectRequestForMe());
    		model.addAttribute("memberList", service.getMemberManageList());
//        } else {
            // �α��εǾ� ���� ���� ��쿡 ���� ó��
//            return "redirect:/login"; // �α��� �������� �����̷�Ʈ
//        }

        return "center/center_member_list";
	}
	
	
	/**
	 * ȸ�� �� ��ȸ 
	 * ȸ�� ����, ���� ����, ���� ���� ����, ���� ���� ��ȸ �ʿ� 
	 * 
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManage.do")
	public String getMemberManage(int csMemberCode, String csRoleCode,Model model) {
		//ȸ�� ���� 
		model.addAttribute("member", service.getMember(csMemberCode, csRoleCode));

		// �ֱ� ���� ���� ���� 
		List<QuestionVO> qlist =  service.getQuestion();
		
		// �ֱ� ���� ���� ���� ���� 
		
		
		// �ֱ� ���� ���� ����
		List<PaymentHistoryVO> payList = service.getPayment();
		
		
		return "center/center_member_detail";
	}
	
	
	
	/* ======================== ���� ���� ======================== */ 
	/**
	 * ���� ��� ��ȸ 
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
	 * ���� �� ��ȸ 
	 * ���� ���� ��Ȳ, �׷� ���� ����, ���� ���� ����, ��ü ���� ���� 
	 * 
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getTrainerManage.do")
	public String getTrainer(int csMemberCode, String csRoleCode,Model model) {
		//ȸ�� ���� 
		model.addAttribute("member", service.getMember(csMemberCode, csRoleCode));


		return "center/center_member_list";
	}
	
	
	/* ======================== ���� ======================== */ 
	/**
	 * ȸ��/���� ���� ��û ���� 
	 * 
	 * ����ó�� STEP01 - TBL_CENTER_REQUEST ��������, ���� ������Ʈ
	 * ����ó�� STEP02 - TBL_CENTER_CONN�� �̷� ���
	 * ����ó�� STEP03 - TBL_CST CONNECTED_CENTER_CODE ������Ʈ
	 * 
	 * @return ���� �� ��� ����ȸ 
	 */
	@GetMapping("/acceptRequest.do")
	public String acceptRequest(@RequestParam("crCode") String crCode, @RequestParam("memberCode") int memberCode, @RequestParam("centerCode") int centerCode) {
		service.acceptRequest(crCode, memberCode, centerCode);
		return "redirect:getMemberManageList.do";
	}
	
	/**
	 * ȸ��/���� ���� ��û ���� 
	 * 
	 * TBL_CENTER_REQUEST ���� ���� ������Ʈ
	 * 
	 * @return ���� �� ��� ����ȸ 
	 */
	@GetMapping("/rejectRequest.do")
	public String rejectRequest(@RequestParam("crCode") String crCode) {
		service.rejectRequest(crCode);
		return "redirect:getMemberManageList.do";
	}
	

}
