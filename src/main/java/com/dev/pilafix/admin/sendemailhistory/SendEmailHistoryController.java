package com.dev.pilafix.admin.sendemailhistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class SendEmailHistoryController {
	@Autowired
	private SendEmailHistoryService service;
	
	

	@GetMapping("/getSendEmailHistoryInfoList.do")
	public String getSendEmailHistoryInfoList(Model model) {
		model.addAttribute("sendEmailHistoryInfoList", service.getSendEmailHistoryInfoList());
		return "admin/admin_send_email_list";
	}

	@GetMapping("/getSendEmailHistoryInfo.do")
	public String getSendEmailHistoryInfo(@RequestParam("mhEmailSendCode") String mhEmailSendCode, Model model) {
		model.addAttribute("sendEmailHistoryInfo", service.getSendEmailHistoryInfo(mhEmailSendCode));
		return "admin/admin_send_email_detail";
	}
}
