package com.dev.pilafix.member.reserve.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.reserve.ReservVO;
import com.dev.pilafix.member.reserve.UsingTicketVO;

@Repository
public class ReservDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getConnCenterList", csMemberCode);
	}

	public List<CenterLessonVO> getLessonList(int ctCode, Date selectedDate,String lessonType) {

		Map<String, Object> params = new HashMap<>();
		params.put("ctCode", ctCode);
		params.put("selectedDate", selectedDate);
		params.put("lessonType", lessonType);
		
		return sqlSessionTemplate.selectList("ReservDAO.getLessonList", params);
	}
	
	/**
	 * 내가 가진 수강권 조회 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public MemberVO getMyTicketInfo(int csMemberCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getMyTicketInfo", csMemberCode);
	}

	/**
	 * 이용정책 조회 
	 * 
	 * @param ctCode
	 * @return
	 */
	public List<UserguideVO> getReservGuide(int ctCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getReservGuide", ctCode);
	}

	/**
	 * 수업 상세 조회 
	 * 
	 * @param lsCode
	 * @return
	 */
	public CenterLessonVO getLessonDetail(String lsCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getLessonDetail", lsCode);
	}

	/**
	 * 예약 등록 
	 * 
	 * @param csMemberCode
	 * @param ctCode
	 * @param ticketCode
	 * @param lsCode
	 * @return
	 */
	public String insertReservationInfo(int csMemberCode, int ctCode, String ticketCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("ctCode",ctCode );
		params.put("ticketCode",ticketCode );
		params.put("lsCode",lsCode );
		
		sqlSessionTemplate.insert("ReservDAO.insertReservationInfo", params);
		
		//insert된 후 가져온 key 
		String rsCode = (String) params.get("rsCode");
		System.out.println(rsCode);
		
		return rsCode;
	}
	

	public void makeReservationGroup(int csMemberCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("lsCode",lsCode );
		
		sqlSessionTemplate.update("ReservDAO.makeReservationGroup", params);
	}
	
	public void makeReservationPersonal(int csMemberCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("lsCode",lsCode );
		
		sqlSessionTemplate.update("ReservDAO.makeReservationPersonal", params);
	}
	

	/**
	 * 예약 정보 상세 조회 
	 * 
	 * @param rsCode
	 * @return
	 */
	public ReservVO getReservationInfo(String rsCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getReservationInfo", rsCode);
	}

	/**
	 * 수강권(그룹) 상세 조회  
	 * 
	 * @param memberCode
	 * @return
	 */
	public UsingTicketVO getMyTicketInfoByG(int memberCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getMyTicketInfoByG", memberCode);
	}

	/**
	 * 수강권(개인) 상세 조회  
	 * 
	 * @param memberCode
	 * @return
	 */
	public UsingTicketVO getMyTicketInfoByP(int memberCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getMyTicketInfoByP", memberCode);
	}


	/**
	 * 그룹 수업 취소 
	 * 01. 회원테이블 수강권 매수 +1
	 * 02. 수업테이블 현재신청인원 -1
	 * 03. 예약 테이블 취소여부 true
	 * 
	 * @param csMemberCode
	 * @param rsCode
	 * @param lsCode
	 */
	public void cancelReservationGroup(int csMemberCode, String rsCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("rsCode",rsCode );
		params.put("lsCode",lsCode );
		
		sqlSessionTemplate.update("ReservDAO.cancelReservationGroup", params);
	}

	/**
	 * 개인 수업 취소 
	 * 01. 회원테이블 수강권 매수 +1
	 * 02. 수업테이블 현재신청인원 -1
	 * 03. 예약 테이블 취소여부 true
	 * 
	 * @param csMemberCode
	 * @param rsCode
	 * @param lsCode
	 */
	public void cancelReservationPersonal(int csMemberCode, String rsCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("rsCode",rsCode );
		params.put("lsCode",lsCode );
		
		sqlSessionTemplate.update("ReservDAO.cancelReservationPersonal", params);
	}

	/**
	 * 예약 가능 여부 체크 
	 * 1. 기존 예약 여부 
	 * 
	 * @param csMemberCode
	 * @param lsCode
	 * @return
	 */
	public int checkReservation(int csMemberCode, String lsCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("lsCode",lsCode );
		
		return sqlSessionTemplate.selectOne("ReservDAO.checkReservation", params);
	}
	
	/**
	 * 예약 가능 여부 체크 
	 * 2. 보유 수강권 여부 
	 * 
	 * @param csMemberCode
	 * @param centerCode
	 * @return
	 */
	public int checkTicket(int csMemberCode, int centerCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("centerCode",centerCode );
		
		return sqlSessionTemplate.selectOne("ReservDAO.checkTicket", params);
	}
	
	

}
