package com.dev.pilafix.common.notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 여기서 자동으로 DB 업데이트 추가 
 * @author ny
 *
 */
//@Component
public class NotificationScheduler {
//	@Autowired
//	private NotificationService service;
	
//	@Autowired
//	private NoticeDAO dao;
//
//
//	@Autowired
//	private WebSocketSessionManager sessionManager;
//	
//	// 매 시간마다 실행
//	@Scheduled(cron = "* * * * * *") //초마다 실행 
//	public void sendNotifications() throws IOException {
//		// 스케줄러 동작 중 
//		// 시간대별로 동작해야 할 작업 수행
////		service.processUnsentNotifications();
//		System.out.println("스케줄러 동작 중 ");
//		
//		
//		 List<WebSocketSession> sessions = sessionManager.getUserSessions();
//
//		    for (WebSocketSession session : sessions) {
//		        int csMemberCode = (int) session.getAttributes().get("csMemberCode");
//
//		        List<NoticeVO> noticeList = dao.getNoticesForSend(csMemberCode);
//
//		        for (NoticeVO notice : noticeList) {
//		            String ncId = notice.getNcId();
//		            String eventType = notice.getEventType();
//		            String uniqueCode = notice.getUniqueIdentifierCode();
//
//		            TextMessage sendMsg = new TextMessage("("+ncId+")" + eventType + "에 " + uniqueCode);
//		            session.sendMessage(sendMsg);
//		        }
//		    }
//		    
//		    
//	}
}
