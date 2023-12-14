package com.dev.pilafix.common.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.pilafix.member.attend.AttendVO;

@Controller
public class AutoUpdateController {

	@Autowired
	private AutoUpdateService service;

	/**
	 * 출결테이블의 레코드 자동 생성 ( 00시 10분 )
	 */
	@GetMapping("/recordAttendance.do")
	public void autoRecordAttendance() {
		/* 01. 수업 테이블에서 당일 신청인원이 1명 이상이면서 개강여부가 TRUE이면서 수업날짜가 오늘날짜인 수업 코드 조회 */
		List<String> lessonCodes = service.getOpenLessonCodesForToday();

		/* 02. 얻은 수업 코드를 기준으로 예약 테이블에서 해당하는 회원 코드 목록 조회 */
		for (String lessonCode : lessonCodes) {
			List<Integer> memberCodes = service.getMemberCodesByLessonCode(lessonCode);

			AttendVO attend = new AttendVO();
            attend.setLessonCode(lessonCode);
            
			/* 03. 신청인원만큼 코드, 출결여부 세팅  */
			for (int i = 1; i <= memberCodes.size(); i++) {
				int atMemberCode = memberCodes.get(i - 1);

	            switch (i) {
	                case 1:
	                    attend.setAtMember1Code(atMemberCode);
	                    attend.setAtAttendance1Yn(false); 
	                    break;
	                case 2:
	                    attend.setAtMember2Code(atMemberCode);
	                    attend.setAtAttendance2Yn(false);
	                    break;
	                case 3:
	                    attend.setAtMember3Code(atMemberCode);
	                    attend.setAtAttendance3Yn(false);
	                    break;
	                case 4:
	                    attend.setAtMember4Code(atMemberCode);
	                    attend.setAtAttendance4Yn(false);
	                    break;
	                case 5:
	                    attend.setAtMember5Code(atMemberCode);
	                    attend.setAtAttendance5Yn(false);
	                    break;
	                case 6:
	                    attend.setAtMember6Code(atMemberCode);
	                    attend.setAtAttendance6Yn(false);
	                    break;
	            }
	            System.out.println(attend.toString());
	           
			}//멤버세팅 끝   
			service.insertAttendance(attend);//출결 레코드 생성 
		}

	}

	/**
	 * 수업 폐강 처리 
	 */
	public void autoCloseLessons() {
		service.autoCloseLessons();
	}

	/**
	 * 수강권 자동 만료 처리
	 */
	public void autoExpiryTickets() {
		service.autoExpiryTickets();
	}

	/**
	 * 자동 출결 처리 
	 */
	public void autoUpdateAttendStatus() {
		service.autoUpdateAttendStatus();
	}

}
