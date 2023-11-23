package com.dev.pilafix.member.reserve.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;
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
	public List<CenterLessonVO> getLessonList(int ctCode) {
		return dao.getLessonList(ctCode);
	}

}
