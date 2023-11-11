package com.dev.pilafix.admin.sendsmshistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SendSmsHistoryController {

	@Autowired
	private SendSmsHistoryService service;
	
	@GetMapping("/getSendSmsHistoryInfoList.do")
	public String getSendSmsHistoryInfoList(Model model) {
		model.addAttribute("sendSmsHistoryInfoList", service.getSendSmsHistoryInfoList());
		return "admin/admin_send_message_list";
	}

	@GetMapping("/getSendSmsHistoryInfo.do")
	public String getSendSmsHistoryInfo(@RequestParam("shSendCode") Integer shSendCode, Model model) {
		model.addAttribute("sendSmsHistoryInfo", service.getSendSmsHistoryInfo(shSendCode));
		return "admin/admin_send_message";
	}
}
