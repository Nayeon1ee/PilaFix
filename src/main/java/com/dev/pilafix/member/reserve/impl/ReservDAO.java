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

@Repository
public class ReservDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getConnCenterList", csMemberCode);
	}

	public List<CenterLessonVO> getLessonList(int ctCode, Date selectedDate) {

		Map<String, Object> params = new HashMap<>();
		params.put("ctCode", ctCode);
		params.put("selectedDate", selectedDate);
		
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

}
