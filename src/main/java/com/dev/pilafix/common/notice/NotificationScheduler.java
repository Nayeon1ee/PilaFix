package com.dev.pilafix.common.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class NotificationScheduler {
	@Autowired
	private NotificationService service;


// 매 시간마다 실행
//	@Scheduled(cron = "* * * * * *") //초마다 실행 
//	public void sendNotifications() {
//		// 스케줄러 동작 중 
//		// 시간대별로 동작해야 할 작업 수행
////		service.processUnsentNotifications();
//		System.out.println("스케줄러 동작 중 ");
//	}
}
