package com.dev.pilafix.common.scheduler;

import java.io.IOException;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 여기서 자동으로 DB 업데이트 추가 
 * @author ny
 *
 */
@Component
public class AutoUpdateSchedule {

	// 매 시간마다 실행
//	@Scheduled(cron = "* * * * * *") //초마다 실행 
	public void sendNotifications() throws IOException {
		// 스케줄러 동작 중 
		// 시간대별로 동작해야 할 작업 수행
//		service.processUnsentNotifications();
//		System.out.println("스케줄러 동작 중 ");
		
		    
	}
}
