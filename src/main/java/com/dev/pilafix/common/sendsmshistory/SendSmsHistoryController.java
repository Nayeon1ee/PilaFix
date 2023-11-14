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
	 * [����] ���ڹ߼��̷°���
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/center/getSendSmsHistoryList.do")
	public String getSendSmsHistoryList(HttpSession session,Model model) {
		//�α��� �Ϸ�Ǹ� �ش� ���� ���� 
		session.setAttribute("loginUser",111);
		
		//�α��� �Ϸ�Ǹ� �α��� ���ǿ��� �������� 
		int currentUserCode = (int) session.getAttribute("loginUser");
		
		model.addAttribute("sendSmsHistoryList", service.getSendSmsHistoryListForCenter(currentUserCode));
		return "center/center_send_message_list";
	}
	
	/**
	 * [����] ���ڹ߼��̷°���
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/center/getSendSmsHistory.do")
	public String getSendSmsHistory(@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistory", service.getSendSmsHistoryForCenter(shSendCode));
		return "center/center_send_message_detail";
	}
	
	/**
	 * [������] ���ڹ߼��̷°���
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/admin/getSendSmsHistoryList.do")
	public String getSendSmsHistoryListAdmin(HttpSession session,Model model) {
		
		//�����ڴ� �׳� ��ü ����Ʈ �̾ƿ;� ��
		// service �޼��� �߰��ؾ� �� 
		//���� ������ ���� �� �۾�
		model.addAttribute("sendSmsHistoryList", service.getSendSmsHistoryListForAmdin());
		return "admin/admin_send_message_list";
	}
	
	/**
	 * [������] ���ڹ߼��̷°��� ��
	 * 
	 * @param shSendCode
	 * @param model
	 * @return
	 */
	@GetMapping("/admin/getSendSmsHistory.do")
	public String getSendSmsHistoryAdmin(@RequestParam("shSendCenterCode") int shSendCenterCode,@RequestParam("shSendCode") String shSendCode, Model model) {
		model.addAttribute("sendSmsHistory", service.getSendSmsHistoryForAmdin(shSendCenterCode,shSendCode ));
		return "admin/admin_send_message_detail";
	}
	
	
}
