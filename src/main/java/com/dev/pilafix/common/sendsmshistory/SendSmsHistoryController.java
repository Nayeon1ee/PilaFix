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
	@GetMapping("/center/getSendSmsHistoryInfoList.do")
	public String getSendSmsHistoryInfoList(HttpSession session,Model model) {
		//�α��� �Ϸ�Ǹ� �ش� ���� ���� 
		session.setAttribute("loginUser",111);
		
		//�α��� �Ϸ�Ǹ� �α��� ���ǿ��� �������� 
		int currentUserCode = (int) session.getAttribute("loginUser");
		
		model.addAttribute("sendSmsHistoryInfoList", service.getSendSmsHistoryInfoList(currentUserCode));
		return "center/center_send_message_list";
	}
	
	/**
	 * [����] ���ڹ߼��̷°���
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
	 * [������] ���ڹ߼��̷°���
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/admin/getSendSmsHistoryInfoList.do")
	public String getSendSmsHistoryInfoListAdmin(HttpSession session,Model model) {
		
		//�����ڴ� �׳� ��ü ����Ʈ �̾ƿ;� ��
		// service �޼��� �߰��ؾ� �� 
		//���� ������ ���� �� �۾�
		model.addAttribute("sendSmsHistoryInfoList", service.getSendSmsHistoryInfoList());
		return "admin/admin_send_message_list";
	}
	
	/**
	 * [������] ���ڹ߼��̷°��� ��
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
