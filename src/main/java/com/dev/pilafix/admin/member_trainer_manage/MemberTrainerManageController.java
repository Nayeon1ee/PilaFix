package com.dev.pilafix.admin.member_trainer_manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberTrainerManageController {
	
	@Autowired
	private MemberTrainerManageSerice service;
	
	@GetMapping("/getMemberList.do")
	public String getMemberList(Model model) {
		model.addAttribute("memberList", service.getMemberList());
		return "admin/admin_membership";
	}
	
	@GetMapping("/getTrainerList.do")
	public String getTrainerList(Model model) {
		model.addAttribute("memberList", service.getTrainerList());
		return "admin/admin_trainer";
	}
	
	@GetMapping("/getMember.do")
	public String getMemberAndPaymentListAndConnectCenterList(int csMemberCode, Model model) {
		
		MemberVO member = service.getMember(csMemberCode);
		
		//����� paymentList ��ȸ X
		if(member.getCsRoleCode().equals("TR")) {
			model.addAttribute("type", "T"); // ������� view���� �б��ϱ� ���� 
			model.addAttribute("paymentList", service.getPaymentList(csMemberCode));
		}
		
		model.addAttribute("member", member);
		model.addAttribute("centerConnectList", service.getCenterConnectHistory(csMemberCode));
		return "admin/admin_membership_detail";
	}
	
	

}
