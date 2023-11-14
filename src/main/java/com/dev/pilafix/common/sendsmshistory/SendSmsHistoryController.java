package com.dev.pilafix.common.sendsmshistory;

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
	@GetMapping("/center/getSendSmsHistoryInfoList.do")
	public String getSendSmsHistoryInfoList(HttpSession session,Model model) {
		//로그인 완료되면 해당 문장 삭제 
		session.setAttribute("loginUser",111);
		
		//로그인 완료되면 로그인 세션에서 꺼내오기 
		int currentUserCode = (int) session.getAttribute("loginUser");
		
		model.addAttribute("sendSmsHistoryInfoList", service.getSendSmsHistoryInfoList(currentUserCode));
		return "center/center_send_message_list";
	}
	
	/**
	 * [센터] 문자발송이력관리
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/center/getSendSmsHistoryInfo.do")
	public String getSendSmsHistoryInfo(@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistoryInfo", service.getSendSmsHistoryInfo(shSendCode));
		return "center/center_send_message_detail";
	}
	
	/**
	 * [관리자] 문자발송이력관리
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/admin/getSendSmsHistoryInfoList.do")
	public String getSendSmsHistoryInfoListAdmin(HttpSession session,Model model) {
		
		//관리자는 그냥 전체 리스트 뽑아와야 함
		// service 메서드 추가해야 함 
		//센터 디테일 끝낸 후 작업
		model.addAttribute("sendSmsHistoryInfoList", service.getSendSmsHistoryInfoList());
		return "admin/admin_send_message_list";
	}
	
	/**
	 * [관리자] 문자발송이력관리 상세
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/admin/getSendSmsHistoryInfo.do")
	public String getSendSmsHistoryInfoAdmin(@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistoryInfo", service.getSendSmsHistoryInfo(shSendCode));
		return "admin/admin_send_message_detail";
	}
	
	
}
