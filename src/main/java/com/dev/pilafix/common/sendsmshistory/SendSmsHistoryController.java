package com.dev.pilafix.common.sendsmshistory;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class SendSmsHistoryController {
	
	@Autowired
	private SendSmsHistoryService service;
	
	/**
	 * [센터] 문자발송이력관리
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/getSendSmsHistoryListForCe.do")
	public String getSendSmsHistoryListForCe(HttpSession session,Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(center != null) {
			int ctCode = (int) center.get("ctCode");
			model.addAttribute("sendSmsHistoryList", service.getSendSmsHistoryListForCenter(ctCode));
			return "center/center_send_message_list";
		}
		return "redirect:loginCenter.do";
	
	}
	
	/**
	 * [센터] 문자발송이력관리
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getSendSmsHistoryForCe.do")
	public String getSendSmsHistoryForCe(@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistory", service.getSendSmsHistoryForCenter(shSendCode));
		return "center/center_send_message_detail";
	}
	
	/**
	 * [관리자] 문자발송이력관리
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/getSendSmsHistoryListForAd.do")
	public String getSendSmsHistoryListForAd(HttpSession session,Model model) {
		
		//관리자는 그냥 전체 리스트 뽑아와야 함
		// service 메서드 추가해야 함 
		//센터 디테일 끝낸 후 작업
		model.addAttribute("sendSmsHistoryList", service.getSendSmsHistoryListForAmdin());
		return "admin/admin_send_message_list";
	}
	
	/**
	 * [관리자] 문자발송이력관리 상세
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getSendSmsHistoryForAd.do")
	public String getSendSmsHistoryForAd(@RequestParam("shSendCenterCode") int shSendCenterCode,@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistory", service.getSendSmsHistoryForAmdin(shSendCenterCode,shSendCode ));
		return "admin/admin_send_message_detail";
	}
	
	
}