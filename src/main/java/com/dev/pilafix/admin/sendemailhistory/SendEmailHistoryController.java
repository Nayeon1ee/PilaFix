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
	
	
	@GetMapping("/insertSendEmailHistoryInfo.do")
	public String insertSendEmailHistoryInfo(SendEmailHistoryVO vo) {
		return "admin_SendEmailHistory/insertSendEmailHistoryInfo.jsp";
	}

	@PostMapping("/insertSendEmailHistoryInfo.do")
	public String insert(SendEmailHistoryVO vo) {
		service.insertSendEmailHistoryInfo(vo);
		return "redirect:getSendEmailHistoryInfoList.do";
	}

	@GetMapping("/updateSendEmailHistoryInfo.do")
	public String updateSendEmailHistoryInfo(@RequestParam("mhEmailSendCode") Integer mhEmailSendCode, Model model) {
		model.addAttribute("list", service.getSendEmailHistoryInfo(mhEmailSendCode));
		return "admin_SendEmailHistory/updateSendEmailHistoryInfo.jsp";
	}

	@PostMapping("/updateSendEmailHistoryInfo.do")
	public String update(SendEmailHistoryVO vo, Model model) {
		service.updateSendEmailHistoryInfo(vo);
		return "redirect:getSendEmailHistoryInfoList.do";
	}

	@GetMapping("/deleteSendEmailHistoryInfo.do")
	public String delete(int mhEmailSendCode) {
		service.deleteSendEmailHistoryInfo(mhEmailSendCode);
		return "redirect:getSendEmailHistoryInfoList.do";
	}

	@GetMapping("/getSendEmailHistoryInfoList.do")
	public String getSendEmailHistoryInfoList(Model model) {
		model.addAttribute("sendEmailHistoryInfoList", service.getSendEmailHistoryInfoList());
		return "admin_sendeamilhistory/getSendEmailHistoryInfoList.jsp";
	}

	@GetMapping("/getSendEmailHistoryInfo.do")
	public String getSendEmailHistoryInfo(@RequestParam("mhEmailSendCode") Integer mhEmailSendCode, Model model) {
		model.addAttribute("sendEmailHistoryInfo", service.getSendEmailHistoryInfo(mhEmailSendCode));
		return "admin_sendemailhistory/getSendEmailHistoryInfo.jsp";
	}
}
