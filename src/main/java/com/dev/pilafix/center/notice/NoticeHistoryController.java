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
		//로그인 완료되면 해당 문장 삭제 
		session.setAttribute("loginUser",111);
		
		//로그인 완료되면 로그인 세션에서 꺼내오기 
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
