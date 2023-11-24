package com.dev.pilafix.member.reserve.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.reserve.ReservService;

@Service
public class ReservServiceImpl implements ReservService {
	
	@Autowired
	private ReservDAO dao;

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
    	detail.put("reservGuide", dao.getReservGuide(ctCode) ); //이용정책 
    	
		return detail;
    	
	}


}
