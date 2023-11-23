package com.dev.pilafix.member.reserve.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;

@Repository
public class ReservDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getConnCenterList");
	}

	public List<CenterLessonVO> getLessonList(int ctCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getConnCenterList");
	}
	
	

}
