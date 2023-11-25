package com.dev.pilafix.member.reserve.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.notice.NoticeDAO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.member.reserve.ReservService;

@Service
public class ReservServiceImpl implements ReservService {
	
	@Autowired
	private ReservDAO dao;
	private NoticeDAO noticeDAO;

	/**
	 * 연동된 센터 목록 조회
	 */
	@Override
	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return dao.getConnCenterList(csMemberCode);
	}

	/**
	 * 연동된 센터의 수업 내역 조회 
	 */
	@Override
	public List<CenterLessonVO> getLessonList(int ctCode,Date selectedDate) {
		return dao.getLessonList(ctCode, selectedDate);
	}

	/**
	 * 예약하기 버튼 클릭 시 상세 정보 조회 
	 * 
	 * 1. 클릭한 수업 정보 (param : lsCode)
	 * 2. 내가 가진 수강권 정보 (param: csMemberCode) 
	 * 3. 센터의 예약 이용정책 정보 (param: ctCode)
	 * 
	 */
	@Override
	@Transactional
	public Map<String, Object> getReservDetail(String lsCode, int csMemberCode, int ctCode) {
		Map<String, Object> detail = new HashMap<>();
		
		detail.put("lessonDetail", dao.getLessonDetail(lsCode)); // 클릭한 수업 정보 
		detail.put("myTicket", dao.getMyTicketInfo(csMemberCode)); // 수강권 정보
    	detail.put("reservGuideList", dao.getReservGuide(ctCode) ); //이용정책 
    	
		return detail;
    	
	}

	@Override
	@Transactional
	public void makeReservation(int csMemberCode, int ctCode, String ticketCode, String lsCode) {
		 /*
		  * 1. insert 예약 테이블에 쌓이고 
		  * 2. update 회원테이블에서 수강권 매수 -1
		  * 3. update 수업 테이블에 현재 신청 인원 + 1
		  * 4. insert 알림 테이블에 쌓기 		
		  */
		
		/* STEP01. 예약 테이블 등록 */
//		dao.insertReservationInfo(csMemberCode, ctCode, ticketCode, lsCode);
		//여기서 반환값으로 예약 번호 받아야 함 
		
		/* STEP02. 회원 테이블의 잔여 수강권 매수 -1 */
//		dao.updateRemainingTicketCount(ticketCode, csMemberCode);
		
		/* STEP03. 수업 테이블의 현재 신청 인원 +1 */
//		dao.updateCurrentApplicants(lsCode);
		
		/* STEP04. 알림 테이블의 등록 */
		NoticeVO notice = new NoticeVO();
		 notice.setMemberCode(csMemberCode);
		 notice.setRecipientCode(String.valueOf(ctCode)); 
		 notice.setEventType("예약");
		 notice.setUniqueIdentifierCode(""); //위에서 받아온 예약번호 반환값 넣어야 함
		 notice.setNcNoticeContent("[공지] "); //여기서 내용을 수업 테이블의 정보 가져와서 내용 넣기
		 notice.setNcSendYn(false);
		 notice.setNcReadYn(false);
		 
		noticeDAO.insertNotice(notice);

	
	
	}


}
