package com.dev.pilafix.member.reserve;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;


public interface ReservService {

	List<CenterVO> getConnCenterList(int csMemberCode);

	List<CenterLessonVO> getLessonList(int ctCode, Date selectedDate, String lessonType);

	Map<String, Object> getReservDetail(String lsCode, int csMemberCode, int ctCode);

	String makeReservation(int csMemberCode, int ctCode, String ticketCode, String lsCode);

	CenterLessonVO getLessonDetail(String lsCode);

	MemberVO getMyTicketInfo(int csMemberCode);

	Map<String, Object> getReservationInfoAndTicketInfo(String rsCode);

	void cancelReservation(int csMemberCode, String rsCode, String lsCode, int centerCode);

	int checkReservation(int csMemberCode, String lsCode);

}
