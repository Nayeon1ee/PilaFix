package com.dev.pilafix.member.attend.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.lesson.impl.CenterLessonDAO;
import com.dev.pilafix.member.attend.AttendService;
import com.dev.pilafix.member.reserve.impl.ReservDAO;

@Service
public class AttendServiceImpl implements AttendService{
	
	@Autowired
	private AttendDAO dao;

	@Autowired
	private CenterLessonDAO lessonDAO;
	
	@Autowired
	private ReservDAO reservDAO;

	@Override
	public List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAttendancePersonalLesson() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAttendanceGroupLesson() {
		// TODO Auto-generated method stub
		
	}
	
	
	
	





}
