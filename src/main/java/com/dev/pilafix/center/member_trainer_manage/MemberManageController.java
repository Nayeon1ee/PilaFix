package com.dev.pilafix.center.member_trainer_manage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


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
	public String getMemberManageList(Model model) {
		// ���� ���� ��û ��� ������ 
		// ���ǿ��� �Ķ���� �޾ƿ;� ��
		model.addAttribute("request", service.getConnectRequestForMem());
		
		model.addAttribute("memberList", service.getMemberManageList());
		return "center/center_member_list";
	}
	
	/**
	 * ȸ��/���� ���� ��û ���� 
	 * 
	 * ����ó�� STEP01 - TBL_CENTER_REQUEST ��������, ���� ������Ʈ
	 * ����ó�� STEP02 - TBL_CENTER_CONN�� �̷� ���
	 * ����ó�� STEP03 - TBL_CST CONNECTED_CENTER_CODE ������Ʈ
	 * 
	 * @return ���� �� ��� ����ȸ 
	 */
	@PostMapping("/acceptRequest.do")
	public String acceptRequest(String crCode, int memberCode, int centerCode) {
		
		service.acceptRequest(crCode, memberCode, centerCode);
		// ȸ�� �³� �� ȸ�� ��� ��ȸ�� �̵� 
		return "redirect:getMemberManageList.do";
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
		
		// �ֱ� ���� ���� ���� ���� 
		
		// �ֱ� ���� ���� ����
		
		return "center/center_member_list";
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

		// �ֱ� ���� ���� ���� 
		
		// �ֱ� ���� ���� ���� ���� 
		
		// �ֱ� ���� ���� ����
		
		return "center/center_member_list";
	}
	
	
	
	
	

}
