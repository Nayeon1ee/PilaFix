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

	public MemberVO getMyTicketInfo(int csMemberCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getMyTicketInfo", csMemberCode);
	}

	public List<UserguideVO> getReservGuide(int ctCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getReservGuide", ctCode);
	}

	public CenterLessonVO getLessonDetail(String lsCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getLessonDetail", lsCode);
	}

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

	public void updateRemainingTicketCount(int csMemberCode) {
		sqlSessionTemplate.update("ReservDAO.updateRemainingTicketCount", csMemberCode);
	}

	public void updateCurrentApplicants(String lsCode) {
		sqlSessionTemplate.update("ReservDAO.updateCurrentApplicants", lsCode);
	}

	public ReservVO getReservationInfo(String rsCode) {
		return sqlSessionTemplate.selectOne("ReservDAO.getReservationInfo", rsCode);
	}

	

}
