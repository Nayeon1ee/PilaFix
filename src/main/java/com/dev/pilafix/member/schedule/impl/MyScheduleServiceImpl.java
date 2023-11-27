package com.dev.pilafix.member.schedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
