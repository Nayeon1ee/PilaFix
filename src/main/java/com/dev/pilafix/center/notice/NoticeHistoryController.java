package com.dev.pilafix.center.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeHistoryController {
	
	@Autowired
	private NoticeHistoryService service;
	
	@GetMapping("/getNoticeHistoryList.do")
	public String getNoticeHistoryList(HttpSession session, Model model) {
		//�α��� �Ϸ�Ǹ� �ش� ���� ���� 
		session.setAttribute("loginUser",111);
		
		//�α��� �Ϸ�Ǹ� �α��� ���ǿ��� �������� 
		int currentUserCode = (int) session.getAttribute("loginUser");
		
		model.addAttribute("noticeHistoryList",service.getNoticeHistoryList(currentUserCode));
		
		return "center/center_notice_history_list";
	}
	
	@GetMapping("/getNoticeHistory.do")
	public String getNoticeHistory(@RequestParam("ncId") String ncId, Model model) {

		model.addAttribute("noticeHistory",service.getNoticeHistory(ncId));
		
		return "center/center_notice_history_detail";
	}

}
