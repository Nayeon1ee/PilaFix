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
	 * 수업 자동 폐강 ( 매 시간 정각에 )
	 */
	@Scheduled(cron = "0 0 0/1 1/1 * ?") // 0분 0초부터 59분 59초 사이의 모든 시간에 1시간 간격으로 작업을 실행
	public void autoCloseLessons() {
		System.out.println("자동 폐강 처리 ");
		controller.autoCloseLessons();
	}
	

	/**
	 * 수강권 자동 만료 처리
	 */
	@Scheduled(cron = "0 0 0 * * ?") // 매일 00시 00분에 실행
	public void autoExpiryTickets() {
		controller.autoExpiryTickets();
	}
	
	/**
	 * 테스트용 자동 출결 처리 
	 * 시간 지나면 출석 여부 true로 업데이트 
	 */
    @Scheduled(cron = "0 */50 * * * *") // 매 50분마다 실행됨 
	public void autoUpdateAttendStatus() {
		controller.autoUpdateAttendStatus();
	}
	
	/**
	 * 현재 사용 x
	 * 출결테이블의 레코드 자동 생성 ( 00시 10분 ) 
	 * 
	 */
//	@Scheduled(cron = "0 10 0 * * ?") // 매일 00시 10분에 실행
	public void autoRecordAttendance() {
//		System.out.println("출결 레코드 자동 생성 동작");
//		controller.autoRecordAttendance();
	}

	
	
}
