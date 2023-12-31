package com.dev.pilafix.common.scheduler;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.member.attend.AttendVO;

@Service
public class AutoUpdateService {
	
	@Autowired
	private AutoUpdateDAO dao;
	
	/**
	 * 수업 테이블에서 당일 신청인원이 1명 이상이면서 개강여부가 TRUE이면서 수업날짜가 오늘날짜인 수업 코드 조회
	 * 
	 * @return
	 */
	public List<String> getOpenLessonCodesForToday() {
		Date today = new Date();
		return dao.getOpenLessonCodesForToday(today);
	}

	/**
	 * 예약 테이블에서 수업코드를 기준으로 해당하는 회원 코드 목록 조회 
	 * @param lessonCode
	 * @return
	 */
	public List<Integer> getMemberCodesByLessonCode(String lessonCode) {
		return dao.getMemberCodesByLessonCode(lessonCode);
	}

	/**
	 * 출결 레코드 생성 
	 * @param attend
	 */
	public void insertAttendance(AttendVO attend) {
		dao.insertAttendance(attend);
	}

	/**
	 * 수강권 자동 만료 처리 
	 */
	public void autoExpiryTickets() {
		try {
			dao.autoExpiryTicketsForGroup();
			dao.autoExpiryTicketsForPersonal();
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

	/**
	 * 자동 폐강 처리
	 * 폐강 대상 : 수업시작 3시간 전이면서 신청인원이 0인 수업
	 * 
	 * 1. 조건에 해당하는 수업 리스트 폐강 처리 
	 * 
	 */
	public void autoCloseLessons() {		
		dao.updateLessonsClosingYn();
	}
	
	/**
	 * 자동 출결 처리 
	 * 대상: 현재 시간 기준으로 수업시작 경과 50분 후 출결여부가 false
	 * 
	 * 1. 출결여부 true  
	 */
	public void autoUpdateAttendStatus() {
		dao.updateAttendStatus();
	}

}
