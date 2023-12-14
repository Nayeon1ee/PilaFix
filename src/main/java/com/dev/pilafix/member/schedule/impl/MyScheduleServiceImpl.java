package com.dev.pilafix.member.schedule.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.schedule.CalenderVO;
import com.dev.pilafix.member.schedule.MyScheduleService;
import com.dev.pilafix.member.schedule.MyScheduleVO;

@Service
public class MyScheduleServiceImpl implements MyScheduleService{

	@Autowired
	private MyScheduleDAO dao;
	
	@Override
	public List<MyScheduleVO> getReservList(int csMemberCode) {
		return dao.getReservList(csMemberCode);
	}

	@Override
	public List<MyScheduleVO> getAttendList(int csMemberCode) {
		return dao.getAttendList(csMemberCode);
	}

	@Override
	public List<MyScheduleVO> getAbsentList(int csMemberCode) {
		return dao.getAbsentList(csMemberCode);
	}

	@Override
	public Map<String, Integer> getCount(int csMemberCode) {
		return dao.getCount(csMemberCode);
	}

//	@Override
//	public List<CalenderVO> getMonthSchedule(int csMemberCode,Date calenderDate) {
//		return dao.getMonthSchedule(csMemberCode,calenderDate);
//	}
	@Override
	public List<String> getMonthSchedule(int csMemberCode,Date calenderDate) {
		return dao.getMonthSchedule(csMemberCode,calenderDate);
	}

	@Override
	public Map<String,Object> getAllInfo(int csMemberCode) {
		return dao.getAllInfo(csMemberCode);
	}

//	@Override
//	public List<MyScheduleVO> getAttendanceList(int csMemberCode) {
//		return dao.getAttendanceList(csMemberCode);
//	}

}
