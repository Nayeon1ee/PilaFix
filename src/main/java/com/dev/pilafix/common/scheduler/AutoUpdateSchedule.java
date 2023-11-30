package com.dev.pilafix.common.scheduler;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class AutoUpdateSchedule {

	@Autowired
	private AutoUpdateController controller;

	/**
	 * 수업 자동 폐강 ( 매 시간 55분마다 )
	 */
	@Scheduled(cron = "0 10 0 * * ?") // 매일 00시 10분에 실행
	public void autoCloseLessons() {
//		System.out.println("자동 폐강 처리 ");
//		controller.autoCloseLessons();
	}
	
	
	/**
	 * 출결테이블의 레코드 자동 생성 ( 00시 10분 )
	 */
	@Scheduled(cron = "0 10 0 * * ?") // 매일 00시 10분에 실행
	public void autoRecordAttendance() {
//		System.out.println("출결 레코드 자동 생성 동작");
//		controller.autoRecordAttendance();
	}

	/**
	 * 수강권 만료 
	 */
	@Scheduled(cron = "0 10 0 * * ?") // 매일 00시 10분에 실행
	public void autoExpiryTickets() {
//		controller.autoExpiryTickets();
	}
		
	

	
	
}
