package com.dev.pilafix.member.schedule;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface MyScheduleService {

	List<MyScheduleVO> getReservList(int csMemberCode);

	List<MyScheduleVO> getAttendList(int csMemberCode);

	List<MyScheduleVO> getAbsentList(int csMemberCode);

	Map<String, Integer> getCount(int csMemberCode);

	List<MyScheduleVO> getMonthSchedule(int csMemberCode, Date calenderDate);

}
