package com.dev.pilafix.common.scheduler;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
			Date today = new Date();
			dao.autoExpiryTicketsForGroup(today);
			dao.autoExpiryTicketsForPersonal(today);
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

}
