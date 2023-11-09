package com.dev.pilafix.admin.member_manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageSerice service;
	
	@GetMapping("/getMemberList.do")
	public String getMemberList(Model model) {
		model.addAttribute("memberList", service.getMemberList());
		return "admin_membermanage/getMemberList.jsp";
	}

	@GetMapping("/getMember.do")
	public String getMemberAndPaymentListAndConnectCenterList(int csMemberCode, Model model) {
		model.addAttribute("member", service.getMember(csMemberCode));
		model.addAttribute("paymentList", service.getPaymentList(csMemberCode));
		model.addAttribute("centerConnectList", service.getCenterConnectHistory(csMemberCode));
		return "admin_membermanage/getMember.jsp";
	}

}
