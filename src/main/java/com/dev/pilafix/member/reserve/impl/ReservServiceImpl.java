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
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.impl.NoticeDAO;
import com.dev.pilafix.member.reserve.ReservService;
import com.dev.pilafix.member.reserve.ReservVO;

@Service
public class ReservServiceImpl implements ReservService {
	
	@Autowired
	private ReservDAO dao;
	
	@Autowired
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
	public List<CenterLessonVO> getLessonList(int ctCode,Date selectedDate, String lessonType) {
		return dao.getLessonList(ctCode, selectedDate, lessonType);
	}
	

	/**
	 * 문자 발송을 위한 수업 상세 조회
	 */
	@Override
	public CenterLessonVO getLessonDetail(String lsCode) {
		return dao.getLessonDetail(lsCode);
	}
	
	/**
	 * 내가 가진 수강권 정보 조회 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	@Override
	public MemberVO getMyTicketInfo(int csMemberCode) {
		return dao.getMyTicketInfo(csMemberCode);
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

	/**
	 * 예약 
	 */
	@Override
	@Transactional
	public String makeReservation(int csMemberCode, int ctCode, String ticketCode, String lsCode) {
		
		/* STEP01. 예약 테이블 등록 */
		String rsCode = dao.insertReservationInfo(csMemberCode, ctCode, ticketCode, lsCode);
		System.out.println("ServiceImple에서 받은 rsCode 예약 번호 : "+rsCode);
		
		CenterLessonVO lesson = dao.getLessonDetail(lsCode);
		
		/* 
		 * STEP02. 회원 테이블의 잔여 수강권 매수 -1 
		 * STEP03. 수업 테이블의 현재 신청 인원 +1
		 * STEP04. 출결레코드 해당 회원 정보 추가 
		 * 
		 */
		if(lesson.getLsType().equals("그룹")) {
			System.out.println("그룹 업데이트 호출됨 ");
			dao.makeReservationGroup(csMemberCode, lsCode );
		}else {
			System.out.println("개인 업데이트 호출됨 ");
			dao.makeReservationPersonal(csMemberCode, lsCode );
		}
		
		
		/* STEP05. 알림 테이블의 등록 */
		NoticeVO notice = new NoticeVO();
		 notice.setMemberCode(csMemberCode);
		 notice.setRecipientCode(String.valueOf(ctCode)); 
		 notice.setEventType("예약");
		 notice.setUniqueIdentifierCode(rsCode); //위에서 받아온 예약번호 반환값 넣어야 함
		 notice.setNcNoticeContent(lesson.getLsDate()+" "+lesson.getLsTime()+" "+lesson.getLsName()+" 예약이 완료되었습니다!"); 
        noticeDAO.insertNotice(notice);

		/*
		 * STEP06. 문자 발송
		 * STEP07. 문자 발송 이력 등록
		 * ==> 화면에서 ajax로 요청 
		 */
		
		return rsCode;
	}


	/**
	 * 예약 취소 페이지 조회
	 */
	@Override
	public Map<String, Object> getReservationInfoAndTicketInfo(String rsCode) {
		Map<String, Object> detail = new HashMap<>();
		
		// STEP1. 예약 번호로 예약 정보 조회
		ReservVO reservation = dao.getReservationInfo(rsCode); 
		detail.put("reservation", reservation);
		
		// STEP2. 예약정보-수업코드로 수업테이블 조회
		CenterLessonVO lesson = dao.getLessonDetail(reservation.getLessonCode());
		detail.put("lesson", lesson);
		
		// STEP3. memberCode로 수강권 조회 
		MemberVO ticket = dao.getMyTicketInfo(reservation.getMemberCode());
		
		// STEP4. 위에서 받은 수업vo의 lsType이 그룹이면 map에 ~ticketCodeGroup만 저장 / 개인이면 ~ticketCodePersonal만 저장 
		if(lesson.getLsType().equals("그룹")) {
			detail.put("ticket", dao.getMyTicketInfoByG(reservation.getMemberCode()));
		}else {
			detail.put("ticket", dao.getMyTicketInfoByP(reservation.getMemberCode()));
		}
		
		// STEP5. 위에서 받은 center_code로 이용정책 조회 
		detail.put("reservGuideList", dao.getReservGuide(reservation.getCenterCode()) ); 
    	
		return detail;
	
	}

	/**
	 * 예약 취소 
	 */
	@Override
	@Transactional
	public void cancelReservation(int csMemberCode, String rsCode, String lsCode, int centerCode) {
		CenterLessonVO lesson = dao.getLessonDetail(lsCode);
		
		/*
		 * dao.cancelGroupLesson/dao.cancelPersonalLesson 호출 시 
		 * 
		 * STEP01. 회원 테이블에서 수강권 매수 +1 (개인/그룹 구분)
		 * STEP02. 수업 테이블에 현재 신청 인원 -1
		 * STEP03. 예약 테이블의 취소 여부 true
		 * STEP04. 출결 테이블의 회원코드 지우기 
		 * 
		 */
		if(lesson.getLsType().equals("그룹")) {
			System.out.println("그룹 업데이트 호출됨 ");
			dao.cancelReservationGroup(csMemberCode, rsCode, lsCode );
		}else {
			System.out.println("개인 업데이트 호출됨 ");
			dao.cancelReservationPersonal(csMemberCode, rsCode, lsCode );
		}
		
		/* STEP05. insert 알림 테이블 이력 쌓기 */
		NoticeVO notice = new NoticeVO();
		 notice.setMemberCode(csMemberCode);
		 notice.setRecipientCode(String.valueOf(centerCode)); 
		 notice.setEventType("예약취소");
		 notice.setUniqueIdentifierCode(rsCode); //위에서 받아온 예약번호 반환값 넣어야 함
		 notice.setNcNoticeContent(lesson.getLsDate()+" "+lesson.getLsTime()+" "+lesson.getLsName()+" 예약이 취소되었습니다."); 
        noticeDAO.insertNotice(notice);
		
	}

	/**
	 * 예약 가능 여부 체크 
	 */
	@Override
	public Map<String, Integer> checkReservationAndTicket(int csMemberCode, String lsCode, int centerCode) {
		Map<String, Integer> checkResult = new HashMap<>();
		checkResult.put("checkReservation", dao.checkReservation(csMemberCode, lsCode));
		checkResult.put("checkTicket",dao.checkTicket(csMemberCode, centerCode));
		
		return checkResult;
	}
	
	


}
