package com.dev.pilafix.common.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NotificationController {
	
	@Autowired
	private NotificationService service;
	
	
	/**
	 * 미확인 알림 개수 반환 
	 * (화면에 동적으로 보여지기 위함) 
	 * 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	@PostMapping("/unReadNotificationCount.do")
	@ResponseBody
	@Async
	public int sendNotification(int csMemberCode) {
		System.out.println("count호출 됨 ");
		int response = service.getUnReadNotificationCount(csMemberCode);
		return response;
	}
	
	/**
	 * 알림 리스트 반환
	 * 알림 클릭 시 보여지는 목록 
	 * @return
	 */
	@PostMapping("/getUnReadNotification.do")
	@ResponseBody
	public List<NoticeVO> getUnReadNotification(int csMemberCode){
		
		List<NoticeVO> notices = service.getUnReadNotification(csMemberCode);
		
		return notices;
	}
	
	
	/**
	 * 미확인 알림 클릭 시 확인여부 상태 업데이트 
	 * 
	 * @param ncId
	 */
	@PostMapping("/updateNoticeStatus.do")
	@ResponseBody
	public void updateNoticeStatus(String ncId) {
		service.updateNoticeStatus(ncId);
	}
	
	
	
	
	
	
}
